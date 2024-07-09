import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class IMMTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new IMM).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    // dut.clock.step(1)
                    // dut.io.read_rs1_data.expect( 0.U)
                    // dut.io.read_rs2_data.expect( 0.U)
                    // 测试I型指令立即数
                    dut.io.instr.poke("h00000093".U) // 指令：addi x1, x0, 0
                    dut.io.extOP.poke("b000".U)
                    dut.clock.step(1)
                    dut.io.imm_32.expect("h00000000".U)

                    // 测试U型指令立即数
                    dut.io.instr.poke("h000000b7".U) // 指令：lui x1, 0
                    dut.io.extOP.poke("b001".U)
                    dut.clock.step(1)
                    dut.io.imm_32.expect("h00000000".U)

                  }
        }
    }
}
