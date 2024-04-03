import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class print_tb extends AnyFlatSpec with ChiselScalatestTester{

    "waveform" should "pass" in {
        test(new print).withAnnotations(Seq(WriteVcdAnnotation)){
            dut=>
                    dut.io.in.poke(3.U)
                    dut.clock.step(5) // circuit will print
                    
                    println(s"在测试过程中: 输入 is ${dut.io.in.peek()}")

        }
        println("SUCCESS!!")

    }
}

