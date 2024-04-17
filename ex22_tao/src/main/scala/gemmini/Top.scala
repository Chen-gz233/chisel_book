package gemmini

import chisel3.{Vec, _}
import chisel3.util._
class gemminiPE[T <: Data : Arithmetic](inputType: T, outputType: T, accType: T,
                                       val dataNumToPe: Int,
                                       val config: bitletPEconfigs[T]) extends Module {
  val io = IO(new Bundle {
    val in_a = Input(Vec(dataNumToPe, inputType))
    val in_b = Input(Vec(dataNumToPe, inputType))
    val in_d = Input(inputType)
    val shift = Input(UInt(log2Up(accType.getWidth).W))
    val in_flush = Input(Bool())
    val dataOut = Output(outputType)
    val in_valid = Input(Bool())
    val out_valid = Output(Bool())
    val next = Output(Bool())
  })
  if (config.is_int8) {
    val valid = RegInit(false.B)
    val sign = Reg(Vec(dataNumToPe, Bool()))
    val wmanti = Reg(Vec(dataNumToPe, UInt((config.manti_len + 2).W)))
    val amanti = Reg(Vec(dataNumToPe, UInt((config.manti_len + 2).W)))//change in 0826
    val RRregModule = Module(new RRreg(dataNumToPe, config.exp_width, config.manti_len, config.is_int8, 8))
    val shiftOrchestModule = Module(new ShiftOrchest_int8(dataNumToPe, config.is_int8, config.manti_len, config.exp_width))
    val adderTreeModule = Module(new AdderTree(inputType, outputType, accType, dataNumToPe, config.exp_width, config.manti_len, config.is_int8, config.data_width, config.reg_num))
    //    val d = Reg(inputType)
    val d_toAddtree = Reg(inputType)
    val d_addertree_valid = ShiftRegister(io.in_valid,3)
    //    d := io.in_d
    //    when(d_addertree_valid) {
    //      d_toAddtree := io.in_d
    //    }
    //    when(RRregModule.io.ochi.valid) {
    //      d_toAddtree := 0.S
    //    }
    when(io.in_valid) {
      d_toAddtree := io.in_d
    }
    for (i <- 0 until dataNumToPe) {
      sign(i) := io.in_b(i).asUInt(config.sign_where) ^ io.in_a(i).asUInt(config.sign_where)
      //      wmanti(i) := Mux(io.in_b(i).asUInt(config.sign_where), ~io.in_b(i).asUInt(config.manti_len - 1, 0) + 1.U, io.in_b(i).asUInt(config.manti_len - 1, 0))
      //      amanti(i) := Mux(io.in_a(i).asUInt(config.sign_where), ~io.in_a(i).asUInt(config.manti_len - 1, 0) + 1.U, io.in_a(i).asUInt(config.manti_len - 1, 0))//change in 0825
      wmanti(i) := Mux(io.in_b(i).asUInt(config.sign_where), Cat(0.U,~io.in_b(i).asUInt(config.manti_len, 0)) + 1.U, io.in_b(i).asUInt(config.manti_len, 0))
      amanti(i) := Mux(io.in_a(i).asUInt(config.sign_where), Cat(0.U,~io.in_a(i).asUInt(config.manti_len, 0)) + 1.U, io.in_a(i).asUInt(config.manti_len, 0))
    }
    when(io.in_valid) {
      valid := true.B
    }.otherwise {
      valid := false.B
    }
    shiftOrchestModule.io.wManti := wmanti
    RRregModule.io.aManti := amanti
    RRregModule.io.sign := sign
    RRregModule.io.sewo := shiftOrchestModule.io.sewo.asTypeOf(Vec(config.manti_len + 2, UInt(dataNumToPe.W)))
    for (i <- 0 until config.manti_len + 2) {
      RRregModule.io.sewo(i) := shiftOrchestModule.io.sewo(i).asUInt
    }
    RRregModule.io.valid := valid
    RRregModule.io.expMax := DontCare
    adderTreeModule.io.e_valid := RRregModule.io.ochi.valid
    adderTreeModule.io.ochi <> RRregModule.io.ochi
    adderTreeModule.io.expMax := DontCare
    adderTreeModule.io.shift := io.shift
    when(d_addertree_valid) {
      adderTreeModule.io.in_d := d_toAddtree
      d_toAddtree := 0.S
    }.otherwise{
      adderTreeModule.io.in_d := 0.S
    }
    //    adderTreeModule.io.in_d := d_toAddtree
    adderTreeModule.io.in_flush := io.in_flush
    io.dataOut := adderTreeModule.io.data
    io.out_valid := adderTreeModule.io.valid
    io.next := RRregModule.io.ochi.valid
    //    when(io.in_valid) {
    //      assert((io.in_a(0).asUInt =/= 0.U), "mesh pe io.in_a not in")
    //    }
    //    when(io.out_valid) {
    //      assert((io.dataOut.asUInt =/= 0.U), "mesh pe io.dataOut not right")
    //    }
  }
  else {
    val sign = Reg(Vec(dataNumToPe, Bool()))
    val wmanti = Reg(Vec(dataNumToPe, UInt((config.manti_len + 1).W)))
    val amanti = Reg(Vec(dataNumToPe, UInt((config.manti_len + 1).W)))
    val exp = Reg(Vec(dataNumToPe, UInt((config.exp_width + 1).W)))
    val emaxModule = Module(new ExpMax(dataNumToPe, config.is_int8, config.exp_width))
    val RRregModule = Module(new RRreg(dataNumToPe, config.exp_width, config.manti_len, config.is_int8, config.windowsize))
    val shiftOrchestModule = Module(new ShiftOrchest_fp32(dataNumToPe, config.is_int8, config.manti_len, config.exp_width))
    val adderTreeModule = Module(new AdderTree(inputType, outputType, accType, dataNumToPe, config.exp_width, config.manti_len, config.is_int8, config.data_width, config.reg_num))
    val gemmini_on = RegNext(io.in_valid)
    for (i <- 0 until dataNumToPe) {
      sign(i) := io.in_b(i).asUInt(config.sign_where) ^ io.in_a(i).asUInt(config.sign_where)
      wmanti(i) := Cat(1.U, io.in_b(i).asUInt(config.manti_len - 1, 0))
      amanti(i) := Cat(1.U, io.in_a(i).asUInt(config.manti_len - 1, 0))
      exp(i) := io.in_b(i).asUInt(config.exp_head, config.exp_tail) + io.in_a(i).asUInt(config.exp_head, config.exp_tail)
    }
    //
    shiftOrchestModule.io.exp := exp
    shiftOrchestModule.io.expMax := emaxModule.io.expMax
    emaxModule.io.exp := exp
    emaxModule.io.on := gemmini_on
    RRregModule.io.expMax := emaxModule.io.expMax
    RRregModule.io.valid := emaxModule.io.valid
    io.next := RRregModule.io.ochi.valid
    emaxModule.io.exp := exp
    shiftOrchestModule.io.wManti := wmanti
    RRregModule.io.aManti := amanti
    RRregModule.io.sign := sign
    RRregModule.io.sewo := shiftOrchestModule.io.sewo.asTypeOf(Vec(config.manti_len + 1, UInt(dataNumToPe.W)))
    for (i <- 0 until config.manti_len + 1) {
      RRregModule.io.sewo(i) := shiftOrchestModule.io.sewo(i).asUInt
    }
    //adderTreeModule.io.expMax <> RRregModule.io.expMaxToAdderTree
    adderTreeModule.io.expMax := RRregModule.io.emax
    adderTreeModule.io.e_valid := RRregModule.io.ochi.valid
    adderTreeModule.io.ochi <> RRregModule.io.ochi
    adderTreeModule.io.shift := io.shift
    io.dataOut.asUInt := adderTreeModule.io.data
    io.out_valid := adderTreeModule.io.valid
    io.next := RRregModule.io.ochi.valid
    //  when(io.in_valid) {
    //    assert((io.in_a(0).asUInt =/= 0.U), "mesh pe io.in_a not in")
    //  }
    //  when(io.out_valid) {
    //    assert((io.dataOut.asUInt =/= 0.U), "mesh pe io.dataOut not right")
    //  }
  }
}