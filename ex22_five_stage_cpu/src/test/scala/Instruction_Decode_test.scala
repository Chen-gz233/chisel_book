import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class InstructionDecodeTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Instruction_Decode).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                // 测试指令解码
                //1111111_00000_00010_000_00010_0010011
                dut.io.instruction.poke("hfe010113".U)
                dut.clock.step()
                dut.io.opcode.expect("b0010011".U)
                println("expect(c.io.opcode, h13.U), = ",dut.io.opcode.peek().toString)
                dut.io.rd_address.expect("b00010".U)
                println("expect(c.io.rd, h02.U) = ",dut.io.rd_address.peek().toString)
                dut.io.func3.expect("h0".U)
                println("expect(c.io.func3, h0.U) = ",dut.io.func3.peek().toString)
                dut.io.rs1_address.expect("h02".U)
                println("expect(c.io.rs1, h02.U) = ",dut.io.rs1_address.peek().toString)
                dut.io.rs2_address.expect("h00".U)
                println("expect(c.io.rs2, h00.U) = ",dut.io.rs2_address.peek().toString)
                dut.io.func7.expect("b1111111".U)
                println("expect(c.io.func7, h7f.U) = ",dut.io.func7.peek().toString)

                // //0000000_01000_00010_010_11100_0100011
                // "h00812e23".U(32.W),      // sw(store word) s0, 28(sp)   
                dut.clock.step()
                dut.io.instruction.poke("h00812e23".U)
                dut.clock.step()
                dut.io.opcode.expect("b0100011".U)
                dut.io.rd_address.expect("b11100".U)
                dut.io.func3.expect("b010".U)
                dut.io.rs1_address.expect("b00010".U)
                dut.io.rs2_address.expect("b01000".U)
                dut.io.func7.expect("b0000000".U)


              }
        }
    }
}

