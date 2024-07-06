import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class DataMemTester(c: DataMem) extends PeekPokeTester(c) {
  // 测试写入32位数据
  poke(c.io.write_mem, "b01".U)
  poke(c.io.address, 0.U)
  poke(c.io.write_data, "hDEADBEEF".U)
  step(1)
  
  // 测试读取32位数据
  poke(c.io.read_mem, "b001".U)
  poke(c.io.address, 0.U)
  expect(c.io.out_mem, "hDEADBEEF".U)
  
  // 测试写入16位数据
  poke(c.io.write_mem, "b10".U)
  poke(c.io.address, 4.U)
  poke(c.io.write_data, "hBEEF".U)
  step(1)
  
  // 测试读取16位数据
  poke(c.io.read_mem, "b010".U)
  poke(c.io.address, 4.U)
  expect(c.io.out_mem, "h0000BEEF".U)
  
  // 更多测试...
}

object DataMemTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new DataMem) {
    c => new DataMemTester(c)
  }
}
