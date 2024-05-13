import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class FSM_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new FSM).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                //val in_a_tb = Random.nextInt(40)
                    dut.clock.step(40)
                }
                println("succeed!\n")
                
        }
    }

