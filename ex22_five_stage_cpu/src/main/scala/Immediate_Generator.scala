import chisel3._
import chisel3.util._

class Immediate_Generator extends Module {
  val io = IO(new Bundle {
    val instruction = Input(UInt(32.W))     // 输入32位指令
    val immediate_code = Input(UInt(3.W))      // 扩展操作码
    val immediate_out = Output(UInt(32.W))   // 输出32位立即数
  })
  val immediate_wire =WireInit(0.U(32.W)) // 默认输出0.U            
  
   switch(io.immediate_code) {
    is("b000".U) {  // I型指令立即数，符号扩展
      immediate_wire := Cat(Fill(20, io.instruction(31)), io.instruction(31, 20))
    }
    is("b001".U) { // U型指令立即数，高20位直接取指令的高20位，低12位补零
      immediate_wire := Cat(io.instruction(31, 12), 0.U(12.W))
    }
    is("b010".U) { // S型指令立即数，符号扩展
      immediate_wire := Cat(Fill(20, io.instruction(31)), io.instruction(31, 25), io.instruction(11, 7))
    }
    is("b011".U) { // B型指令立即数，符号扩展，注意位的重排列
      immediate_wire := Cat(Fill(20, io.instruction(31)), io.instruction(7), io.instruction(30, 25), io.instruction(11, 8), 0.U(1.W))
    }
    is("b100".U) { // J型指令立即数，符号扩展，注意位的重排列
      immediate_wire := Cat(Fill(12, io.instruction(31)), io.instruction(19, 12), io.instruction(20), io.instruction(30, 21), 0.U(1.W))
    }
    is("b101".U) { // 自定义立即数，符号扩展，并且将 imm_32 的第11位置0
      immediate_wire := Cat(Fill(20, io.instruction(31)), io.instruction(31, 20)).bitSet(10.U, false.B)
    }
    is("b111".U) { // 特殊情况，立即数为0
      immediate_wire := 0.U
    }
    //     default {
    //   imm32_wire := 0.U
    // }
  }

  io.immediate_out := immediate_wire
}

object Immediate_Generator extends App {
  emitVerilog(new Immediate_Generator(),Array("--target-dir","generate"))
}
