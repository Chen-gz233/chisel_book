import chisel3._
import chisel3.util._

//COMP in_a AND in_b
class COMP(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val out_comp = Output(UInt(1.W))
})
    when(io.in_a < io.in_b){
        io.out_comp := 1.U     
    }.otherwise{
        io.out_comp := 0.U 
    }
}

object MyCOMP extends App{
    emitVerilog (new COMP(8),Array("--target-dir","generate"))
}

