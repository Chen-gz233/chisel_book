import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class ControllerTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Controller).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                //   io.alu_ctr := 0.U
                //     io.wb_aluOut_or_CacheOut := false.B
                //     io.alu1_rs1Data_or_PC := false.B
                //     io.alu2_rs2Data_or_imm32_or_4 := 0.U
                //     io.write_valid := false.B
                //     io.write_code := 0.U
                //     io.read_code := 0.U
                //     io.immediate_code := 0.U
                //     io.nextPC_pc_or_rs1 := 0.U
            // Test case 1: lui
                dut.io.opcode.poke("b0110111".U)
                dut.io.func3.poke(0.U)
                dut.io.func7.poke(0.U)
                dut.clock.step()
                dut.io.write_valid.expect(true.B)
                dut.io.wb_aluOut_or_CacheOut.expect(false.B)
                dut.io.alu1_rs1Data_or_PC.expect(false.B)
                dut.io.alu2_rs2Data_or_imm32_or_4.expect(1.U)
                dut.io.write_code.expect(0.U)
                dut.io.read_code.expect(0.U)
                dut.io.alu_ctr.expect("b00000".U)
                dut.io.nextPC_pc_or_rs1.expect(0.U)
                dut.io.immediate_code.expect(1.U)

                // Test case 2: addi
                dut.io.opcode.poke("b0010011".U)
                dut.io.func3.poke("b000".U)
                dut.io.func7.poke(0.U)
                dut.clock.step()
                dut.io.write_valid.expect(true.B)
                dut.io.wb_aluOut_or_CacheOut.expect(false.B)
                dut.io.alu1_rs1Data_or_PC.expect(false.B)
                dut.io.alu2_rs2Data_or_imm32_or_4.expect(1.U)
                dut.io.write_code.expect(0.U)
                dut.io.read_code.expect(0.U)
                dut.io.alu_ctr.expect("b00000".U)
                dut.io.nextPC_pc_or_rs1.expect(0.U)
                dut.io.immediate_code.expect(0.U)

                // Test case 3: beq
                dut.io.opcode.poke("b1100011".U)
                dut.io.func3.poke("b000".U)
                dut.io.func7.poke(0.U)
                dut.clock.step()
                dut.io.write_valid.expect(false.B)
                dut.io.wb_aluOut_or_CacheOut.expect(false.B)
                dut.io.alu1_rs1Data_or_PC.expect(false.B)
                dut.io.alu2_rs2Data_or_imm32_or_4.expect(0.U)
                dut.io.write_code.expect(0.U)
                dut.io.read_code.expect(0.U)
                dut.io.alu_ctr.expect("b01011".U)
                dut.io.nextPC_pc_or_rs1.expect(0.U)
                dut.io.immediate_code.expect(3.U)
                }
        }
    }
}
