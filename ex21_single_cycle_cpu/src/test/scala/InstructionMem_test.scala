import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class InstructionMemTester(c: InstructionMem) extends PeekPokeTester(c) {
  // 测试读取指令
  for (i <- 0 until 13) {
    poke(c.io.pc, i * 4)
    expect(c.io.instruction, i match {
      case 0 => "hfe010113".U(32.W)
      case 1 => "h00812e23".U(32.W)
      case 2 => "h02010413".U(32.W)
      case 3 => "hfea42623".U(32.W)
      case 4 => "hfec42783".U(32.W)
      case 5 => "h0007a783".U(32.W)
      case 6 => "h00a78713".U(32.W)
      case 7 => "hfec42783".U(32.W)
      case 8 => "h00e7a023".U(32.W)
      case 9 => "h00000013".U(32.W)
      case 10 => "h01c12403".U(32.W)
      case 11 => "h02010113".U(32.W)
      case 12 => "h00008067".U(32.W)
    })
  }
}

object InstructionMemTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new InstructionMem) {
    c => new InstructionMemTester(c)
  }
}
