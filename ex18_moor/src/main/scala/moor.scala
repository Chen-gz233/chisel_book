import chisel3._
import chisel3.util._

class moor extends Module{
    val io= IO(new Bundle{
        val din = Input(Bool())
        val dout = Output(Bool())
    })
    //stage 
    val input_0 :: rise :: input_1 :: Nil = Enum(3)
    val StageReg = RegInit(input_0)
    
    //true table
    switch(StageReg){
        is(input_0){
            when(io.din === 1.B){
                StageReg := rise 
            }.otherwise{
                StageReg:=StageReg
            }
            
        }
        is(rise){
            when(io.din===1.B){
                StageReg := input_1
            }.otherwise{
                StageReg := input_0
            }
        }
        is(input_1){
            when(io.din === 0.B){
                StageReg := input_0
            }.otherwise{
                StageReg := StageReg
            }
        }
    }
    io.dout := Mux(StageReg === input_1,1.B,0.B)

}

object moor extends App{
     emitVerilog(new moor(),Array("--target-dir","generate"))
}