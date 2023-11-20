import chisel3._
import chisel3.util._

//逻辑移位不考虑输入数据的符号位
class shiftReg_L(val n:Int) extends  Module{
        val io = IO(new Bundle{
        val in = Input(UInt(n.W))
        val out = Output(UInt(n.W))

    })
    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))
    //val v = Wire(Vec(3, UInt(4.W)))                       //二维数组
    //val fifo = RegInit(VecInit(Seq.fill(3)(0.U(dw.W))))   //二维寄存器

    val N_4 = (4*n):Int
    val shiftReg = Reg(UInt(N_4.W))     //神奇，这里不能直接用4*n，必须转一个int
    
    val Q1 = Reg(UInt(n.W))
    val Q2 = Reg(UInt(n.W))
    val Q3 = Reg(UInt(n.W))
    val Q4 = Reg(UInt(n.W))

    shiftReg := Cat(shiftReg(3*n-1, 0), io.in)
    
    Q1 := shiftReg(n-1,0)
    Q2 := shiftReg(2*n-1,n)
    Q3 := shiftReg(3*n-1,2*n)
    Q4 := shiftReg(4*n-1,3*n)

    io.out := shiftReg(4*n-1,3*n)



}

object myshiftReg_L extends App{
    emitVerilog (new shiftReg_L(8),Array("--target-dir","generate") )
}