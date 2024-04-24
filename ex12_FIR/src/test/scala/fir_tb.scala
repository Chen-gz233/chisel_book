import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class fir_tb extends AnyFlatSpec with ChiselScalatestTester{

    "waveform" should "pass" in {
        test(new fir(1,2,3,4)).withAnnotations(Seq(WriteVcdAnnotation)){
            dut=>
            dut.io.in.poke(0.U)
            dut.io.out.expect(0.U)
            dut.clock.step(1)
            dut.io.in.poke(4.U)
            dut.io.out.expect(4.U)
            dut.clock.step(1)
            dut.io.in.poke(3.U)
            dut.io.out.expect(11.U)
            dut.clock.step(1)
            dut.io.in.poke(7.U)
            dut.io.out.expect(25.U)
            dut.clock.step(2)

        }
        println("SUCCESS!!")

    }
}

