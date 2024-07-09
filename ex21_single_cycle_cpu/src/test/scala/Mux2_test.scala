import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Mux2Tester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Mux2).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                // 测试信号为0时的情况
                dut.io.signal.poke(false.B)
                dut.clock.step()
                dut.io.a.poke(42.U)
                dut.io.b.poke(84.U)
                dut.clock.step()
                print("io.out = ",dut.io.out.peek().toString)
                dut.clock.step(5)

                // 测试信号为1时的情况
                dut.io.signal.poke(true.B)
                dut.clock.step()
                dut.io.a.poke(42.U)
                dut.io.b.poke(84.U)
                dut.clock.step()
                print("io.out = ",dut.io.out.peek().toString)
                dut.clock.step(5)
              }
        }
    }
}


