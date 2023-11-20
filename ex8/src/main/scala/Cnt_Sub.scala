import chisel3._
import chisel3.util._

class Cnt_Sub extends  Module{
        val io = IO(new Bundle{
        val in_en = Input(UInt(1.W))
        val out_en = Output(UInt(1.W))
        val out_cnt = Output(UInt(8.W))

    })
    val cntReg = RegInit(9.U(8.W))
    cntReg := Mux(io.in_en===1.U,   (Mux((cntReg === 0.U), 9.U, cntReg - 1.U)),   0.U)
    when(io.in_en===1.U){
        io.out_cnt := cntReg
        io.out_en := 1.U
    }.otherwise{
        io.out_cnt := cntReg
        io.out_en := 0.U
    }
    
}

object MyCnt_sub extends App{
    emitVerilog (new Cnt_Sub(),Array("--target-dir","generate") )
}