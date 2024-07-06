import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class ControllerTester(c: Controller) extends PeekPokeTester(c) {
  // 测试R型指令
  poke(c.io.opcode, "b0110011".U)
  poke(c.io.func3, "b000".U)
  poke(c.io.func7, "b0000000".U)
  step(1)
  expect(c.io.write_reg, true.B)
  expect(c.io.rs2Data_EX_imm32_4, "b00".U)
  expect(c.io.aluc, "b00000".U)

  // 测试I型指令
  poke(c.io.opcode, "b0010011".U)
  poke(c.io.func3, "b000".U)
  poke(c.io.func7, "b0000000".U)
  step(1)
  expect(c.io.write_reg, true.B)
  expect(c.io.rs2Data_EX_imm32_4, "b01".U)
  expect(c.io.aluc, "b00000".U)
}

object ControllerTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new Controller) {
    c => new ControllerTester(c)
  }
}
