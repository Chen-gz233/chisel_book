import  chisel3._
import chisel3.util._

class Adder_8  extends Module{

//8位+8位——无符号全加器
    val io =IO(new Bundle{
        val in_a = Input(UInt(8.W))
        val in_b = Input(UInt(8.W))
        //val out = Output(Vec(9, UInt(1.W)))
        val out = Output(UInt(9.W))
    })  
    val FA0 = Module(new Full_Adder())
    val FA1 = Module(new Full_Adder())
    val FA2 = Module(new Full_Adder())
    val FA3 = Module(new Full_Adder())
    val FA4 = Module(new Full_Adder())
    val FA5 = Module(new Full_Adder())
    val FA6 = Module(new Full_Adder())
    val FA7 = Module(new Full_Adder())
    val out_temp = RegInit(0.U(9.W))
    //val out_temp2 = WireInit(0.U(9.W))
    val out_temp2 = Wire(Vec(9, UInt(1.W)))



    FA0.io.in_a := io.in_a(0)
    FA0.io.in_b := io.in_b(0)
    FA0.io.in_c := 0.U
    FA1.io.in_c := FA0.io.out_c
    out_temp2(0) := FA0.io.out_s 


    FA1.io.in_a := io.in_a(1)
    FA1.io.in_b := io.in_b(1)
    FA2.io.in_c := FA1.io.out_c
    out_temp2(1)   := FA1.io.out_s 

    FA2.io.in_a := io.in_a(2)
    FA2.io.in_b := io.in_b(2)
    FA3.io.in_c := FA2.io.out_c
    out_temp2(2)   := FA2.io.out_s 

    FA3.io.in_a := io.in_a(3)
    FA3.io.in_b := io.in_b(3)
    FA4.io.in_c := FA3.io.out_c
    out_temp2(3)   := FA3.io.out_s 

    FA4.io.in_a := io.in_a(4)
    FA4.io.in_b := io.in_b(4)
    FA5.io.in_c := FA4.io.out_c
    out_temp2(4)   := FA4.io.out_s

    FA5.io.in_a := io.in_a(5)
    FA5.io.in_b := io.in_b(5)
    FA6.io.in_c := FA5.io.out_c
    out_temp2(5)   := FA5.io.out_s 

    FA6.io.in_a := io.in_a(6)
    FA6.io.in_b := io.in_b(6)
    FA7.io.in_c := FA6.io.out_c
    out_temp2(6)   := FA6.io.out_s 

    FA7.io.in_a := io.in_a(7)
    FA7.io.in_b := io.in_b(7)

    out_temp2(7)   := FA7.io.out_s 
    out_temp2(8)   := FA7.io.out_c

    io.out := out_temp2.asUInt
    

}

object MyModule extends App{
    emitVerilog (new Adder_8(),Array("--target-dir","generate"))
}
