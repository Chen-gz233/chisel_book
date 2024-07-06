import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class ALUTester(c: ALU) extends PeekPokeTester(c) {
  // 测试加法
  poke(c.io.aluc, "b00000".U)
  poke(c.io.a, 10.U)
  poke(c.io.b, 32.U)
  step(1)
  expect(c.io.out, 42.U)

  // 测试减法
  poke(c.io.aluc, "b00001".U)
  poke(c.io.a, 42.U)
  poke(c.io.b, 32.U)
  step(1)
  expect(c.io.out, 10.U)

  // 更多测试...
}

object ALUTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new ALU) {
    c => new ALUTester(c)
  }
}
