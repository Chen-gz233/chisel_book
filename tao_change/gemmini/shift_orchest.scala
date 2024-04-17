package gemmini

import chisel3._

class ShiftOrchest_int8(macnum: Int, is_int8: Boolean, manti_len: Int, exp_width: Int) extends Module {
  val io = IO(new Bundle {
    val wManti = Input(Vec(macnum, UInt((manti_len + 2).W)))
    val sewo = Output(Vec(manti_len + 2, Vec(macnum, Bool())))
  })
  for (j <- 0 until manti_len + 2) {
    for (i <- 0 until macnum) {
      io.sewo(j)(i) := io.wManti(i)(j)
    }
  }
//  var k = 0
//  for (j <- 0 until 28) {
//    if (j % 7 == 0 && j != 0) {
//      k = k + 1
//    }
//    for (i <- 0 until macnum / 4) {
//      io.sewo(j)(i) := io.wManti(16 * k + i)(j % 7)
//    }
//
//  }

}

class ShiftOrchest_fp32(macnum: Int, is_int8: Boolean, manti_len: Int, exp_width: Int) extends Module {
  val io = IO(new Bundle {
    val wManti = Input(Vec(macnum, UInt((manti_len + 1).W)))
    val exp = Input(Vec(macnum, UInt((exp_width + 1).W)))
    val expMax = Input(UInt((exp_width + 1).W))
    val sewo = Output(Vec(manti_len + 1, Vec(macnum, Bool())))

  })
  val wMantiReg = Wire(Vec(macnum, UInt((manti_len + 1).W)))
  for (i <- 0 until macnum) {
    wMantiReg(i) := (io.wManti(i) >> (io.expMax - io.exp(i)))
  }
  for (j <- 0 until manti_len + 1) {
    for (i <- 0 until macnum) {
      io.sewo(j)(i) := wMantiReg(i)(j)
    }
  }
}

//object ShiftOrchest {
//  def apply(macnum: Int, is_int8: Boolean, manti_len: Int, exp_width: Int) = {
//    if(is_int8) {
//      val ShiftOrchest = Module(new ShiftOrchest_int8(macnum, is_int8, manti_len, exp_width))
//    } else {
//      val ShiftOrchest = Module(new ShiftOrchest_fp32(macnum, is_int8, manti_len, exp_width))}
//  }
//}



