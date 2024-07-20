import chisel3._
import chisel3.util._

class Mux3 extends Module {
  val io = IO(new Bundle {
    val signal    = Input(UInt(2.W))           // 控制信号
    val a         = Input(UInt(32.W))          // 输入信号 a
    val b         = Input(UInt(32.W))          // 输入信号 b
    val c         = Input(UInt(32.W))          // 输入信号 c
    val out       = Output(UInt(32.W))         // 输出信号
  })

  io.out := MuxLookup(io.signal, io.a, Array(
                          0.U -> io.a,
                          1.U -> io.b,
                          2.U -> io.c
  )) // 根据控制信号选择输出
}

object Mux3 extends App {
  emitVerilog(new Mux3(),Array("--target-dir","generate"))
}
