import chisel3._
import chisel3.util._

class Register_2 extends  Module{
    val io = IO(new Bundle{
    val in_a = Input(UInt(4.W))
    val in_en = Input(Bool()) 
    val in_clr = Input(Bool())
    val out = Output(UInt(4.W))
    })

    val shiftReg = Reg(UInt(4.W))
    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))

    when(io.in_clr){
        shiftReg := io.in_a
    }.elsewhen(!io.in_clr & io.in_en){
        shiftReg := shiftReg + 1.U
    }.otherwise{
        shiftReg := shiftReg
    }
    io.out := shiftReg
}

object myRegister_2 extends App{
    emitVerilog (new Register_2(),Array("--target-dir","generate") )
}