import chisel3._
import chisel3.util._

//XOR in_a ^ in_b
class XOR(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(UInt(n.W))
    val in_b = Input(UInt(n.W))
    val out_xor = Output(UInt(n.W))
})

    io.out_xor:= io.in_a ^ io.in_b     //异或 ^

}

object MyXOR extends App{
    emitVerilog (new XOR(8),Array("--target-dir","generate"))
}

