import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec


class HazardDetectionUnitTest  extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Hazard_Detection_Unit).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
        dut =>

                // Test case 1: No hazard
                    dut.io.EX_ReadCache.poke(0.U)
                    dut.io.EX_rd_address.poke(1.U)
                    dut.io.EX_rs1_address.poke(2.U)
                    dut.io.EX_rs2_address.poke(3.U)
                    dut.clock.step()
                    dut.io.pause.expect(false.B)

                    // Test case 2: Hazard with id_rs1
                    dut.io.EX_ReadCache.poke(1.U)
                    dut.io.EX_rd_address.poke(2.U)
                    dut.io.EX_rs1_address.poke(2.U)
                    dut.io.EX_rs2_address.poke(3.U)
                    dut.clock.step()
                    dut.io.pause.expect(true.B)

                    // Test case 3: Hazard with id_rs2
                    dut.io.EX_ReadCache.poke(1.U)
                    dut.io.EX_rd_address.poke(3.U)
                    dut.io.EX_rs1_address.poke(2.U)
                    dut.io.EX_rs2_address.poke(3.U)
                    dut.clock.step()
                    dut.io.pause.expect(true.B)

                    // Test case 4: No hazard with different registers
                    dut.io.EX_ReadCache.poke(1.U)
                    dut.io.EX_rd_address.poke(4.U)
                    dut.io.EX_rs1_address.poke(2.U)
                    dut.io.EX_rs2_address.poke(3.U)
                    dut.clock.step()
                    dut.io.pause.expect(false.B)
          }
  }
}
