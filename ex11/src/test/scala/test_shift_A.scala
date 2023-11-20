import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class shiftReg_A_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new shiftReg_A(8,4)).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                //val in1_tb = Random.nextInt(8)
                //val in2_tb = Random.nextInt(8)
                val in1_tb = 127.U
                val in2_tb = 63.U
                //val in_tb = 1.U
                println("in1_tb = ",in1_tb,"in2_tb = ",in2_tb)
                dut.io.in_d.poke(in1_tb)
                dut.clock.step(5)
                //dut.io.in_d.poke(0.U)
                //dut.clock.step()
                dut.io.in_d.poke(in2_tb)
                dut.clock.step(5)
                dut.io.in_d.poke(0.U)
                for (i <- 0 until 5){
                    dut.clock.step()
                    println("shiftReg_L output = ",dut.io.out_d.peek().toString)
                }
        }
    }


}
