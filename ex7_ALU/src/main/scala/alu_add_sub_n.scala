import chisel3._
import chisel3.util._
import javax.swing.InputMap

//简单n位宽有符号数加减法运算器

class ALU_sub_and_n(val n:Int) extends Module{
val io= IO(new Bundle{
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val in_sel = Input(UInt(1.W))
    val out_result = Output(SInt(n.W))
    val out_overflow = Output(UInt(1.W))
    val out_zero = Output(UInt(1.W))
})
val in_b_env = Wire(SInt(n.W))
val Adder_nModule = Module(new Adder_N(n))
/*
        val A = Input(SInt(n.W))
        val B = Input(SInt(n.W))
        val Cin = Input(UInt(1.W))
        val Sum = Output(SInt(n.W))
        val Cout = Output(UInt(1.W))
*/

when(io.in_sel === 1.U){//减法
    in_b_env :=(~(io.in_b)+1.S)
    Adder_nModule.io.Cin := 0.U 
    Adder_nModule.io.A := io.in_a
    Adder_nModule.io.B := in_b_env
    io.out_result := Adder_nModule.io.Sum
    //检查最高位是否溢出
    io.out_overflow := (io.in_a(n-1)===io.in_b(n-1))&&
                        (Adder_nModule.io.Sum(n-1)=/=io.in_a(n-1))
    //检查结果是否为0                     
    io.out_zero := ~(0.U|io.out_result.asUInt)
}.otherwise{

    in_b_env :=io.in_b
    Adder_nModule.io.Cin := 0.U 
    Adder_nModule.io.A := io.in_a
    Adder_nModule.io.B := io.in_b
    io.out_result := Adder_nModule.io.Sum
    io.out_overflow := (io.in_a(n-1)===io.in_b(n-1))&&
                        (Adder_nModule.io.Sum(n-1)=/=io.in_a(n-1))
    io.out_zero := ~(0.U|io.out_result.asUInt)
    
}

}

object MyALU_sub_and_n extends App{
    emitVerilog(new ALU_sub_and_n(8),Array("--target-dir","generate"))

}
