import chisel3._
import chisel3.util._

//OR in_a | in_b
class OR(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(UInt(n.W))
    val in_b = Input(UInt(n.W))
    val out_or = Output(UInt(n.W))
})

    io.out_or:= io.in_a | io.in_b     //按位或：|  逻辑或：||

}

object MyOR extends App{
    emitVerilog (new OR(8),Array("--target-dir","generate"))
}

