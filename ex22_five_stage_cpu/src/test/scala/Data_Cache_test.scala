import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Data_CacheTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Data_Cache).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {

                    // 测试写入32位数据
                    dut.io.write_code.poke( "b01".U)
                    dut.io.address.poke( 0.U)
                    dut.io.write_data.poke("hDEADBEEF".U)
                    dut.clock.step(1)
                    
                    // 测试读取32位数据
                    dut.io.read_code.poke( "b001".U)
                    dut.io.address.poke(0.U)
                    dut.io.out_data.expect( "hDEADBEEF".U)
                    
                    // 测试写入16位数据
                    dut.io.write_code.poke( "b10".U)
                    dut.io.address.poke( 4.U)
                    dut.io.write_data.poke("hBEEF".U)
                    dut.clock.step(1)
                    
                    // 测试读取16位数据
                    dut.io.read_code.poke( "b010".U)
                    dut.io.address.poke( 4.U)
                    dut.io.out_data.expect( "h0000BEEF".U)

                     // Test case 3: Write and read byte
                    dut.io.write_code.poke(3.U)
                    dut.io.address.poke(8.U)
                    dut.io.write_data.poke("hEF".U)
                    dut.clock.step()
                    dut.io.write_code.poke(0.U)
                    dut.io.read_code.poke(3.U)
                    dut.io.address.poke(8.U)
                    dut.clock.step()
                    dut.io.out_data.expect("h000000EF".U)

                    // Test case 4: Read signed half-word
                    dut.io.read_code.poke("b110".U)
                    dut.io.address.poke(4.U)
                    dut.clock.step()
                    dut.io.out_data.expect("hFFFFBEEF".U)

                    // Test case 5: Read signed byte
                    dut.io.read_code.poke("b111".U)
                    dut.io.address.poke(8.U)
                    dut.clock.step()
                    dut.io.out_data.expect("hFFFFFFEF".U)

                    

                  }
        }
    }
}

