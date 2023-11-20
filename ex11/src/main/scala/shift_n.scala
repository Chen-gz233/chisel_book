import chisel3._
import chisel3.util._

class shift_n (val n:Int)extends  Module{
        val dio = IO(new Bundle{
        val in = Input(UInt(n.W))
        val shamt = Input(UInt(3.W))
        val L_R = Input(Bool())
        val A_L = Input(Bool())
        val dout = Output(UInt(n.W))

    })
    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))
    //val v = Wire(Vec(3, UInt(4.W)))                       //二维数组
    //val fifo = RegInit(VecInit(Seq.fill(3)(0.U(dw.W))))   //二维寄存器

    /*def 
    
    val shiftReg = Reg(UInt(4.W))
    
    val Q1 = Reg(UInt(1.W))
    val Q2 = Reg(UInt(1.W))
    val Q3 = Reg(UInt(1.W))
    val Q4 = Reg(UInt(1.W))

    shiftReg := Cat(shiftReg(2, 0), io.in)
    
    Q1 := shiftReg(0)
    Q2 := shiftReg(1)
    Q3 := shiftReg(2)
    Q4 := shiftReg(3)

    io.out := shiftReg(3)
    */
}

object myshift_n extends App{
    emitVerilog (new shift_n(1),Array("--target-dir","generate") )
}