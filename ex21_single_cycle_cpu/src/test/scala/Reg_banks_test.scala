import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class RegBanksTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Reg_Banks).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    
                    dut.io.read_rs1_data.expect( 0.U)
                    dut.io.read_rs2_data.expect( 0.U)
                    dut.clock.step(1)
                    // 测试写寄存器

                    dut.io.write_valid.poke(true.B)
                    dut.io.rd_address.poke( 1.U)
                    dut.io.write_rd_data.poke( 42.U)
                    dut.clock.step(1)
                    dut.io.rs1_address.poke( 1.U)
                    dut.io.rs2_address.poke(1.U)
                    dut.io.read_rs1_data.expect(42.U)
                    dut.io.read_rs2_data.expect(42.U)
                    dut.clock.step(1)
                  }
        }
    }
}

