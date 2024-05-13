import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class sort4_test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new sort4(true)).withAnnotations(Seq(WriteVcdAnnotation)){
            c=>
                c.io.in0.poke(3.U)
                c.io.in1.poke(6.U)
                c.io.in2.poke(9.U)
                c.io.in3.poke(12.U)
                c.clock.step(2)
                c.io.out0.expect(3.U)
                c.io.out1.expect(6.U)
                c.io.out2.expect(9.U)
                c.io.out3.expect(12.U)
                c.clock.step(2)
                }

        

        test (new sort4(false)).withAnnotations(Seq(WriteVcdAnnotation)){
            c=>
                c.io.in0.poke(4.U)
                c.io.in1.poke(6.U)
                c.io.in2.poke(10.U)
                c.io.in3.poke(12.U)
                c.clock.step(2)
                c.io.out0.expect(12.U)
                c.io.out1.expect(10.U)
                c.io.out2.expect(6.U)
                c.io.out3.expect(4.U)
                c.clock.step(2)
        }
    println("succeed!\n")
    }
         
}

