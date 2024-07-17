import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Mux3Tester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Mux3).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                    // dut.clock.step(1)
                    // dut.io.read_rs1_data.expect( 0.U)
                    // dut.io.read_rs2_data.expect( 0.U)
                    

                    // 测试信号为00时的情况
                    dut.io.signal.poke(0.U)
                    dut.io.a.poke(42.U)
                    dut.io.b.poke(84.U)
                    dut.io.c.poke(126.U)
                    dut.io.out.expect(42.U)

                    // 测试信号为01时的情况
                    dut.io.signal.poke(1.U)
                    dut.io.a.poke(42.U)
                    dut.io.b.poke(84.U)
                    dut.io.c.poke(126.U)
                    dut.io.out.expect(84.U)

                    // 测试信号为10时的情况
                    dut.io.signal.poke(2.U)
                    dut.io.a.poke(42.U)
                    dut.io.b.poke(84.U)
                    dut.io.c.poke(126.U)
                    dut.io.out.expect(126.U)
                  }
        }
    }
}


