import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class NextPCTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new NextPC).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    // 测试顺序执行
                    dut.io.pc.poke( 4.U)
                    dut.io.nextPC_pc_or_rs1.poke( 0.U)
                    dut.io.condition_branch.poke( false.B)
                    dut.clock.step(1)
                    dut.io.next_pc.expect( 8.U)

                    // 测试使用 pc + offset 计算下一条指令地址
                    dut.io.pc.poke( 4.U)
                    dut.io.nextPC_pc_or_rs1.poke( 1.U)
                    dut.io.offset.poke( 8.U)
                    dut.clock.step(1)
                    dut.io.next_pc.expect( 12.U)

                    // 测试使用 rs1Data + offset 计算下一条指令地址
                    dut.io.pc.poke( 4.U)
                    dut.io.nextPC_pc_or_rs1.poke( 2.U)
                    dut.io.rs1Data.poke( 10.U)
                    dut.io.offset.poke( 5.U)
                    dut.clock.step(1)
                    dut.io.next_pc.expect( 15.U)

                    // 测试条件分支
                    dut.io.pc.poke( 4.U)
                    dut.io.nextPC_pc_or_rs1.poke( 0.U)
                    dut.io.condition_branch.poke( true.B)
                    dut.io.offset.poke( 8.U)
                    dut.clock.step(1)
                    dut.io.next_pc.expect( 12.U)
                  }
        }
    }
}

