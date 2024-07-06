import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class My4ElementFir_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new My4ElementFir(1,2,3,4)).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                val in_a_1tb = 1.U
                val in_a_2tb = 0.U

                for (i <- 0 until 10){

                    if(i%2 ==0){
                        dut.io.in_a.poke(in_a_1tb)
                        dut.io.in_en.poke(1.U)
                        println("in_a_tb = ", dut.io.in_a.peek().toString,"in_en_tb = ",dut.io.in_en.peek().toString)
                        
                        dut.clock.step()
                        println("Register output = ",dut.io.out.peek().toString)
                        println("")
                    }
                    if(i%2 ==1){
                        dut.io.in_a.poke(in_a_2tb)
                        dut.io.in_en.poke(1.U)
                        println("in_a_tb = ", dut.io.in_a.peek().toString,"in_en_tb = ",dut.io.in_en.peek().toString)
                        
                        dut.clock.step()
                        println("Register output = ",dut.io.out.peek().toString)
                        println("")

                    }
                    
                }
                
        }
    }


}
