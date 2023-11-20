import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Cnt_Sub_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Cnt_Sub).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>
                for (i <- 0 until 10){
                    dut.io.in_en.poke(0.U)
                    dut.clock.step()
                    println("Cnt_Sub out_en = ",dut.io.out_en.peek().toString)
                    println("Cnt_Sub out_cnt = ",dut.io.out_cnt.peek().toString)
                    println("")

                }
                for (i <- 0 until 10){
                    dut.io.in_en.poke(1.U)
                    dut.clock.step()
                    println("Cnt_Sub out_en = ",dut.io.out_en.peek().toString)
                    println("Cnt_Sub out_cnt = ",dut.io.out_cnt.peek().toString)
                    println("")
                }
                /*def 
                            val io = IO(new Bundle{
                            val in_en = Input(UInt(1.W))
                            val out_en = Output(UInt(1.W))
                            val out_cnt = Output(UInt(8.W))
                */
                
        }
    }


}
