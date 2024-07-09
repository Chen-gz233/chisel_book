import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class IDTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new ID).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                // 测试指令解码
                dut.io.instr.poke("hfe010113".U)
                dut.clock.step()
                dut.io.opcode.expect("h13".U)
                println("expect(c.io.opcode, h13.U), = ",dut.io.opcode.peek().toString)
                dut.io.rd.expect("h02".U)
                println("expect(c.io.rd, h02.U) = ",dut.io.rd.peek().toString)
                dut.io.func3.expect("h0".U)
                println("expect(c.io.func3, h0.U) = ",dut.io.func3.peek().toString)
                dut.io.rs1.expect("h02".U)
                println("expect(c.io.rs1, h02.U) = ",dut.io.rs1.peek().toString)
                dut.io.rs2.expect("h00".U)
                println("expect(c.io.rs2, h00.U) = ",dut.io.rs2.peek().toString)
                dut.io.func7.expect("h7f".U)
                println("expect(c.io.func7, h7f.U) = ",dut.io.func7.peek().toString)


              }
        }
    }
}

