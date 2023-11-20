import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class Full_AdderTest extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Full_Adder).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>
            for (i <-0 until 2){
                for (j <- 0 until 2){
                    for (k <- 0 until 2){
                        dut.io.in_a.poke(i)
                        dut.io.in_b.poke(j)
                        dut.io.in_c.poke(k)
                        dut.clock.step()
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_c = ",dut.io.in_c.peek().toString)
                        println("out_s = ",dut.io.out_s.peek().toString,"out_c = ",dut.io.out_c.peek().toString)
                        println("")
                    }
                }
            }

    }

}}