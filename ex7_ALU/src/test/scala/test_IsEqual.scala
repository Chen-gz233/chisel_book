import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val out_equal = Output(UInt(1.W))
})
*/
class IsEqual_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        
        test (new IsEqual(8)).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.in_a.poke(-5.S)
                        dut.io.in_b.poke(5.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_equal = ",dut.io.out_equal.peek().toString)
                        println("")

                        dut.io.in_a.poke(-3.S)
                        dut.io.in_b.poke(3.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_equal = ",dut.io.out_equal.peek().toString)
                        println("")

                        dut.io.in_a.poke(0.S)
                        dut.io.in_b.poke(0.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_equal = ",dut.io.out_equal.peek().toString)
                        println("")
                        dut.io.in_a.poke(9.S)
                        dut.io.in_b.poke(9.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_equal = ",dut.io.out_equal.peek().toString)
                        println("")
    }
    
}}