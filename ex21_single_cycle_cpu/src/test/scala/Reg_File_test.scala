import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class RegFileTester(c: RegFile) extends PeekPokeTester(c) {
  // 测试复位信号
  poke(c.io.rst, true.B)
  step(1)
  expect(c.io.read_rs1_data, 0.U)
  expect(c.io.read_rs2_data, 0.U)
  
  // 测试写寄存器
  poke(c.io.rst, false.B)
  poke(c.io.write_reg, true.B)
  poke(c.io.target_reg, 1.U)
  poke(c.io.write_rd_data, 42.U)
  step(1)
  poke(c.io.rs1, 1.U)
  poke(c.io.rs2, 1.U)
  expect(c.io.read_rs1_data, 42.U)
  expect(c.io.read_rs2_data, 42.U)
}

object RegFileTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new RegFile) {
    c => new RegFileTester(c)
  }
}
