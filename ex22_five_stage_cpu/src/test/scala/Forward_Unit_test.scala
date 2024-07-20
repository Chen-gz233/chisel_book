import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec


class ForwardUnitTest  extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new ForwardUnit).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
        dut =>
                // Test case 1: No forwarding
                dut.io.me_write_valid.poke(false.B)
                dut.io.wb_write_valid.poke(false.B)
                dut.io.me_rd_address.poke(0.U)
                dut.io.wb_rd_address.poke(0.U)
                dut.io.ex_rs1_address.poke(1.U)
                dut.io.ex_rs2_address.poke(2.U)
                dut.io.me_rs2_address.poke(3.U)
                dut.clock.step()
                dut.io.ex_forwardA.expect(0.U)
                dut.io.ex_forwardB.expect(0.U)
                dut.io.me_forwardC.expect(false.B)

                // Test case 2: Forward from WB to EX for rs1
                dut.io.wb_write_valid.poke(true.B)
                dut.io.wb_rd_address.poke(1.U)
                dut.io.ex_rs1_address.poke(1.U)
                dut.clock.step()
                dut.io.ex_forwardA.expect(2.U)

                // Test case 3: Forward from WB to EX for rs2
                dut.io.wb_rd_address.poke(2.U)
                dut.io.ex_rs2_address.poke(2.U)
                dut.clock.step()
                dut.io.ex_forwardB.expect(2.U)

                // Test case 4: Forward from MEM to EX for rs1
                dut.io.wb_write_valid.poke(false.B)
                dut.io.me_write_valid.poke(true.B)
                dut.io.me_rd_address.poke(1.U)
                dut.io.ex_rs1_address.poke(1.U)
                dut.clock.step()
                dut.io.ex_forwardA.expect(1.U)

                // Test case 5: Forward from MEM to EX for rs2
                dut.io.me_rd_address.poke(2.U)
                dut.io.ex_rs2_address.poke(2.U)
                dut.clock.step()
                dut.io.ex_forwardB.expect(1.U)

                // Test case 6: Forward from WB to MEM for rs2
                dut.io.wb_write_valid.poke(true.B)
                dut.io.wb_rd_address.poke(3.U)
                dut.io.me_rs2_address.poke(3.U)
                dut.clock.step()
                dut.io.me_forwardC.expect(true.B)
          }
  }
}
