import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class PCAdd4Tester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new PC_Add4).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    // Test case 1
                    dut.io.pc_in.poke(0.U)
                    dut.clock.step()
                    dut.io.pc_out.expect(4.U)

                    // Test case 2
                    dut.io.pc_in.poke(4.U)
                    dut.clock.step()
                    dut.io.pc_out.expect(8.U)

                    // Test case 3
                    dut.io.pc_in.poke(100.U)
                    dut.clock.step()
                    dut.io.pc_out.expect(104.U)

                    // Test case 4
                    // dut.io.pc_in.poke(4294967292.U)  // 2^32 - 4
                    // dut.clock.step()
                    // dut.io.pc_out.expect(0.U)  // Wrap around (modulo 2^32)
              }
        }
    }
}


