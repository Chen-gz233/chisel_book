import chisel3._
import chisel3.util._
//简单双口RAM----简单双口模式支持同时读写（一读一写）
class RAM_2(val n:Int) extends  Module{
        val io = IO(new Bundle{     //：输入端、输出端和控制端口
        val in_read_addr = Input(UInt(n.W))
        val in_read_en = Input(Bool()) 

        val in_write_addr = Input(UInt(n.W))
        val in_write_data = Input(UInt(n.W))
        val in_write_en = Input(Bool()) 
        

        val out_read_data = Output(UInt(n.W))
        val out_en = Output(Bool())


    })

    //val register = Reg(UInt(12.W))                //定义一个寄存器变量
    //val myReg_1 = RegInit(UInt(12.W), 0.U)          //定义寄存器并初始化为0
    //val myReg_2 = RegInit(0.U(12.W))
    //val v = Wire(Vec(3, UInt(4.W)))                       //二维数组
    //val fifo = RegInit(VecInit(Seq.fill(3)(0.U(dw.W))))   //二维寄存器

    val num = (1 << n):Int      //fill里面要Int类型，不能是UInt
    val fifo = RegInit(VecInit(Seq.fill(num)(0.U(n.W))))   //二维寄存器


    when(io.in_write_en & !io.in_read_en){       //写使能

        fifo(io.in_write_addr) := io.in_write_data
        io.out_en := false.B
        io.out_read_data := 0.U

    }.elsewhen(io.in_read_en & !io.in_write_en){      //读使能
        io.out_en := true.B
        io.out_read_data := fifo(io.in_read_addr)

    }.otherwise{                                        //读 and 写
        fifo(io.in_write_addr) := io.in_write_data
        io.out_read_data := fifo(io.in_read_addr)
        io.out_en := true.B
    }
}

object myRAM_2 extends App{
    emitVerilog (new RAM_2(8),Array("--target-dir","generate") )
}