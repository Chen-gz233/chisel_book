import chisel3._
import chisel3.util._

class Reg_1 extends  Module{
    val io = IO(new Bundle{
        val in = Input(UInt(12.W))
        //val in_sel = Input(UInt(2.W)) 
        val out = Output(UInt(12.W))

    })
    val myReg_1 = Reg(UInt(12.W))                //定义一个寄存器变量

    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_1 = RegInit(0.U(12.W))

    myReg_1 := io.in 
    //myReg_2 := myReg_1 + 1.U                       
    io.out := myReg_1                            //一个周期后，io.out = io.in + 1

    //io.out := RegNext(io.in + 1.U)                //和上面是等价的

    


}

object myReg_1 extends App{
    emitVerilog (new Reg_1(),Array("--target-dir","generate") )
}