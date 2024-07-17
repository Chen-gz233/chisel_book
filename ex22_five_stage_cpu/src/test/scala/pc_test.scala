import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class PCTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new PC).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>

                // Test case 1: Reset
                // dut.clock.step(2)
                // dut.io.pc.expect(52.U)
                // print("pc output = ",dut.io.pc.peek().toString)

                // Test case 2: Normal operation
                dut.io.pause.poke(false.B)
                dut.io.next_pc.poke(100.U)
                dut.clock.step()
                dut.io.pc.expect(100.U)

                // Test case 3: Pause
                dut.io.pause.poke(true.B)
                dut.io.next_pc.poke(200.U)
                dut.clock.step()
                dut.io.pc.expect(100.U)  // PC should not update

                // Test case 4: Resume
                dut.io.pause.poke(false.B)
                dut.clock.step()
                dut.io.pc.expect(200.U)  // PC should update
        }
    }


}
