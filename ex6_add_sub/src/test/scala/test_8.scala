import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class Adder_8_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Adder_8).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.in_a.poke(8.U)
                        dut.io.in_b.poke(9.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println("out = ",dut.io.out.peek().toString)
                        println("")


    }

}}