import chisel3._
import chisel3.util._

//COMP in_a AND in_b
class IsEqual(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val out_equal = Output(UInt(1.W))
})
    when(io.in_a === io.in_b){
    io.out_equal:= 1.U      
    }.otherwise{
        io.out_equal:= 0.U  
    }
}

object MyIsEqual extends App{
    emitVerilog (new IsEqual(8),Array("--target-dir","generate"))
}

