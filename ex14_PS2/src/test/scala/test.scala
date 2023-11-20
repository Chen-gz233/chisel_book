import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class mux4_1_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new mux4_1).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                val in_a_tb = Random.nextInt(4)
                val in_sel_tb = Random.nextInt(2)
                println("in_a_tb = ",in_a_tb,"in_sel_tb = ",in_sel_tb)
                dut.io.in_a.poke(in_a_tb)
                dut.io.in_sel.poke(in_sel_tb)
                dut.clock.step()
                print("mux4_2 output = ",dut.io.out.peek().toString)
        }
    }


}
