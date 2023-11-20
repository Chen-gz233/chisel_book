import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class RAM_1_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new RAM_1).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            /*def 
                val in_addr = Input(UInt(8.W))
                val in_data = Input(UInt(8.W))
                val in_en = Input(Bool()) 

                val out_data = Output(UInt(8.W))
                val out_en = Output(Bool())
            */
            
            dut=>
                //写
                for(i <- 0 until 25){
                    //val in_addr = Random.nextInt(8)
                    val in_addr = i.U
                    val in_data = Random.nextInt(8)
                    println("in_addr = ",in_addr,"in_data = ",in_data)
                    dut.io.in_addr.poke(in_addr)
                    dut.io.in_data.poke(in_data)
                    dut.io.in_en.poke(true.B)
                    dut.clock.step()
                    println("RAM_1 out_en = "+dut.io.out_en.peek().toString,"RAM_1 out_data = "+dut.io.out_data.peek().toString)
                    println("")
                }
                    //读
                for(i <- 0 until 25){
                    //val in_addr = Random.nextInt(8)
                    val in_addr = i.U
                    val in_data = Random.nextInt(8)
                    println("in_addr = ",in_addr,"in_data = ",in_data)
                    dut.io.in_addr.poke(in_addr)
                    dut.io.in_data.poke(in_data)
                    dut.io.in_en.poke(false.B)
                    dut.clock.step()
                    println("RAM_1 out_en = "+dut.io.out_en.peek().toString,"RAM_1 out_data = "+dut.io.out_data.peek().toString)
                    println("")
                }
                
                
        }
    }


}
