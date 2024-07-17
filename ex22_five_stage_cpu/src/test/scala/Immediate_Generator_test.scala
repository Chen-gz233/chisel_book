import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Immediate_GeneratorTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Immediate_Generator).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    // Test case 1: I-type
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b000".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                    // Test case 2: U-type
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b001".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                    // Test case 3: S-type
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b010".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                    // Test case 4: B-type
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b011".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                    // Test case 5: J-type
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b100".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                    // Test case 6: Shift amount
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b101".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                    // Test case 7: Zero immediate
                    dut.io.instruction.poke("b00000000000000000000000000000000".U)
                    dut.io.immediate_code.poke("b111".U)
                    dut.clock.step()
                    dut.io.immediate_out.expect("h00000000".U)

                  }
        }
    }
}
