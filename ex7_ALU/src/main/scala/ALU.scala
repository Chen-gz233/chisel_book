import chisel3._
import chisel3.util._
import javax.swing.InputMap

//简单加减法运算器
class ALU (val n:Int)extends Module{
val io= IO(new Bundle{
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val in_sel = Input(UInt(3.W))
    val out_result = Output(SInt(n.W))
    val out_overflow = Output(UInt(1.W))
    val out_zero = Output(UInt(1.W))
    val out_xor = Output(UInt(n.W))
    val out_and = Output(UInt(n.W))
    val out_or = Output(UInt(n.W))
    val out_not = Output(UInt(n.W))
    val out_compare = Output(UInt(1.W))
    val out_equal = Output(UInt(1.W))


})
val in_b_env = Wire(SInt(n.W))


when(io.in_sel === 1.U){//减法
    val Adder_8Module = Module(new Adder_N(n))
    in_b_env :=(~(io.in_b)+1.S)
    Adder_8Module.io.Cin := 0.U 
    Adder_8Module.io.A := io.in_a
    Adder_8Module.io.B := in_b_env
    io.out_result := Adder_8Module.io.Sum
    io.out_overflow := (io.in_a(n-1)===io.in_b(n-1))&&
                        (Adder_8Module.io.Sum(n-1)=/=io.in_a(n-1))
    io.out_zero := ~(0.U|io.out_result.asUInt)

    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S

}.elsewhen(io.in_sel === 0.U){  //加法
    val Adder_8Module = Module(new Adder_N(n))
    in_b_env :=io.in_b
    Adder_8Module.io.Cin := 0.U 
    Adder_8Module.io.A := io.in_a
    Adder_8Module.io.B := io.in_b
    io.out_result := Adder_8Module.io.Sum
    io.out_overflow := (io.in_a(n-1)===io.in_b(n-1))&&
                        (Adder_8Module.io.Sum(n-1)=/=io.in_a(n-1))
    io.out_zero := ~(0.U|io.out_result.asUInt)



    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S

}.elsewhen(io.in_sel === 2.U){  //取反 Not A

    val U_in_a = io.in_a.asUInt
    val NotModule = Module(new NOT(n))
    NotModule.io.in_a := U_in_a 
    io.out_not := NotModule.io.out_not_a
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S 

}.elsewhen(io.in_sel === 3.U){//与

    val U_in_a = io.in_a.asUInt
    val U_in_b = io.in_b.asUInt
    val ANDModule = Module(new AND(n))
    ANDModule.io.in_a := U_in_a
    ANDModule.io.in_b := U_in_b
    io.out_and := ANDModule.io.out_and
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_xor     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S 

}.elsewhen(io.in_sel === 4.U){//或

    val U_in_a = io.in_a.asUInt
    val U_in_b = io.in_b.asUInt
    val ORModule = Module(new OR(n))
    ORModule.io.in_a := U_in_a
    ORModule.io.in_b := U_in_b
    io.out_or := ORModule.io.out_or 
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S

}.elsewhen(io.in_sel === 5.U){//异或

    val U_in_a = io.in_a.asUInt
    val U_in_b = io.in_b.asUInt
    val XORModule = Module(new XOR(n))
    XORModule.io.in_a := U_in_a
    XORModule.io.in_b := U_in_b
    io.out_xor := XORModule.io.out_xor 
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S


}.elsewhen(io.in_sel === 6.U){//比较大小

    val COMPModule = Module(new COMP(n))
    COMPModule.io.in_a := io.in_a
    COMPModule.io.in_b := io.in_b
    io.out_compare := COMPModule.io.out_comp 
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S



}.elsewhen(io.in_sel === 7.U){//判断相等

    val IsEqualModule = Module(new IsEqual(n))
    IsEqualModule.io.in_a := io.in_a
    IsEqualModule.io.in_b := io.in_b
    io.out_equal := IsEqualModule.io.out_equal 
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    in_b_env       := 0.S

}.otherwise{
    io.out_result  := 0.S
    io.out_overflow:= 0.U
    io.out_zero    := 0.U
    io.out_xor     := 0.U
    io.out_and     := 0.U
    io.out_or      := 0.U
    io.out_not     := 0.U
    io.out_compare := 0.U
    io.out_equal   := 0.U
    in_b_env       := 0.S

}

}

object MyALU extends App{
    emitVerilog(new ALU(32),Array("--target-dir","generate"))

}
