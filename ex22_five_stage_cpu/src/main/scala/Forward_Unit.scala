import chisel3._
import chisel3.util._

class ForwardUnit extends Module {
  val io = IO(new Bundle {
    val me_write_valid          = Input(Bool())
    val wb_write_valid          = Input(Bool())
    val me_rd_address           = Input(UInt(5.W))
    val wb_rd_address           = Input(UInt(5.W))
    val ex_rs1_address          = Input(UInt(5.W))
    val ex_rs2_address          = Input(UInt(5.W))
    val me_rs2_address          = Input(UInt(5.W))
    
    val ex_forwardA             = Output(UInt(2.W))
    val ex_forwardB             = Output(UInt(2.W))
    val me_forwardC             = Output(Bool())
  })

  io.ex_forwardA := 0.U
  io.ex_forwardB := 0.U
  io.me_forwardC := false.B

  when(io.wb_write_valid && (io.wb_rd_address =/= 0.U) && (io.wb_rd_address === io.ex_rs1_address)) {
    io.ex_forwardA := 2.U
  }

  when(io.wb_write_valid && (io.wb_rd_address =/= 0.U) && (io.wb_rd_address === io.ex_rs2_address)) {
    io.ex_forwardB := 2.U
  }

  when(io.me_write_valid && (io.me_rd_address =/= 0.U) && (io.me_rd_address === io.ex_rs1_address)) {
    io.ex_forwardA := 1.U
  }

  when(io.me_write_valid && (io.me_rd_address =/= 0.U) && (io.me_rd_address === io.ex_rs2_address)) {
    io.ex_forwardB := 1.U
  }

  when(io.wb_write_valid && (io.wb_rd_address =/= 0.U) && (io.wb_rd_address === io.me_rs2_address)) {
    io.me_forwardC := true.B
  }
}

object ForwardUnit extends App {
  emitVerilog(new ForwardUnit(),Array("--target-dir","generate"))
}
