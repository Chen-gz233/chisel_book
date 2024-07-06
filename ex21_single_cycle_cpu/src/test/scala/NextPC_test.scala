import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class NextPCTester(c: NextPC) extends PeekPokeTester(c) {
  // 测试顺序执行
  poke(c.io.pc, 4.U)
  poke(c.io.pcImm_NEXTPC_rs1Imm, 0.U)
  poke(c.io.condition_branch, false.B)
  step(1)
  expect(c.io.next_pc, 8.U)

  // 测试使用 pc + offset 计算下一条指令地址
  poke(c.io.pc, 4.U)
  poke(c.io.pcImm_NEXTPC_rs1Imm, 1.U)
  poke(c.io.offset, 8.U)
  step(1)
  expect(c.io.next_pc, 12.U)

  // 测试使用 rs1Data + offset 计算下一条指令地址
  poke(c.io.pc, 4.U)
  poke(c.io.pcImm_NEXTPC_rs1Imm, 2.U)
  poke(c.io.rs1Data, 10.U)
  poke(c.io.offset, 5.U)
  step(1)
  expect(c.io.next_pc, 15.U)

  // 测试条件分支
  poke(c.io.pc, 4.U)
  poke(c.io.pcImm_NEXTPC_rs1Imm, 0.U)
  poke(c.io.condition_branch, true.B)
  poke(c.io.offset, 8.U)
  step(1)
  expect(c.io.next_pc, 12.U)
}

object NextPCTester extends App {
  Driver.execute(Array("--generate-vcd-output", "on"), () => new NextPC) {
    c => new NextPCTester(c)
  }
}
