import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class NextPCTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new NextPC).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {

                    // Test case 1: pcImm_NEXTPC_rs1Imm = 2'b01
                    dut.io.nextPC_pcImm_or_rs1Imm.poke(1.U)
                    dut.io.condition_branch.poke(false.B)
                    dut.io.pc.poke(0.U)
                    dut.io.pcImm.poke(100.U)
                    dut.io.rs1Imm.poke(200.U)
                    dut.clock.step(1)
                    dut.io.next_pc.expect(100.U)
                    dut.io.flush.expect(true.B)


                     // Test case 2: pcImm_NEXTPC_rs1Imm = 2'b10
                    dut.io.nextPC_pcImm_or_rs1Imm.poke(2.U)
                    dut.io.condition_branch.poke(false.B)
                    dut.io.pc.poke(0.U)
                    dut.io.pcImm.poke(100.U)
                    dut.io.rs1Imm.poke(200.U)
                    dut.clock.step()
                    dut.io.next_pc.expect(200.U)
                    dut.io.flush.expect(true.B)

                    // Test case 3: condition_branch = true
                    dut.io.nextPC_pcImm_or_rs1Imm.poke(0.U)
                    dut.io.condition_branch.poke(true.B)
                    dut.io.pc.poke(0.U)
                    dut.io.pcImm.poke(100.U)
                    dut.io.rs1Imm.poke(200.U)
                    dut.clock.step()
                    dut.io.next_pc.expect(100.U)
                    dut.io.flush.expect(true.B)

                    // Test case 4: pc4 = 116
                    dut.io.nextPC_pcImm_or_rs1Imm.poke(0.U)
                    dut.io.condition_branch.poke(false.B)
                    dut.io.pc.poke(116.U)
                    dut.io.pcImm.poke(100.U)
                    dut.io.rs1Imm.poke(200.U)
                    dut.clock.step()
                    dut.io.next_pc.expect(112.U)
                    dut.io.flush.expect(false.B)

                    // Test case 5: default case
                    dut.io.nextPC_pcImm_or_rs1Imm.poke(0.U)
                    dut.io.condition_branch.poke(false.B)
                    dut.io.pc.poke(50.U)
                    dut.io.pcImm.poke(100.U)
                    dut.io.rs1Imm.poke(200.U)
                    dut.clock.step()
                    dut.io.next_pc.expect(50.U)
                    dut.io.flush.expect(false.B)
                  }
        }
    }
}

