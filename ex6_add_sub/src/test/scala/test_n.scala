import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
        val A = Input(UInt(n.W))
        val B = Input(UInt(n.W))
        val Cin = Input(UInt(1.W))
        val Sum = Output(UInt(n.W))
        val Cout = Output(UInt(1.W))
*/
class Adder_N_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Adder_N(8)).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.A.poke(8.U)
                        dut.io.B.poke(9.U)
                        dut.io.Cin.poke(0.U)
                        println("in_a = ",dut.io.A.peek().toString,"in_b = ",dut.io.B.peek().toString,"Cin =",dut.io.Cin.peek().toString)
                        dut.clock.step()
                        println(" Sum = ",dut.io.Sum.peek().toString)
                        println(" Cout = ",dut.io.Cout.peek().toString)
                        println("")


    }

}}