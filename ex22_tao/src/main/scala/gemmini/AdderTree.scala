package gemmini

import chisel3._
import chisel3.util._

class AdderTree[T <: Data : Arithmetic](inputType: T,outputType: T,accType: T,macnum: Int, exp_width: Int, manti_len: Int, is_int8: Boolean, data_width: Int, reg_num: Int) (implicit ev: Arithmetic[T])extends Module {
  import ev._
  val io = IO(new Bundle {
    val in_d = Input(SInt((inputType.getWidth).W))
    val expMax = Input((UInt((exp_width + 1).W)))
    val e_valid = Input(Bool())
    val shift = Input(UInt(log2Up(accType.getWidth).W))
    val in_flush = Input(Bool())
    val ochi = Flipped(Decoupled(Vec(manti_len + 2, SInt((32).W))))
    val data = Output(outputType)
    val valid = Output(Bool())
  })
  if (is_int8) {
      val sumReg = RegInit(VecInit(Seq.fill(reg_num)(0.S(32.W))))
      val layers = log2Floor(manti_len + 2)
      dontTouch(sumReg)

      //the number of regs used in each layer
      val array = new Array[Int](layers)
      if ((manti_len + 2) % 2 == 0) {
        array(0) = (manti_len + 2) / 2
      } else {
        array(0) = (manti_len + 2) / 2 + 1
      }
      for (i <- 1 until layers) {
        if (array(i - 1) % 2 == 0) {
          array(i) = array(i - 1) / 2
        } else {
          array(i) = array(i - 1) / 2 + 1
        }
      }
      //the index_reg of each layer in sumReg
      val index_reg = new Array[Int](layers)
      index_reg(0) = 0
      for (i <- 1 until layers) {
        index_reg(i) = index_reg(i - 1) + array(i - 1)
      }
      // 0 layer
      if ((manti_len + 2) % 2 == 0) {
        for (i <- 0 until array(0) - 1) {
          sumReg(i) := io.ochi.bits(2 * i) + io.ochi.bits(2 * i + 1)
        }
        sumReg(array(0) - 1) := io.ochi.bits(2 * (array(0) - 1)) + io.ochi.bits(2 * array(0) - 1
        ) + io.in_d //add in_d
      } else {
        for (i <- 0 until array(0) - 1) {
          sumReg(i) := io.ochi.bits(2 * i) + io.ochi.bits(2 * i + 1)
        }
        sumReg(array(0) - 1) := io.ochi.bits(2 * (array(0) - 1)) + io.in_d //add in_d
      }

      // other layers
      for (i <- 1 until layers) {
        if (array(i - 1) % 2 == 0) {
          for (j <- 0 until array(i)) {
            var s1 = j + index_reg(i)
            var s2 = 2 * j + index_reg(i - 1)
            var s3 = 2 * j + index_reg(i - 1) + 1
            sumReg(j + index_reg(i)) := sumReg(2 * j + index_reg(i - 1)) + sumReg(2 * j + 1 + index_reg(i - 1))
          }
        }
        else {
          for (j <- 0 until array(i) - 1) {
            var t1 = j + index_reg(i)
            var t2 = 2 * j + index_reg(i - 1)
            var t3 = 2 * j + index_reg(i - 1) + 1
            sumReg(j + index_reg(i)) := sumReg(2 * j + index_reg(i - 1)) + sumReg(2 * j + 1 + index_reg(i - 1))
          }
          var v1 = array(i) - 1 + index_reg(i)
          var v2 = index_reg(i - 1) + array(i - 1) - 1
          sumReg(array(i) - 1 + index_reg(i)) := sumReg(index_reg(i - 1) + array(i - 1) - 1)
        }
      }

    val sum_temp = RegInit(0.S(32.W))

    sum_temp := sumReg.last + sum_temp
//   sum_temp := sumReg.last

    val din = RegInit(0.U(1.W))
    when(io.ochi.fire) {
      din := 1.U
    }.otherwise {
      din := 0.U
    }

    val flush = io.in_flush && io.valid
    when(flush) {
      sum_temp := 0.S
    }

//    val reg_stay = RegInit(0.S(32.W))

//    when(io.in_stay){
//      reg_stay := sum_temp
//    }
    io.data := ((sum_temp.asTypeOf(accType) >> io.shift)).clippedToWidthOf(outputType)
    val rs_to_as_allow = RegInit(true.B)
    io.ochi.ready := rs_to_as_allow
    io.valid := ShiftRegister(din, layers - 1)








    //    val sumReg = RegInit(VecInit(Seq.fill(6)(0.S(32.W))))
//    val sum = RegInit(0.S(32.W))
//
//    for (i <- 0 until 5) {
//      sumReg(i) := io.ochi.bits(5 * i) + io.ochi.bits(5 * i + 1) + io.ochi.bits(5 * i + 2) + io.ochi.bits(5 * i + 3) + io.ochi.bits(5 * i + 4)
//    }
//    sumReg(5) := io.ochi.bits(25) + io.ochi.bits(26) + io.ochi.bits(27)
//
//    sum := sumReg.reduce(_ + _) + sum
//
//    io.data := sum
//
//    val shiftReg = RegInit(false.B)
//    val rs_to_as_allow = RegInit(true.B)
//    io.ochi.ready := rs_to_as_allow
//    shiftReg := io.ochi.fire
//    io.valid := shiftReg
  }
  else {
    val sumReg = RegInit(VecInit(Seq.fill(reg_num)(0.S(32.W))))
    val sum = RegInit(0.S(32.W))
    val expmax = RegInit(0.U((exp_width + 1).W))
    val layers = log2Floor(manti_len + 1) + 1
    dontTouch(sumReg)
    when(io.e_valid) {
      expmax := io.expMax
    }

    //the number of regs used in each layer
    val array = new Array[Int](layers)
    if ((manti_len + 1) % 2 == 0) {
      array(0) = (manti_len + 1) / 2
    } else {
      array(0) = (manti_len + 1) / 2 + 1
    }
    for (i <- 1 until layers) {
      if (array(i - 1) % 2 == 0) {
        array(i) = array(i - 1) / 2
      } else {
        array(i) = array(i - 1) / 2 + 1
      }
    }
    //the index_reg of each layer in sumReg
    val index_reg = new Array[Int](layers)
    index_reg(0) = 0
    for (i <- 1 until layers) {
      index_reg(i) = index_reg(i - 1) + array(i - 1)
    }
    // 0 layer
    if ((manti_len + 1) % 2 == 0) {
      for (i <- 0 until array(0)) {
        sumReg(i) := io.ochi.bits(2 * i) + io.ochi.bits(2 * i + 1)
      }
    } else {
      for (i <- 0 until array(0) - 1) {
        sumReg(i) := io.ochi.bits(2 * i) + io.ochi.bits(2 * i + 1)
      }
      sumReg(array(0) - 1) := io.ochi.bits(2 * (array(0) - 1))
    }

    // other layers
    for (i <- 1 until layers) {
      if (array(i - 1) % 2 == 0) {
        for (j <- 0 until array(i)) {
          var s1 = j + index_reg(i)
          var s2 = 2 * j + index_reg(i - 1)
          var s3 = 2 * j + index_reg(i - 1) + 1
          sumReg(j + index_reg(i)) := sumReg(2 * j + index_reg(i - 1)) + sumReg(2 * j + 1 + index_reg(i - 1))
        }
      }
      else {
        for (j <- 0 until array(i) - 1) {
          var t1 = j + index_reg(i)
          var t2 = 2 * j + index_reg(i - 1)
          var t3 = 2 * j + index_reg(i - 1) + 1
          sumReg(j + index_reg(i)) := sumReg(2 * j + index_reg(i - 1)) + sumReg(2 * j + 1 + index_reg(i - 1))
        }
        var v1 = array(i) - 1 + index_reg(i)
        var v2 = index_reg(i - 1) + array(i - 1) - 1
        sumReg(array(i) - 1 + index_reg(i)) := sumReg(index_reg(i - 1) + array(i - 1) - 1)
      }
    }

    val sum_out = RegInit(0.U(32.W))
    val sum_temp = RegInit(0.S(32.W))

    sum_temp := sumReg.last + sum_temp
    val expOffset = 127.U
    val emaxOffset = Reg(UInt(4.W))
    val manti = Reg(UInt(23.W))
    val emax = Reg(UInt(9.W))

    //    sum_out := Mux(sum(31).asBool, Cat(sum(31), ((~sum(30, 0)) + 1.U)).asUInt, sum.asUInt)
    emaxOffset := PriorityMux(((30 until 61).map {
      i => sum_out(i - 30)
    }).reverse, ((0 until 8).map(i => (15 - i).U)) ++ ((1 until 7).map(i => i.U)) ++ (Seq.fill(17)(7.U)))
    manti := Mux(emaxOffset(3), (sum_out >> emaxOffset(2, 0))(22, 0), sum_out(22, 0) << emaxOffset(2, 0))
    emax := Mux(emaxOffset(3), expmax - expOffset + emaxOffset(2, 0), expmax - expOffset - emaxOffset(2, 0))
    io.data := (Cat(sum_out(31), emax(exp_width - 1, 0), manti(22, 23 - manti_len))) >> io.shift


    //   ****** control logic
    val shiftReg = RegInit(0.U(layers.W))
    val rs_to_as_allow = RegInit(true.B)
    val din = RegInit(0.U(1.W))
    val dout = shiftReg(layers - 1)
    val if_out_valid = RegInit(false.B)

    io.ochi.ready := rs_to_as_allow
    //io.expMax.ready := rs_to_as_allow
    when(io.ochi.fire) {
      din := 1.U
      rs_to_as_allow := false.B
    }.otherwise {
      din := 0.U
    }
    shiftReg := Cat(shiftReg(layers - 2, 0), din)
    io.valid := ShiftRegister(if_out_valid, 2)
    //io.ochi.ready := RegNext(if_out_valid)
    //io.expMax.ready := RegNext(if_out_valid)

    if (is_int8) {
      when(dout === 1.U) {
        sum := sumReg.last + sum_temp
        if_out_valid := true.B
      }
    } else {
      val ready_expmax = RegInit(true.B)
      when(io.ochi.fire) {
        ready_expmax := false.B
        rs_to_as_allow := false.B
      }
      when(dout === 1.U) {
        ready_expmax := true.B
        rs_to_as_allow := true.B
        if_out_valid := true.B
        sum_out := Mux(sum_temp(31).asBool, Cat(sum_temp(31), ((~sum_temp(30, 0)) + 1.U)).asUInt, sum_temp.asUInt)
        sum_temp := 0.S
      }.otherwise {
        if_out_valid := false.B
      }
    }
  }

}



