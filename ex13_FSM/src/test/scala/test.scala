import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class FSM_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new FSM).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                //val in_a_tb = Random.nextInt(40)
                val in_tb = Seq(1.U,0.U,1.U,1.U,1.U,1.U,1.U,1.U,1.U,0.U,0.U,0.U,0.U,0.U,0.U,0.U,0.U)
                for(i <- 0 until 17){
                println("in_tb = ",in_tb(i))
                dut.io.in.poke(in_tb(i))
                dut.clock.step()
                print("FSM output = ",dut.io.out.peek().toString)
                }
                
        }
    }


}
