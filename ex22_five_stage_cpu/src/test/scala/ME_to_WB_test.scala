import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec


class MeWbTest  extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new ME_to_WB).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
        dut =>
                // Test case 2: Normal operation
                dut.io.me_WB_aluOut_or_memOut.poke(true.B)
                dut.io.me_write_valid.poke(false.B)
                dut.io.me_MemOut.poke(100.U)
                dut.io.me_AluOut.poke(200.U)
                dut.io.me_rd_address.poke(5.U)
                dut.clock.step()
                dut.io.wb_aluOut_or_memOut.expect(true.B)
                dut.io.wb_write_valid.expect(false.B)
                dut.io.wb_MemOut.expect(100.U)
                dut.io.wb_AluOut.expect(200.U)
                dut.io.wb_rd_address.expect(5.U)
    }
  }
}
