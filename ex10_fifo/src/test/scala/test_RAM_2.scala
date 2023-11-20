import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class RAM_2_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new RAM_2(8)).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            /* 
                val in_read_addr = Input(UInt(n.W))
                val in_read_en = Input(Bool()) 

                val in_write_addr = Input(UInt(n.W))
                val in_write_data = Input(UInt(n.W))
                val in_write_en = Input(Bool()) 
                

                val out_read_data = Output(UInt(n.W))
                val out_en = Output(Bool())
            */
            
            dut=>
                //写
                for(i <- 0 until 25){
                    
                    val in_write_addr = i.U
                    val in_write_data = Random.nextInt(8)
                    println("in_write_addr = ",in_write_addr,"in_write_data = ",in_write_data)
                    dut.io.in_write_addr.poke(in_write_addr)
                    dut.io.in_write_data.poke(in_write_data)
                    dut.io.in_write_en.poke(true.B)
                    dut.clock.step()
                    println("RAM_1 out_en = "+dut.io.out_en.peek().toString,"RAM_1 out_read_data = "+dut.io.out_read_data.peek().toString)
                    println("")
                    if(i===0){
                        dut.clock.step(2)
                    }
                    
                    //读
                    val in_read_addr = i.U
                    //val in_write_data = Random.nextInt(8)
                    println("in_read_addr = ",in_read_addr,"in_write_data = ",in_write_data)
                    dut.io.in_read_addr.poke(in_read_addr)
                    dut.io.in_write_data.poke(in_write_data)
                    dut.io.in_read_en.poke(true.B)
                    dut.clock.step()
                    println("RAM_1 out_en = "+dut.io.out_en.peek().toString,"RAM_1 out_read_data = "+dut.io.out_read_data.peek().toString)
                    println("")
                }
                
                
        }
    }


}
