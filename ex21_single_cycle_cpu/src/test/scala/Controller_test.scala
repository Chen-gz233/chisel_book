import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class ControllerTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Controller).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            c=> {
                  // 测试R型指令
                  c.io.opcode.poke( "b0110011".U)
                  c.io.func3.poke( "b000".U)
                  c.io.func7.poke( "b0000000".U)
                  c.clock.step(1)
                  c.io.write_reg.expect( true.B)
                  c.io.rs2Data_EX_imm32_4.expect( "b00".U)
                  c.io.aluc.expect( "b00000".U)

                  // 测试I型指令
                  c.io.opcode.poke( "b0010011".U)
                  c.io.func3.poke("b000".U)
                  c.io.func7.poke( "b0000000".U)
                  c.clock.step(1)
                  c.io.write_reg.expect( true.B)
                  c.io.rs2Data_EX_imm32_4.expect( "b01".U)
                  c.io.aluc.expect("b00000".U)
                }
        }
    }
}
