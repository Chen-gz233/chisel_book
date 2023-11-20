import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class MymoduleTest extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in{
        test(new Mymodule).withAnnotations(Seq(WriteVcdAnnotation)){
            dut =>
                val in_1_tb = Random.nextInt(4)
                val in_2_tb = Random.nextInt(4)
                println("in_1 Result is: " + in_1_tb.toString)
                println("in_2 Result is: " + in_2_tb.toString)
                dut.clock.step()
                dut.io.in_1.poke(in_1_tb)
                dut.io.in_2.poke(in_2_tb)
                dut.io.sel.poke(true)
                dut.clock.step()
                println("mux Result is: " + dut.io.out_mux.peek().toString)
                println("cat Result is: " + dut.io.out_cat.peek().toString)

        }
    }
}
