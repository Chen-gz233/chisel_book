import chisel3._
import chiseltest._
import  org.scalatest.flatspec.AnyFlatSpec

class FuncModuleTest extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test(new FuncModule).withAnnotations(Seq(WriteVcdAnnotation)){
            dut =>
                val in_a_tb = 15.U
                val in_b_tb = 15.U
                println("in_a_tb = ",in_a_tb,"in_b_tb = ",in_b_tb)
                dut.io.a.poke(in_a_tb)
                dut.io.b.poke(in_b_tb)
                dut.clock.step()
                print("adder result = ",dut.io.out.peek().toString)

        }
        

    }
}