import chisel3._
import chisel3.util._

class PC extends Module {
  val io = IO(new Bundle {
    val pause   = Input(Bool())
    val next_pc = Input(UInt(32.W))
    val pc      = Output(UInt(32.W))
  })

  val pcReg = RegInit(52.U(32.W))

  pcReg := Mux((!io.pause), io.next_pc, pcReg)
  io.pc := pcReg
}

object PC extends App{
    emitVerilog(new PC(),Array("--target-dir","generate"))
    
}