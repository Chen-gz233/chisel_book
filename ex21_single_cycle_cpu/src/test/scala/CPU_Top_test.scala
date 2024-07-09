import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class CPUTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new CPU).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            c=> {
                  c.clock.step(60)

                }
        }
    }
}