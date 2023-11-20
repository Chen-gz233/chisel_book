import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Register_2_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Register_2).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                
                dut.io.in_a.poke(1.U)
                dut.io.in_en.poke(false.B)
                dut.io.in_clr.poke(true.B)
                //println("in_a_tb = ", dut.io.in_a.peek().toString,"in_en_tb = ",dut.io.in_en.peek().toString)
                
                for (i <- 0 until 10){
                    
                    dut.clock.step()
                    println("in_a_tb = ", dut.io.in_a.peek().toString,"in_en_tb = ",dut.io.in_en.peek().toString)
                    println("cycle  = "+i,"Register output = "+dut.io.out.peek().toString)
                    if(i ===2){
                        dut.io.in_clr.poke(false.B)
                    }
                    if(i ===4){
                        dut.io.in_en.poke(true.B)
                    }
                }
                
        }
    }


}
