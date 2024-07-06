import chisel3._
import chisel3.util._

class InstructionMem extends Module {
  val io = IO(new Bundle {
    val pc = Input(UInt(32.W))       // 当前指令地址
    val instruction = Output(UInt(32.W)) // 当前指令
  })

  val instMem = VecInit(Seq(
    "hfe010113".U(32.W),      // addi sp, sp, -32
    "h00812e23".U(32.W),      // sw s0, 28(sp)
    "h02010413".U(32.W),      // addi s0, sp, 32
    "hfea42623".U(32.W),      // sw a0, -20(s0)
    "hfec42783".U(32.W),      // lw a5, -20(s0)
    "h0007a783".U(32.W),      // lw a5, 0(a5)
    "h00a78713".U(32.W),      // addi a4, a5, 10
    "hfec42783".U(32.W),      // lw a5, -20(s0)
    "h00e7a023".U(32.W),      // sw a4, 0(a5)
    "h00000013".U(32.W),      // nop
    "h01c12403".U(32.W),      // lw s0, 28(sp)
    "h02010113".U(32.W),      // addi sp, sp, 32
    "h00008067".U(32.W),      // ret
    // 更多指令...
    "hfe010113".U(32.W),      // addi sp, sp, -32
    "h00112e23".U(32.W),      // sw ra, 28(sp)
    "h00812c23".U(32.W),      // sw s0, 24(sp)
    "h02010413".U(32.W),      // addi s0, sp, 32
    "h00100793".U(32.W),      // li a5, 1
    "hfef42623".U(32.W),      // sw a5, -20(s0)
    "hfec40793".U(32.W),      // addi a5, s0, -20
    "h00078513".U(32.W),      // mv a0, a5
    "hfadff0ef".U(32.W),      // jal ra, func
    "h00000793".U(32.W),      // li a5, 0
    "h00078513".U(32.W),      // mv a0, a5
    "h01c12083".U(32.W),      // lw ra, 28(sp)
    "h01812403".U(32.W),      // lw s0, 24(sp)
    "h02010113".U(32.W),      // addi sp, sp, 32
    "h00000013".U(32.W),      // nop



  ))

  io.instruction := instMem(io.pc >> 2) // 取指令地址的高位部分

}

object InstructionMem extends App {
  emitVerilog(new InstructionMem(),Array("--target-dir","generate"))
}
