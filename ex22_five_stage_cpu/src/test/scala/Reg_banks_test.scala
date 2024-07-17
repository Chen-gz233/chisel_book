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

                    // dut.io.write_valid.poke(true.B)
                    // dut.io.rd_address.poke( 1.U)
                    // dut.io.write_rd_data.poke( 42.U)
                    // dut.clock.step(1)
                    // dut.io.rs1_address.poke( 1.U)
                    // dut.io.rs2_address.poke(1.U)
                    // dut.io.read_rs1_data.expect(42.U)
                    // dut.io.read_rs2_data.expect(42.U)
                    // dut.clock.step(1)

                    // Test case 2: Write to register 1
                    dut.io.write_valid.poke(true.B)
                    dut.io.rd_address.poke(1.U)
                    dut.io.write_rd_data.poke(42.U)
                    dut.clock.step()

                    // Test case 3: Read from register 1
                    dut.io.rs1_address.poke(1.U)
                    dut.clock.step()
                    dut.io.read_rs1_data.expect(42.U)

                    // Test case 4: Read from zero register
                    dut.io.rs1_address.poke(0.U)
                    dut.clock.step()
                    dut.io.read_rs1_data.expect(0.U)

                    // Test case 5: Write to register 2 and read with data hazard
                    dut.io.write_valid.poke(true.B)
                    dut.io.rd_address.poke(2.U)
                    dut.io.write_rd_data.poke(84.U)
                    dut.clock.step()
                    dut.io.rs1_address.poke(2.U)
                    dut.clock.step()
                    dut.io.read_rs1_data.expect(84.U)                    
                  }
        }
    }
}

