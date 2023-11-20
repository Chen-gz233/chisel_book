import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val out_comp = Output(UInt(1.W))
})
*/
class COMP_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        
        test (new COMP(8)).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.in_a.poke(8.S)
                        dut.io.in_b.poke(5.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_comp = ",dut.io.out_comp.peek().toString)
                        println("")

                        dut.io.in_a.poke(-3.S)
                        dut.io.in_b.poke(2.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_comp = ",dut.io.out_comp.peek().toString)
                        println("")

                        dut.io.in_a.poke(9.S)
                        dut.io.in_b.poke(7.S)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_comp = ",dut.io.out_comp.peek().toString)
                        println("")
    }
    
}}