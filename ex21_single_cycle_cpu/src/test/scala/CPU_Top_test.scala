import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class CPUTester(c: CPU) extends PeekPokeTester(c) {
  // 初始化复位信号
  poke(c.io.rst, true.B)
  step(1)
  poke(c.io.rst, false.B)

  // 测试 CPU 各个信号和模块是否正确连接并工作
  // ...
}

object CPUTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new CPU) {
    c => new CPUTester(c)
  }
}
