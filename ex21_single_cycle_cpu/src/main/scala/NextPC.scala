import chisel3._
import chisel3.util._

class NextPC extends Module {
  val io = IO(new Bundle {
    val nextPC_pc_or_rs1 = Input(UInt(2.W)) // 控制信号
    val condition_branch = Input(Bool())       // 条件分支信号
    val pc = Input(UInt(32.W))                 // 当前指令地址
    val offset = Input(UInt(32.W))             // 偏移量
    val rs1Data = Input(UInt(32.W))            // 寄存器 rs1 的数据
    val next_pc = Output(UInt(32.W))           // 下一条指令地址
  })

  // 默认情况下，next_pc 为 pc + 4（顺序执行）
  io.next_pc := io.pc + 4.U

  when(io.nextPC_pc_or_rs1 === "b01".U) {
    io.next_pc := io.pc + io.offset         // 使用 pc + offset 计算下一条指令地址
  } .elsewhen(io.nextPC_pc_or_rs1 === "b10".U) {
    io.next_pc := io.rs1Data + io.offset    // 使用 rs1Data + offset 计算下一条指令地址
  } .elsewhen(io.condition_branch) {
    io.next_pc := io.pc + io.offset         // 在条件满足时，使用 pc + offset 计算下一条指令地址
  }
}

object NextPC extends App {
  emitVerilog(new NextPC(),Array("--target-dir","generate"))
}
