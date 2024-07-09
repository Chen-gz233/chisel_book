import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class ALUTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new ALU).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            c=> {

                    // 测试加法
                    c.io.aluc.poke("b00000".U)
                    c.io.a.poke(10.U)
                    c.io.b.poke(32.U)
                    c.clock.step(1)
                    c.io.out.expect( 42.U)

                    // 测试减法
                    c.io.aluc.poke("b00001".U)
                    c.io.a.poke(42.U)
                    c.io.b.poke( 32.U)
                    c.clock.step(1)
                    c.io.out.expect(10.U)


                  }
        }
    }
}

