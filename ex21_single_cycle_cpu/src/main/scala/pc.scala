import chisel3._
import chisel3.util._

class PC extends Module {
  val io = IO(new Bundle {
    val rst     = Input(Bool())        // 复位信号
    val next_pc = Input(UInt(32.W))    // 下一条指令地址

    val pc      = Output(UInt(32.W))   // 当前指令地址
  })

  val pcReg = RegInit(0.U(32.W))       // 初始化PC寄存器

  when (io.rst) {
    pcReg := 0x34.U                   // 复位时，PC被设置为0x34
  } .otherwise {
    pcReg := io.next_pc               // 否则，PC被更新为next_pc的值
  }

  io.pc := pcReg                       // 输出当前PC值
}

object PC extends App{
    emitVerilog(new PC(),Array("--target-dir","generate"))
    
}