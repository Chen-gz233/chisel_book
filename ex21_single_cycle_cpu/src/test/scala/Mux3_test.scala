import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class Mux3Tester(c: Mux3) extends PeekPokeTester(c) {
  // 测试信号为00时的情况
  poke(c.io.signal, 0.U)
  poke(c.io.a, 42.U)
  poke(c.io.b, 84.U)
  poke(c.io.c, 126.U)
  expect(c.io.out, 42.U)

  // 测试信号为01时的情况
  poke(c.io.signal, 1.U)
  poke(c.io.a, 42.U)
  poke(c.io.b, 84.U)
  poke(c.io.c, 126.U)
  expect(c.io.out, 84.U)

  // 测试信号为10时的情况
  poke(c.io.signal, 2.U)
  poke(c.io.a, 42.U)
  poke(c.io.b, 84.U)
  poke(c.io.c, 126.U)
  expect(c.io.out, 126.U)
}

object Mux3Tester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new Mux3) {
    c => new Mux3Tester(c)
  }
}
