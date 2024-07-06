import chisel3._
import chisel3.util._

class IMM extends Module {
  val io = IO(new Bundle {
    val instr = Input(UInt(32.W))  // 输入32位指令
    val extOP = Input(UInt(3.W))   // 扩展操作码
    val imm_32 = Output(UInt(32.W)) // 输出32位立即数
  })

  io.imm_32 := 0.U                 // 默认输出值

  switch(io.extOP) {
    is("b000".U) { // I型指令立即数，符号扩展
      io.imm_32 := Cat(Fill(20, io.instr(31)), io.instr(31, 20))
    }
    is("b001".U) { // U型指令立即数，高20位直接取指令的高20位，低12位补零
      io.imm_32 := Cat(io.instr(31, 12), 0.U(12.W))
    }
    is("b010".U) { // S型指令立即数，符号扩展
      io.imm_32 := Cat(Fill(20, io.instr(31)), io.instr(31, 25), io.instr(11, 7))
    }
    is("b011".U) { // B型指令立即数，符号扩展，注意位的重排列
      io.imm_32 := Cat(Fill(20, io.instr(31)), io.instr(7), io.instr(30, 25), io.instr(11, 8), 0.U(1.W))
    }
    is("b100".U) { // J型指令立即数，符号扩展，注意位的重排列
      io.imm_32 := Cat(Fill(12, io.instr(31)), io.instr(19, 12), io.instr(20), io.instr(30, 21), 0.U(1.W))
    }
    is("b101".U) { // 自定义立即数，符号扩展，并且将 imm_32 的第11位置0
      io.imm_32 := Cat(Fill(20, io.instr(31)), io.instr(31, 20))
      io.imm_32 := io.imm_32.bitSet(10, false.B)
    }
    is("b111".U) { // 特殊情况，立即数为0
      io.imm_32 := 0.U
    }
    default {
      io.imm_32 := 0.U
    }
  }
}

object IMM extends App {
  emitVerilog(new IMM(),Array("--target-dir","generate"))
}
