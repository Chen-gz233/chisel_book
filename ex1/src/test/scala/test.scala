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
                dut.clock.step()
                println("Add Result is: " + dut.io.out_add.peek().toString)
                println("Sub Result is: " + dut.io.out_sub.peek().toString)
                println("Mul Result is: " + dut.io.out_mul.peek().toString)
                dut.io.out_add.expect(in_1_tb + in_2_tb)
                dut.io.out_sub.expect(in_1_tb - in_2_tb)
                dut.io.out_mul.expect(in_1_tb * in_2_tb)

        }
        println("success!")
    }
}
