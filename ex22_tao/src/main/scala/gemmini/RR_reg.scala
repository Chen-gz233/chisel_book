package gemmini

import chisel3._
import chisel3.util._


class RRreg(macnum: Int, exp_width: Int, manti_len: Int, is_int8: Boolean, windowsize: Int) extends Module {
  val io = IO(new Bundle {
    val valid = Input(Bool())
    val sign = Input(Vec(macnum, Bool()))
    val aManti = Input(Vec(macnum, UInt((manti_len + 2).W)))
    val sewo = Input(Vec(manti_len + 2, UInt(macnum.W)))
    val ochi = Decoupled(Output(Vec(manti_len + 2, SInt((32).W))))
    val emax = Output(UInt((exp_width + 1).W))
    val expMax = Input(UInt((exp_width + 1).W))
  })
  if (is_int8) {
    val outReg = RegInit(VecInit(Seq.fill(manti_len + 2)(0.S((32).W))))
    val done = RegInit(VecInit(Seq.fill(manti_len + 2)(0.B)))


    val decoder = (0 until manti_len + 2).map { i => Module(new decoderRR_not_fixed(macnum, exp_width, manti_len, is_int8, i % 8, windowsize)) }
    for (i <- 0 until manti_len + 2) {
      decoder(i).io.sign := io.sign
      decoder(i).io.sewo := io.sewo(i)
      decoder(i).io.aManti := io.aManti
      outReg(i) := decoder(i).io.outNum
      decoder(i).io.start := io.valid
      done(i) := decoder(i).io.done
    }
    io.ochi.bits := outReg
    io.ochi.valid := done.asUInt.andR
    io.emax := DontCare
//    io.emax := DontCare
//    val outReg = RegInit(VecInit(Seq.fill(28)(0.S((32).W))))
//    val done = RegInit(VecInit(Seq.fill(28)(0.B)))
//
//
//    val decoder = (0 until 28).map { i => Module(new decoderRR_not_fixed(16, exp_width, manti_len, is_int8, i % 7, windowsize)) }
//
//    var k = 0
//    for (i <- 0 until 28) {
//      for (j <- 0 until 16) {
//        decoder(i).io.sign(j) := io.sign(j + (i / 7) * 16)
//        decoder(i).io.aManti(j) := io.aManti(j + (i / 7) * 16)
//      }
//      decoder(i).io.sewo := io.sewo(i)
//
//      outReg(i) := decoder(i).io.outNum
//      decoder(i).io.start := io.valid
//      done(i) := decoder(i).io.done
//    }
//    io.ochi.bits := outReg
//    io.ochi.valid := done.asUInt.andR
  }
  else {
    val outReg = RegInit(VecInit(Seq.fill(manti_len + 1)(0.S((32).W))))
    val cnt = RegInit(VecInit(Seq.fill(macnum)(0.U(log2Ceil(macnum).W)))) //(Vec(macnum, 0.U(log2Ceil(macnum).W)))
    val done = RegInit(VecInit(Seq.fill(manti_len + 1)(0.B)))
    val expMaxReg = RegInit(0.U((exp_width + 1).W))
    when(io.valid) {
      expMaxReg := io.expMax
    }
    io.emax := expMaxReg

    val decoder = (0 until manti_len + 1).map { i => Module(new decoderRR_not_fixed(macnum, exp_width, manti_len, is_int8, manti_len - i, windowsize)) }
    for (i <- 0 until manti_len + 1) {
      decoder(i).io.sign := io.sign
      decoder(i).io.sewo := io.sewo(i)
      decoder(i).io.aManti := io.aManti
      outReg(i) := decoder(i).io.outNum
      decoder(i).io.start := io.valid
      done(i) := decoder(i).io.done
    }
    io.ochi.bits := outReg
    io.ochi.valid := done.asUInt.andR

  }


}



