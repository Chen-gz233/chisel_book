import chisel3._
import chisel3.util._

//AND in_a & in_b
class AND(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(UInt(n.W))
    val in_b = Input(UInt(n.W))
    val out_and = Output(UInt(n.W))
})

    io.out_and:= io.in_a & io.in_b     //按位与：&  逻辑与：&&

}

object MyAND extends App{
    emitVerilog (new AND(8),Array("--target-dir","generate"))
}

