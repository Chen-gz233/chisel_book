import chisel3._
import chisel3.util._

class Cnt_Add extends  Module{
        val io = IO(new Bundle{
        val in_en = Input(UInt(1.W))
        val out_en = Output(UInt(1.W))
        val out_cnt = Output(UInt(8.W))

    })

    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))

    val cntReg = RegInit(0.U(8.W))

    
    cntReg := Mux(io.in_en===1.U,   (Mux((cntReg === 9.U), 0.U, cntReg + 1.U)),   0.U)
    when(io.in_en===1.U){
        io.out_cnt := cntReg
        io.out_en := 1.U
    }.otherwise{
        io.out_cnt := cntReg
        io.out_en := 0.U
    }
    
}

object MyCnt_add extends App{
    emitVerilog (new Cnt_Add(),Array("--target-dir","generate") )
}