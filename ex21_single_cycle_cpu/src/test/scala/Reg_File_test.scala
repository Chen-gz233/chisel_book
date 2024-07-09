import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class RegFileTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new RegFile).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    
                    dut.io.read_rs1_data.expect( 0.U)
                    dut.io.read_rs2_data.expect( 0.U)
                    dut.clock.step(1)
                    // 测试写寄存器

                    dut.io.write_reg.poke(true.B)
                    dut.io.target_reg.poke( 1.U)
                    dut.io.write_rd_data.poke( 42.U)
                    dut.clock.step(1)
                    dut.io.rs1.poke( 1.U)
                    dut.io.rs2.poke(1.U)
                    dut.io.read_rs1_data.expect(42.U)
                    dut.io.read_rs2_data.expect(42.U)
                    dut.clock.step(1)
                  }
        }
    }
}

