import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class IMMTester(c: IMM) extends PeekPokeTester(c) {
  // 测试I型指令立即数
  poke(c.io.instr, "h00000093".U) // 指令：addi x1, x0, 0
  poke(c.io.extOP, "b000".U)
  step(1)
  expect(c.io.imm_32, "h00000000".U)

  // 测试U型指令立即数
  poke(c.io.instr, "h000000b7".U) // 指令：lui x1, 0
  poke(c.io.extOP, "b001".U)
  step(1)
  expect(c.io.imm_32, "h00000000".U)

  // 更多测试...
}

object IMMTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new IMM) {
    c => new IMMTester(c)
  }
}
