import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class Mux2Tester(c: Mux2) extends PeekPokeTester(c) {
  // 测试信号为0时的情况
  poke(c.io.signal, false.B)
  poke(c.io.a, 42.U)
  poke(c.io.b, 84.U)
  expect(c.io.out, 42.U)

  // 测试信号为1时的情况
  poke(c.io.signal, true.B)
  poke(c.io.a, 42.U)
  poke(c.io.b, 84.U)
  expect(c.io.out, 84.U)
}

object Mux2Tester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new Mux2) {
    c => new Mux2Tester(c)
  }
}
