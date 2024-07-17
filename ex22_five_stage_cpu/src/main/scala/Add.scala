import chisel3._
import chisel3.util._

class Add extends Module {
  val io = IO(new Bundle {
    val pc_in = Input(UInt(32.W))
    val pc_out = Output(UInt(32.W))
  })

  io.pc_out := io.pc_in + 4.U
}

object Add extends App {
  emitVerilog(new Add(),Array("--target-dir","generate"))
}
