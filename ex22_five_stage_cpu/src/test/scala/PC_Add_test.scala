import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class PCAddTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new PC_Add).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    // Test case 1
                    dut.io.pc.poke(0.U)
                    dut.io.imm32.poke(0.U)
                    dut.io.rs1Data.poke(0.U)
                    dut.clock.step()
                    dut.io.pcImm.expect(0.U)
                    dut.io.rs1Imm.expect(0.U)

                    // Test case 2
                    dut.io.pc.poke(1.U)
                    dut.io.imm32.poke(2.U)
                    dut.io.rs1Data.poke(3.U)
                    dut.clock.step()
                    dut.io.pcImm.expect(3.U)
                    dut.io.rs1Imm.expect(5.U)


              }
        }
    }
}


