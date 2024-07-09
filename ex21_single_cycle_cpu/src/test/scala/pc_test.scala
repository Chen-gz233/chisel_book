import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class PCTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new PC).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>

                dut.io.next_pc.poke(0x100.U)
                dut.clock.step()
                dut.io.pc.expect(0x100.U)
                print("pc output = ",dut.io.pc.peek().toString)
        }
    }


}
