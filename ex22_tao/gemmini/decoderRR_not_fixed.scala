package gemmini

import scala.math
import chisel3.{Mux, _}
import chisel3.util._
import firrtl.Utils.False

class decoderRR_not_fixed(macnum: Int, exp_width: Int, manti_len: Int, is_int8: Boolean, shiftNum: Int, windowsize: Int) extends Module {
  val io = IO(new Bundle {
    val sign = Input(Vec(macnum, Bool()))
    val sewo = Input(UInt(macnum.W))
    val aManti = Input(Vec(macnum, UInt((manti_len + 2).W)))
    val start = Input(Bool())
    val done = Output(Bool())
    val outNum = Output(SInt((32.W)))
  })
  if (is_int8) {
    def UIntShiftToSInt_int8[T <: Data](sign: Bool, sourceNum: UInt, shiftNum: Int, NumWidth: Int): SInt = {
      val destNumNoSign = Wire(UInt(NumWidth.W))
      val source = Wire(UInt(NumWidth.W))
      val result = Wire(UInt((NumWidth + 1).W))
      source := sourceNum
      when(sign && source > 0.U) {
        destNumNoSign := ~(source << shiftNum.U) + 1.U
        //      result := Cat((scala.math.pow(2,25-shiftNum)-1).toInt.U((25-shiftNum).W), destNumNoSign)
        result := Cat(1.U, destNumNoSign)
      }.otherwise {
        destNumNoSign := source << shiftNum.U
        result := Cat(0.U, destNumNoSign)
      }
      result.asSInt
    }

    val idle :: dect :: done :: Nil = Enum(3)
    val state = RegInit(idle)
    val cnt = RegInit(0.U((log2Ceil(macnum) + 1).W))
    val outReg = RegInit(0.S((32).W))
    val doneReg = RegInit(false.B)
    val windowReg = RegInit(VecInit(Seq.fill(windowsize)(0.S((32).W))))
    switch(state) {
      is(idle) {
        //doneReg := false.B
        when(io.start) {
          state := dect
          cnt := cnt + windowsize.U
          for (i <- 0 until windowsize) {
            windowReg(i) := Mux((io.sewo >> cnt)(i),
              UIntShiftToSInt_int8(io.sign(cnt + i.U), io.aManti(cnt + i.U), shiftNum, 31), 0.S)
          }
        }
      }
      is(dect) {
        when((cnt === macnum.U).asBool) {
          state := done
          cnt := 0.U
          doneReg := true.B
          for (i <- 0 until windowsize) {
            windowReg(i) := 0.S
          }
        }.otherwise {
          cnt := cnt + windowsize.U
          for (i <- 0 until windowsize) {
            windowReg(i) := Mux((io.sewo >> cnt)(i),
              UIntShiftToSInt_int8(io.sign(cnt + i.U), io.aManti(cnt + i.U), shiftNum, 31), 0.S)
          }
        }
      }
      is(done) {
        state := idle
        doneReg := false.B
      }
    }

    io.outNum := windowReg.reduce(_ + _)

    io.done := doneReg
  }
  else {
    def UIntShiftToSInt[T <: Data](sign: Bool, sourceNum: UInt, shiftNum: Int, NumWidth: Int): SInt = {
      val destNumNoSign = Wire(UInt(NumWidth.W))
      val result = Wire(UInt((NumWidth + 1).W))
      when(sign) {
        destNumNoSign := ~(sourceNum >> shiftNum.U) + 1.U
        result := Cat(1.U, destNumNoSign)
      }.otherwise {
        destNumNoSign := sourceNum >> shiftNum
        result := Cat(0.U, destNumNoSign)
      }
      result.asSInt
    }

    val idle :: dect :: done :: Nil = Enum(3)
    val state = RegInit(idle)
    val cnt = RegInit(0.U((log2Ceil(macnum) + 1).W))
    val outReg = RegInit(0.S((32).W))
    val doneReg = RegInit(false.B)

    val regNum = new Array[Int](log2Floor(windowsize) + 1)
    val index = new Array[Int](log2Floor(windowsize) + 1)
    regNum(0) = windowsize
    for (i <- 1 until log2Floor(windowsize) + 1) {
      regNum(i) = windowsize / (i * 2)
    }
    index(0) = 0
    for (i <- 1 until log2Floor(windowsize) + 1) {
      index(i) = index(i - 1) + regNum(i - 1)
    }
    val sum = regNum.sum

    val windowReg = RegInit(VecInit(Seq.fill(sum)(0.S(32.W))))

    val SSSSS = RegInit((0.U(macnum.W)))


    switch(state) {
      is(idle) {
        //doneReg := false.B
        when(io.start) {
          state := dect
          cnt := 0.U
          for (i <- 0 until regNum(0)) {
            windowReg(i) := 0.S
          }
        }
      }
      is(dect) {
        when((cnt === macnum.U).asBool) {
          state := done
          doneReg := true.B
          for (i <- 0 until regNum(0)) {
            windowReg(i) := 0.S
          }
        }.otherwise {
          cnt := cnt + windowsize.U
          SSSSS := io.sewo >> cnt
          for (i <- 0 until windowsize) {
            windowReg(i) := Mux((io.sewo >> cnt)(i), // ?
              UIntShiftToSInt(io.sign(cnt + i.U), io.aManti(cnt + i.U), shiftNum, manti_len + 1), 0.S)
          }
        }
      }
      is(done) {
        state := idle
        doneReg := false.B
      }
    }

    for (i <- 1 until log2Floor(windowsize) + 1) {
      for (j <- 0 until regNum(i)) {
        windowReg(index(i) + j) := windowReg(index(i - 1) + 2 * j) + windowReg(index(i - 1) + 2 * j + 1)
      }
    }
    outReg := windowReg.last
    io.outNum := outReg
    io.done := ShiftRegister(doneReg, log2Floor(windowsize))
  }
}




