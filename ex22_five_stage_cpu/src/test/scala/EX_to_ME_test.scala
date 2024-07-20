import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec


class ExMeTest  extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new EX_to_ME).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
        dut =>


                // Test case 2: Normal operation
                dut.io.flush.poke(false.B)
                dut.io.ex_wb_aluOut_or_CacheOut.poke(true.B)
                dut.io.ex_write_valid.poke(false.B)
                dut.io.ex_write_code.poke(1.U)
                dut.io.ex_read_code.poke(2.U)
                dut.io.ex_nextPC_pc_or_rs1.poke(1.U)
                dut.io.ex_conditionBranch.poke(true.B)
                dut.io.ex_pcImm.poke(100.U)
                dut.io.ex_rs1Imm.poke(200.U)
                dut.io.ex_AluOut.poke(300.U)
                dut.io.ex_rs2Data.poke(400.U)
                dut.io.ex_rd_address.poke(5.U)
                dut.io.ex_rs2_address.poke(10.U)
                dut.clock.step()
                dut.io.me_WB_aluOut_or_memOut.expect(true.B)
                dut.io.me_write_valid.expect(false.B)
                dut.io.me_write_code.expect(1.U)
                dut.io.me_read_code.expect(2.U)
                dut.io.me_nextPC_pcImm_or_rs1Imm.expect(1.U)
                dut.io.me_conditionBranch.expect(true.B)
                dut.io.me_pcImm.expect(100.U)
                dut.io.me_rs1Imm.expect(200.U)
                dut.io.me_AluOut.expect(300.U)
                dut.io.me_rs2Data.expect(400.U)
                dut.io.me_rd_address.expect(5.U)
                dut.io.me_rs2_address.expect(10.U)

                // Test case 3: Flush
                dut.io.flush.poke(true.B)
                dut.clock.step()
                dut.io.me_WB_aluOut_or_memOut.expect(false.B)
                dut.io.me_write_valid.expect(true.B)
                dut.io.me_write_code.expect(0.U)
                dut.io.me_read_code.expect(0.U)
                dut.io.me_nextPC_pcImm_or_rs1Imm.expect(0.U)
                dut.io.me_conditionBranch.expect(false.B)
                dut.io.me_pcImm.expect(0.U)
                dut.io.me_rs1Imm.expect(0.U)
                dut.io.me_AluOut.expect(0.U)
                dut.io.me_rs2Data.expect(0.U)
                dut.io.me_rd_address.expect(0.U)
                dut.io.me_rs2_address.expect(0.U)
    }
  }
}
