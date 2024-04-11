import chisel3._
import chisel3.util._

class mealy extends Module{
    val io = IO(new Bundle{
        val din = Input(Bool())
        val dout = Output(Bool())
    }) 
    val input_0 :: input_1 ::Nil = Enum(2)

    val StageReg = RegInit (input_0)

    switch(StageReg){
        is(input_0){
            when(io.din === 1.B){
                StageReg := input_1
           }.otherwise{
            StageReg := StageReg
           }
        }

        is(input_1){
            when(io.din === 1.B){
                StageReg := StageReg
                //io.dout  := 1.B   
            }.otherwise{
                StageReg := input_0
            }
        }
    }

    io.dout  := Mux(StageReg === input_1,1.B,0.B)
}

object mealy extends App{
    emitVerilog(new mealy(),Array("--target-dir","generate"))
}