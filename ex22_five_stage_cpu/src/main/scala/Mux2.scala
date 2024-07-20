import chisel3._
import chisel3.util._

class Mux2 extends Module {
  val io = IO(new Bundle {
    val signal          = Input(Bool())              // 控制信号
    val a               = Input(UInt(32.W))          // 输入信号 a
    val b               = Input(UInt(32.W))          // 输入信号 b
    val out             = Output(UInt(32.W))         // 输出信号
  })

  io.out := Mux(io.signal, io.b, io.a) // 根据控制信号选择输出
}

object Mux2 extends App {
  emitVerilog(new Mux2(),Array("--target-dir","generate"))
}
