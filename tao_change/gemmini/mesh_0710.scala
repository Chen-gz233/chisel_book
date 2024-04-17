//DO NOT TOUCH
package gemmini

import chisel3._
import chisel3.util._

import Util._

class PEControl[T <: Data : Arithmetic](accType: T) extends Bundle {
  val dataflow = UInt(1.W)
  val in_pe_flush = UInt(1.W)
  val shift = UInt(log2Up(accType.getWidth).W)
}

class MeshReq[T <: Data : Arithmetic, TagT <: TagQueueTag with Data](accType: T, tagType: TagT, block_size: Int) extends Bundle {
  val pe_control = new PEControl(accType)
  val a_transpose = Bool()
  val bd_transpose = Bool()
  val total_rows = UInt(log2Up(block_size + 1).W)
  val tag = tagType
  val flush = UInt(2.W)
  val if_d_in = Bool()
}

class MeshResp[T <: Data : Arithmetic, TagT <: TagQueueTag with Data](outType: T, meshCols: Int,  block_size: Int, tagType: TagT) extends Bundle {
  val data = Vec(meshCols, Vec(meshCols, outType))
  val total_rows = UInt(log2Up(block_size + 1).W)
  val tag = tagType
  val last = Bool()
}



class MeshNew[T <: Data: Arithmetic, U <: TagQueueTag with Data]
(inputType: T, val outputType: T, accType: T,tagType: U,
 dataNumToPe: Int,
 meshRows: Int, meshColumns: Int,n_simultaneous_matmuls: Int = -1)
