import chisel3._
import chisel3.util._

//NOT ：output : ~in_a :UInt
class NOT(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(UInt(n.W))
    val out_not_a = Output(UInt(n.W))
})

    io.out_not_a := ~io.in_a

}

object MyNOT extends App{
    emitVerilog (new NOT(8),Array("--target-dir","generate"))
}

