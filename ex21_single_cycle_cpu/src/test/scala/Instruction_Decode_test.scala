import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class IDTester(c: ID) extends PeekPokeTester(c) {
  // 测试指令解码
  poke(c.io.instr, "hfe010113".U)
  expect(c.io.opcode, "h13".U)
  expect(c.io.rd, "h02".U)
  expect(c.io.func3, "h0".U)
  expect(c.io.rs1, "h00".U)
  expect(c.io.rs2, "h00".U)
  expect(c.io.func7, "h7e".U)
}

object IDTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new ID) {
    c => new IDTester(c)
  }
}
