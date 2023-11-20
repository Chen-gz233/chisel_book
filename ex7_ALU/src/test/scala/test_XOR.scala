import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
    val in_a = Input(UInt(n.W))
    val in_b = Input(UInt(n.W))
    val out_xor = Output(UInt(n.W))
})
*/
class XOR_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        
        test (new XOR(8)).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.in_a.poke(8.U)
                        dut.io.in_b.poke(5.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_xor = ",dut.io.out_xor.peek().toString)
                        println("")

                        dut.io.in_a.poke(3.U)
                        dut.io.in_b.poke(2.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_xor = ",dut.io.out_xor.peek().toString)
                        println("")

                        dut.io.in_a.poke(7.U)
                        dut.io.in_b.poke(9.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString)
                        dut.clock.step()
                        println(" out_xor = ",dut.io.out_xor.peek().toString)
                        println("")
    }
    
}}