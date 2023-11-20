import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
    val in_a = Input(UInt(n.W))
    val out_not_a = Output(UInt(n.W))
})
*/
class NOT_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        
        test (new NOT(8)).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.in_a.poke(8.U)
                        println("in_a = ",dut.io.in_a.peek().toString)
                        dut.clock.step()
                        println(" out_not_a = ",dut.io.out_not_a.peek().toString)
                        println("")

                        dut.io.in_a.poke(4.U)
                        println("in_a = ",dut.io.in_a.peek().toString)
                        dut.clock.step()
                        println(" out_not_a = ",dut.io.out_not_a.peek().toString)
                        println("")

                        dut.io.in_a.poke(0.U)
                        println("in_a = ",dut.io.in_a.peek().toString)
                        dut.clock.step()
                        println(" out_not_a = ",dut.io.out_not_a.peek().toString)
                        println("")
    }
    
}}