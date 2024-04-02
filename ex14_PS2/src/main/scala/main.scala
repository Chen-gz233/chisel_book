import chisel3._
import chisel3.util._

class PS_2 extends  Module{
    val io = IO(new Bundle{
        val in_PS2D = Input(Bool())
        val in_PS2C = Input(Bool()) 
        val out = Output(UInt(11.W))
        //键盘以每帧11位的格式串行传送数据给主机
        //第1位是开始位（逻辑0）
        //后面跟8位数据位
        //1个奇偶校验位（奇校验）
        //1位停止位（逻辑1）
    })
    val PS2C= RegInit(1.U(1.W))    
}

object myPS_2 extends App{
    emitVerilog (new PS_2(),Array("--target-dir","generate") )
}