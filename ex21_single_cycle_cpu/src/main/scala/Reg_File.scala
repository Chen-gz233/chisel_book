import chisel3._
import chisel3.util._

class RegFile extends Module {
  val io = IO(new Bundle {
    val rst = Input(Bool())          // 复位信号
    val clk = Input(Clock())         // 时钟信号
    val write_reg = Input(Bool())    // 写寄存器使能信号
    val rs1 = Input(UInt(5.W))       // 源寄存器1地址
    val rs2 = Input(UInt(5.W))       // 源寄存器2地址
    val target_reg = Input(UInt(5.W))// 目标寄存器地址
    val write_rd_data = Input(UInt(32.W)) // 写入目标寄存器的数据

    val read_rs1_data = Output(UInt(32.W))// 读取源寄存器1的数据
    val read_rs2_data = Output(UInt(32.W))// 读取源寄存器2的数据
  })

  // 定义32个32位寄存器
  val regs = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
  
  // 初始化寄存器x2为128
  regs(2) := 128.U

  // 同步写寄存器
  when(io.write_reg && io.target_reg =/= 0.U) {
    regs(io.target_reg) := io.write_rd_data
  }

  // 异步读取寄存器1
  io.read_rs1_data := Mux(io.rs1 === 0.U, 0.U, regs(io.rs1))

  // 异步读取寄存器2
  io.read_rs2_data := Mux(io.rs2 === 0.U, 0.U, regs(io.rs2))
}

object RegFile extends App {
  emitVerilog(new RegFile(),Array("--target-dir","generate"))
}
