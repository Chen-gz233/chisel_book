import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class PCTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new PC).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                // val in_a_tb = Random.nextInt(4)
                // val in_sel_tb = Random.nextInt(2)
                // println("in_a_tb = ",in_a_tb,"in_sel_tb = ",in_sel_tb)
                dut.io.rst.poke(true.B)
                dut.clock.step()
                dut.io.rst.poke(false.B)
                dut.io.next_pc.poke(0x100.U)
                dut.clock.step()
                print("pc output = ",dut.io.pc.peek().toString)
        }
    }


}
