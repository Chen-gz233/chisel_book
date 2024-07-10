import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Data_CacheTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Data_Cache).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            c=> {

                    // 测试写入32位数据
                    c.io.write_code.poke( "b01".U)
                    c.io.address.poke( 0.U)
                    c.io.write_data.poke("hDEADBEEF".U)
                    c.clock.step(1)
                    
                    // 测试读取32位数据
                    c.io.read_code.poke( "b001".U)
                    c.io.address.poke(0.U)
                    c.io.out_data.expect( "hDEADBEEF".U)
                    
                    // 测试写入16位数据
                    c.io.write_code.poke( "b10".U)
                    c.io.address.poke( 4.U)
                    c.io.write_data.poke("hBEEF".U)
                     c.clock.step(1)
                    
                    // 测试读取16位数据
                    c.io.read_code.poke( "b010".U)
                    c.io.address.poke( 4.U)
                    c.io.out_data.expect( "h0000BEEF".U)
                    

                  }
        }
    }
}

