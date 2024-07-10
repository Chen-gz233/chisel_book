import chisel3._
import chisel3.util._

class Reg_Banks extends Module {
  val io = IO(new Bundle {
    val write_valid = Input(Bool())    // 写寄存器使能信号
    val rs1_address = Input(UInt(5.W))       // 源寄存器1地址
    val rs2_address = Input(UInt(5.W))       // 源寄存器2地址
    val rd_address  = Input(UInt(5.W))// 目标寄存器地址
    val write_rd_data = Input(UInt(32.W)) // 写入目标寄存器的数据

    val read_rs1_data = Output(UInt(32.W))// 读取源寄存器1的数据
    val read_rs2_data = Output(UInt(32.W))// 读取源寄存器2的数据
  })

  // 定义32个32位寄存器组
  val Reg_Banks = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
  
  // 初始化寄存器x2为128
  Reg_Banks(2) := 128.U

  // 同步写寄存器
  when(io.write_valid && io.rd_address =/= 0.U) {
    Reg_Banks(io.rd_address) := io.write_rd_data
  }

  // 异步读取寄存器1
  io.read_rs1_data := Mux(io.rs1_address === 0.U, 0.U, Reg_Banks(io.rs1_address))

  // 异步读取寄存器2
  io.read_rs2_data := Mux(io.rs2_address === 0.U, 0.U, Reg_Banks(io.rs2_address))
}

object Reg_Banks extends App {
  emitVerilog(new Reg_Banks(),Array("--target-dir","generate"))
}
