import  chisel3._
import chisel3.util._

//可定制n位宽无符号加法器
class Adder_N(val n:Int)  extends Module{


    val io =IO(new Bundle{
        val A = Input(UInt(n.W))
        val B = Input(UInt(n.W))
        val Cin = Input(UInt(1.W))
        val Sum = Output(UInt(n.W))
        val Cout = Output(UInt(1.W))
    })  
    val FAs = Array.fill(n)(Module(new Full_Adder()).io)

    val carry = Wire(Vec(n+1, UInt(1.W)))
    val sum = Wire(Vec(n, Bool()))


    carry(0) := io.Cin

    for (i <- 0 until n) {
        FAs(i).in_a := io.A(i)
        FAs(i).in_b := io.B(i)
        FAs(i).in_c := carry(i)
        carry(i+1) := FAs(i).out_c
        sum(i) := FAs(i).out_s
    }

    io.Sum := sum.asUInt
    io.Cout := carry(n)

}

object MyModuleAdder_N extends App{
    emitVerilog (new Adder_N(8),Array("--target-dir","generate"))
}
