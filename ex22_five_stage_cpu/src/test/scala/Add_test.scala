import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class AddTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Add).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                // Test case 1
                dut.io.pc_in.poke(0.U)
                dut.clock.step()
                dut.io.pc_out.expect(4.U)

                // Test case 2
                dut.io.pc_in.poke(4.U)
                dut.clock.step()
                dut.io.pc_out.expect(8.U)

                // Test case 3
                dut.io.pc_in.poke(100.U)
                dut.clock.step()
                dut.io.pc_out.expect(104.U)

                // Test case 4
                // 使用 BigInt 来表示超过 UInt(32.W) 范围的数值。
                // val maxUInt32 = (BigInt(1) << 32) - 4 计算了 2^32 - 4。
                // 使用 .U 方法将 BigInt 转换为 UInt，确保在 poke 和 expect 中使用。
               val maxUInt32 = (BigInt(1) << 32) - 4 // 2^32 - 4
                dut.io.pc_in.poke(maxUInt32.U)
                dut.clock.step()
                dut.io.pc_out.expect(0.U)  // Wrap around (modulo 2^32)
              }
        }
    }
}


