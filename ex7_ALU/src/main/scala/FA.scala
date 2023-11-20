import chisel3._
import chisel3.util._

//全加器
class Full_Adder extends Module{
val io= IO(new Bundle{
    val in_a = Input(UInt(1.W))
    val in_b = Input(UInt(1.W))
    val in_c = Input(UInt(1.W))
    val out_s = Output(UInt(1.W))
    val out_c = Output(UInt(1.W))


})
    val a_xor_b = io.in_a ^ io.in_b
    val a_and_b = io.in_a & io.in_b
    io.out_s := io.in_c ^ a_xor_b
    
    val c_and_axorb = io.in_c & a_xor_b
    
    io.out_c := c_and_axorb |  a_and_b

}

object MyFull_Adder extends App{
    emitVerilog (new Full_Adder(),Array("--target-dir","generate"))
}

