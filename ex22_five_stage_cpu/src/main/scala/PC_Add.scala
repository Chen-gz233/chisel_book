import chisel3._
import chisel3.util._

class PC_Add extends Module {
  val io = IO(new Bundle {
    val pc          = Input(UInt(32.W))
    val imm32       = Input(UInt(32.W))
    val rs1Data     = Input(UInt(32.W))

    val pcImm       = Output(UInt(32.W))
    val rs1Imm      = Output(UInt(32.W))
  })

  io.pcImm      := io.pc      +  io.imm32
  io.rs1Imm     := io.rs1Data +  io.imm32
  
}

object PC_Add extends App {
  emitVerilog(new PC_Add(),Array("--target-dir","generate"))
}
