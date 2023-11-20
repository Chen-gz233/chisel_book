import chisel3._
import chisel3.util._
import javax.swing.InputMap

//简单加减法运算器
class ALU_sub_and extends Module{
val io= IO(new Bundle{
    val in_a = Input(UInt(8.W))
    val in_b = Input(UInt(8.W))
    val in_sel = Input(UInt(1.W))
    val out_result = Output(UInt(8.W))
    val out_overflow = Output(UInt(1.W))
    val out_zero = Output(UInt(1.W))
})
val in_b_env = Wire(UInt(8.W))
val Adder_8Module = Module(new Adder_N(8))

when(io.in_sel === 1.U){//减法
    in_b_env :=(~(io.in_b)+1.U)
    Adder_8Module.io.Cin := 0.U 
    Adder_8Module.io.A := io.in_a
    Adder_8Module.io.B := in_b_env
    io.out_result := Adder_8Module.io.Sum
    io.out_overflow := (io.in_a(8-1)===io.in_b(8-1))&&
                        (Adder_8Module.io.Sum(8-1)=/=io.in_a(8-1))
    io.out_zero := ~(0.U|io.out_result)
}.otherwise{

    in_b_env :=io.in_b
    Adder_8Module.io.Cin := 0.U 
    Adder_8Module.io.A := io.in_a
    Adder_8Module.io.B := io.in_b
    io.out_result := Adder_8Module.io.Sum
    io.out_overflow := Adder_8Module.io.Cout
    io.out_zero := ~(0.U|io.out_result)
    
}

}

object MyALU_sub_and extends App{
    emitVerilog(new ALU_sub_and(),Array("--target-dir","generate"))

}