extends Module {

  val A_TYPE = Vec(meshRows, Vec(1, inputType))
  val B_TYPE = Vec(meshColumns, Vec(1, inputType))
  val C_TYPE = Vec(meshColumns, Vec(1, outputType))
  val D_TYPE = Vec(meshColumns, Vec(1, inputType))
  val S_TYPE = Vec(meshColumns, Vec(1, new PEControl(accType)))

//  val block_size = meshRows * meshColumns
  val block_size = meshRows

  val latency_per_pe = 1.0f
  val max_simultaneous_matmuls = if (n_simultaneous_matmuls == -1) {
    (5 * latency_per_pe).ceil.toInt
  } else {
    n_simultaneous_matmuls
  }

  val tagqlen = max_simultaneous_matmuls+1

  val io = IO(new Bundle {
    val a = Flipped(Decoupled(A_TYPE))
    val b = Flipped(Decoupled(B_TYPE))
    val d = Flipped(Decoupled(D_TYPE))

    val req = Flipped(Decoupled(new MeshReq(accType, tagType.cloneType, block_size)))

    val resp = Valid(new MeshResp(outputType, meshColumns, block_size, tagType.cloneType))

    val tags_in_progress = Output(Vec(tagqlen, tagType))

    val w_data_valid = Output(Bool())

  })


  val req = Reg(UDValid(new MeshReq(accType, tagType, block_size)))

  val matmul_id = RegInit(0.U(log2Up(max_simultaneous_matmuls).W))

  val total_fires = req.bits.total_rows
  val fire_counter = RegInit(0.U(log2Up(block_size).W))

  val a_buf = RegEnable(io.a.bits, io.a.fire)
  val b_buf = RegEnable(io.b.bits, io.b.fire)
  val d_buf = RegEnable(io.d.bits, io.d.fire)

  val a_written = RegInit(false.B)
  val b_written = RegInit(false.B)
  val d_written = RegInit(false.B)

  val in_pe_flush = Reg(Bool())

  val input_next_row_into_spatial_array = req.valid && ((a_written && b_written && d_written) || req.bits.flush > 0.U)

  val last_fire = fire_counter === total_fires - 1.U && input_next_row_into_spatial_array

  when(io.req.fire) {
    req.push(io.req.bits)
    in_pe_flush := io.req.bits.pe_control.in_pe_flush.asBool
    matmul_id := wrappingAdd(matmul_id, 1.U, max_simultaneous_matmuls)
  }.elsewhen(last_fire) {
    req.valid := req.bits.flush > 1.U
    req.bits.flush := req.bits.flush - 1.U
  }

  when (input_next_row_into_spatial_array) {
    a_written := false.B
    b_written := false.B
    d_written := false.B

    fire_counter := wrappingAdd(fire_counter, 1.U, total_fires)
  }

  when (io.a.fire) {
    a_written := true.B
  }

  when (io.b.fire) {
    b_written := true.B
  }

  when (io.d.fire) {
    d_written := true.B
  }

  io.a.ready := !a_written || input_next_row_into_spatial_array || io.req.ready
  io.b.ready := !b_written || input_next_row_into_spatial_array || io.req.ready
  io.d.ready := !d_written || input_next_row_into_spatial_array || io.req.ready

  assert(req.valid || !input_next_row_into_spatial_array)

  val pause = !req.valid || !input_next_row_into_spatial_array

  // Transposer
  val a_is_from_transposer = Mux(req.bits.pe_control.dataflow === Dataflow.OS.id.U, !req.bits.a_transpose, req.bits.a_transpose)
  val b_is_from_transposer = req.bits.pe_control.dataflow === Dataflow.OS.id.U && req.bits.bd_transpose
  val d_is_from_transposer = req.bits.pe_control.dataflow === Dataflow.WS.id.U && req.bits.bd_transpose
  val transposer = Module(new AlwaysOutTransposer(meshRows, inputType))

  transposer.io.inRow.valid := !pause && (a_is_from_transposer || b_is_from_transposer || d_is_from_transposer)
  transposer.io.inRow.bits := MuxCase(VecInit(a_buf.flatten), Seq(
    a_is_from_transposer -> VecInit(b_buf.flatten),
    d_is_from_transposer -> VecInit(d_buf.flatten.reverse),
  ))

  transposer.io.outCol.ready := true.B
  val transposer_out = VecInit(transposer.io.outCol.bits.grouped(dataNumToPe).map(t => VecInit(t)).toSeq)

  // Wire up mesh's IO to this module's IO
  val mesh = Seq.fill(meshRows, meshColumns)(Module(new gemminiPE(inputType, outputType, accType,dataNumToPe, bitletPEconfigs(inputType, 4))))


  val a_shifter_in = WireInit(Mux(a_is_from_transposer, a_buf, transposer_out.asTypeOf(A_TYPE)))
  val b_shifter_in = WireInit(Mux(b_is_from_transposer, b_buf, transposer_out.asTypeOf(B_TYPE)))
  val d_shifter_in = WireInit(Mux(d_is_from_transposer,
    VecInit(transposer_out.flatten.reverse.grouped(1).map(VecInit(_)).toSeq).asTypeOf(D_TYPE), d_buf))

  val in_counter = RegInit(0.U(log2Up(meshRows*2).W))

  when(input_next_row_into_spatial_array && (a_written || b_written || d_written)) {
//    in_counter := wrappingAdd(in_counter, 1.U, (meshRows*2).U)
    in_counter := wrappingAdd(in_counter, 1.U, meshRows.U)
  }

  val d_invalid = RegInit(false.B)
  when(!io.req.bits.if_d_in) {
    d_invalid := true.B
  }
    when( mesh(0)(0).io.out_valid ) {
      d_invalid := false.B
    }

  val a_in = Reg(Vec(meshRows, Vec(dataNumToPe, inputType)))
  val b_in = Reg(Vec(meshRows, Vec(dataNumToPe, inputType)))
  val d_in = Reg(Vec(meshRows, Vec(dataNumToPe, inputType)))
  a_in(fire_counter) := a_shifter_in.asTypeOf(Vec(dataNumToPe, inputType))
  b_in(fire_counter) := b_shifter_in.asTypeOf(Vec(dataNumToPe, inputType))
//  val d_in_1 = Reg(D_TYPE)
//  d_in_1 := d_shifter_in
  when(!d_written && io.d.fire && (in_counter < meshRows.U) ) {
    d_in(meshRows.U - fire_counter) := d_shifter_in.asTypeOf(Vec(dataNumToPe, inputType))
  }
  when(in_counter === (meshRows-1).U && d_written ) {
    d_in(0) := d_shifter_in.asTypeOf(Vec(dataNumToPe, inputType))
  }

//    when(d_invalid) {
//      for (r <- 0 until meshRows) {
//        for (c <- 0 until meshColumns) {
//          d_in(r)(c) := 0.S
//        }
//      }
//    }
//  when(!io.req.bits.if_d_in) {
//    for (r <- 0 until meshRows) {
//      for (c <- 0 until meshColumns) {
//        d_in(r)(c) := 0.S
//      }
//    }
//  }

  when(io.w_data_valid || d_invalid) {
    for(r <- 0 until meshRows) {
      for(c <-0 until meshColumns) {
        d_in(r)(c) := 0.S
      }
    }
  }

  for (r <- 0 until meshRows) {
    for (c <- 0 until meshColumns) {
      mesh(r)(c).io.in_a := a_in(r)
    }
  }
  for (c <- 0 until meshColumns) {
    for (r <- 0 until meshRows) {
      mesh(r)(c).io.in_b := b_in(c)
    }
  }
  for (c <- 0 until meshColumns) {
    for (r <- 0 until meshRows) {
      mesh(r)(c).io.in_d := d_in(r)(c)
    }
  }

  for (c <- 0 until meshColumns) {
    for (r <- 0 until meshRows) {
      mesh(r)(c).io.shift := io.req.bits.pe_control.shift
    }
  }
  for (c <- 0 until meshColumns) {
    for (r <- 0 until meshRows) {
      mesh(r)(c).io.in_flush := in_pe_flush
    }
  }

  for (r <- 0 until meshRows) {
    for (c <- 0 until meshColumns) {
      io.resp.bits.data(r)(c) := mesh(r)(c).io.dataOut
    }
  }

  io.w_data_valid := mesh(0)(0).io.out_valid

  val in_valid = RegInit(false.B)
  when(in_counter === (meshRows - 1).U) {
    in_valid := RegNext(true.B)
  }.otherwise {
    in_valid := RegNext(false.B)
  }
  val not_paused = !pause
  for (r <- 0 until meshRows) {
    for (c <- 0 until meshColumns) {
      mesh(r)(c).io.in_valid := RegNext(not_paused) && (in_valid)
    }
  }
  val cycle_delay = 8
  io.resp.valid := ShiftRegister(not_paused,cycle_delay)//TODO

  io.resp.bits.last := ShiftRegister(last_fire,cycle_delay)//TODO

  val mesh_out_id = ShiftRegister(matmul_id,cycle_delay)//TODO

  // Tags
  class TagWithIdAndTotalRows extends Bundle with TagQueueTag {
    val tag = tagType.cloneType
    val id = UInt(log2Up(max_simultaneous_matmuls).W)
    val total_rows = UInt(log2Up(block_size+1).W)

    override def make_this_garbage(dummy: Int=0): Unit = {
      total_rows := block_size.U
      tag.make_this_garbage()
    }

  }

  val matmul_id_of_output = wrappingAdd(matmul_id, Mux(io.req.bits.pe_control.dataflow === Dataflow.OS.id.U, 3.U, 2.U), max_simultaneous_matmuls)
  val matmul_id_of_current = wrappingAdd(matmul_id, 1.U, max_simultaneous_matmuls)

  val tagq = Module(new TagQueue(new TagWithIdAndTotalRows, tagqlen))
  tagq.io.enq.valid := io.req.fire && io.req.bits.flush === 0.U
  tagq.io.enq.bits.tag := io.req.bits.tag
  tagq.io.enq.bits.total_rows := DontCare
  tagq.io.enq.bits.id := matmul_id_of_output

  val tag_garbage = Wire(tagType.cloneType)
  tag_garbage := DontCare
  tag_garbage.make_this_garbage()

  io.resp.bits.tag := Mux(tagq.io.deq.valid && mesh_out_id === tagq.io.deq.bits.id, tagq.io.deq.bits.tag, tag_garbage)

  tagq.io.deq.ready := io.resp.valid && io.resp.bits.last && mesh_out_id === tagq.io.deq.bits.id

  val total_rows_q = Module(new Queue(new TagWithIdAndTotalRows, tagqlen))
  total_rows_q.io.enq.valid := io.req.fire && io.req.bits.flush === 0.U
  total_rows_q.io.enq.bits.tag := DontCare
  total_rows_q.io.enq.bits.total_rows := io.req.bits.total_rows
  total_rows_q.io.enq.bits.id := matmul_id_of_current

  io.resp.bits.total_rows := Mux(total_rows_q.io.deq.valid && mesh_out_id === total_rows_q.io.deq.bits.id,
    total_rows_q.io.deq.bits.total_rows, meshRows.U)

  total_rows_q.io.deq.ready := io.resp.valid && io.resp.bits.last && mesh_out_id === total_rows_q.io.deq.bits.id

  io.req.ready := (!req.valid || last_fire) && tagq.io.enq.ready && total_rows_q.io.enq.ready
  io.tags_in_progress := tagq.io.all.map(_.tag)

  when (reset.asBool()) {
    req.valid := false.B
  }

  assert(!(io.req.fire && !tagq.io.enq.ready && io.req.bits.flush === 0.U))
}
