import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Reg_1_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Reg_1).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                for(i <- 0 until 10){
                    val in_a_tb = Random.nextInt(12)
                    println("in_a_tb = ",in_a_tb)
                    dut.io.in.poke(in_a_tb)

                    dut.clock.step()
                    println("Reg_1 output = ",dut.io.out.peek().toString)
                    println("")

                }
                
        }
    }


}
