import chisel3._
import chisel3.util._

class PC_Add4 extends Module {
  val io = IO(new Bundle {
    val pc_in   = Input(UInt(32.W))
    val pc_out  = Output(UInt(32.W))
  })

  io.pc_out := io.pc_in + 4.U
}

object PC_Add4 extends App {
  emitVerilog(new PC_Add4(),Array("--target-dir","generate"))
}
