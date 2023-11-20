import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class MyMACTest extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test(new MAC).withAnnotations(Seq(WriteVcdAnnotation)){
            dut =>
                val in_a_tb = Random.nextInt(4)
                val in_b_tb = Random.nextInt(4)
                val in_c_tb = Random.nextInt(4)
                println("in_a = "+in_a_tb,"in_b = "+in_b_tb,"in_c = "+in_c_tb)
                dut.io.in_a.poke(in_a_tb)
                dut.io.in_b.poke(in_b_tb) 
                dut.io.in_c.poke(in_c_tb) 
                dut.clock.step()
                println("MAC result = ",dut.io.out.peek().toString)
        }
    }
}