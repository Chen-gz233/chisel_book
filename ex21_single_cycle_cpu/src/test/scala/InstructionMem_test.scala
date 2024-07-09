import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class InstructionMemTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new InstructionMem).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=> {
                // // 测试信号为0时的情况
                // dut.io.signal.poke(false.B)
                // dut.clock.step()
                // dut.io.a.poke(42.U)
                // dut.io.b.poke(84.U)
                // dut.clock.step()
                // print("io.out = ",dut.io.out.peek().toString)
                // dut.clock.step(5)
                // 测试读取指令
                  for (i <- 0 until 13) {
                    dut.io.pc.poke( i * 4)
                    dut.clock.step()
                    dut.io.instruction.expect( i match {
                      case 0 => "hfe010113".U(32.W)
                      case 1 => "h00812e23".U(32.W)
                      case 2 => "h02010413".U(32.W)
                      case 3 => "hfea42623".U(32.W)
                      case 4 => "hfec42783".U(32.W)
                      case 5 => "h0007a783".U(32.W)
                      case 6 => "h00a78713".U(32.W)
                      case 7 => "hfec42783".U(32.W)
                      case 8 => "h00e7a023".U(32.W)
                      case 9 => "h00000013".U(32.W)
                      case 10 => "h01c12403".U(32.W)
                      case 11 => "h02010113".U(32.W)
                      case 12 => "h00008067".U(32.W)
                    })
                  dut.clock.step()
                  }
                }
        }
    }
}
