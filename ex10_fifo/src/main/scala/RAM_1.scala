import chisel3._
import chisel3.util._
//单端口RAM----某一时刻，只读或者只写
class RAM_1 extends  Module{
        val io = IO(new Bundle{     //：输入端、输出端和控制端口
        val in_addr = Input(UInt(8.W))
        val in_data = Input(UInt(8.W))
        val in_en = Input(Bool()) 

        val out_data = Output(UInt(8.W))
        val out_en = Output(Bool())


    })

    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))
    //val v = Wire(Vec(3, UInt(4.W)))                       //二维数组
    //val fifo = RegInit(VecInit(Seq.fill(3)(0.U(dw.W))))   //二维寄存器


    val fifo = RegInit(VecInit(Seq.fill(256)(0.U(8.W))))   //二维寄存器


    when (io.in_en ){       //写使能

        fifo(io.in_addr) := io.in_data
        io.out_en := false.B
        io.out_data := 0.U

    }.otherwise{            //读使能

        io.out_data := fifo(io.in_addr)
        io.out_en := true.B
    }
}

object myRAM_1 extends App{
    emitVerilog (new RAM_1(),Array("--target-dir","generate") )
}