import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec


class IfIdTest extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new IF_to_ID).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
        dut =>


      // Test case 2: Normal operation
      dut.io.pause.poke(false.B)
      dut.io.flush.poke(false.B)
      dut.io.if_pc.poke(100.U)
      dut.io.if_instruction.poke("h02010413".U)
      dut.clock.step()
      dut.io.id_pc.expect(100.U)
      dut.io.id_instruction.expect("h02010413".U)

      // Test case 3: Pause
      dut.io.pause.poke(true.B)
      dut.io.if_pc.poke(200.U)
      dut.io.if_instruction.poke("h00112e23".U)
      dut.clock.step()
      dut.io.id_pc.expect(100.U) // PC should not update
      dut.io.id_instruction.expect("h02010413".U) // Instruction should not update

      // Test case 4: Flush
      dut.io.pause.poke(false.B)
      dut.io.flush.poke(true.B)
      dut.clock.step()
      dut.io.id_pc.expect(0.U)
      dut.io.id_instruction.expect("h00000013".U) // NOP instruction
    }
  }
}
