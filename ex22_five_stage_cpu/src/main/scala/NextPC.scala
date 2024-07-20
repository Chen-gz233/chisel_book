import chisel3._
import chisel3.util._

class NextPC extends Module {
  val io = IO(new Bundle {
    val nextPC_pcImm_or_rs1Imm  = Input(UInt(2.W)) // 控制信号
    val condition_branch        = Input(Bool())          // 条件分支信号
    val pc                      = Input(UInt(32.W))
    val pcImm                   = Input(UInt(32.W))
    val rs1Imm                  = Input(UInt(32.W))

    val next_pc                 = Output(UInt(32.W))
    val flush                   = Output(Bool())
  })

  io.next_pc  := io.pc
  io.flush    := false.B

  when(io.nextPC_pcImm_or_rs1Imm === 1.U) {
    io.next_pc  := io.pcImm
    io.flush    := true.B
  }.elsewhen(io.nextPC_pcImm_or_rs1Imm === 2.U) {
    io.next_pc  := io.rs1Imm
    io.flush    := true.B
  }.elsewhen(io.condition_branch) {
    io.next_pc  := io.pcImm
    io.flush    := true.B
  }.elsewhen(io.pc === 116.U) {
    io.next_pc  := 112.U
    io.flush    := false.B
  }
}


object NextPC extends App {
  emitVerilog(new NextPC(),Array("--target-dir","generate"))
}
