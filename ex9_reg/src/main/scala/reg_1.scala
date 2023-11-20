import chisel3._
import chisel3.util._

class Register extends  Module{
    val io = IO(new Bundle{
    val in_a = Input(UInt(1.W))
    val in_en = Input(UInt(1.W)) 
    val out = Output(UInt(1.W))
    })

    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))

    val shiftReg = RegInit(0.U(1.W))

    shiftReg := Mux(io.in_en.asBool,io.in_a,shiftReg)
    io.out := shiftReg

    //引入shiftreg使out延后一个节拍输出
}

object myRegister extends App{
    emitVerilog (new Register(),Array("--target-dir","generate") )
}