import chisel3._

class ID extends Module {
  val io = IO(new Bundle {
    val instr  = Input(UInt(32.W)) // 输入32位指令

    val opcode = Output(UInt(7.W)) // 操作码
    val func3  = Output(UInt(3.W)) // 功能码3
    val func7  = Output(UInt(7.W)) // 功能码7
    val rd     = Output(UInt(5.W)) // 目标寄存器地址
    val rs1    = Output(UInt(5.W)) // 源寄存器1地址
    val rs2    = Output(UInt(5.W)) // 源寄存器2地址
  })

  io.opcode := io.instr(6, 0)      // 指令的最低7位是操作码
  io.rd     := io.instr(11, 7)     // 目标寄存器地址位于第11到第7位
  io.func3  := io.instr(14, 12)    // 功能码3位于第14到第12位
  io.rs1    := io.instr(19, 15)    // 源寄存器1地址位于第19到第15位
  io.rs2    := io.instr(24, 20)    // 源寄存器2地址位于第24到第20位
  io.func7  := io.instr(31, 25)    // 功能码7位于第31到第25位
}

object ID extends App {
  emitVerilog(new ID(),Array("--target-dir","generate"))
}

