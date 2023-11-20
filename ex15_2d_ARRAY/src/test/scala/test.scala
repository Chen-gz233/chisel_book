import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class Array_2D_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Array_2D).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            dut=>

                //val weight = (1 to 64).map(_ => Random.nextInt(256) - 128).toArray
                val in_a_tb = (1 to 64).map(_ => Random.nextInt(8)).toArray

                val inputMatrix = Seq(
                    Seq(in_a_tb(0), in_a_tb(2), in_a_tb(3)),
                    Seq(in_a_tb(4), in_a_tb(5), in_a_tb(6)),
                    Seq(in_a_tb(7), in_a_tb(8), in_a_tb(9))
                )

                for (i <- 0 until 3) {
                    for (j <- 0 until 3) {
                    dut.io.inMatrix(i)(j).poke(inputMatrix(i)(j).U)
                    }
                }
                //dut.io.inMatrix.poke(inputMatrix)
                
                dut.clock.step()
                for (i <- 0 until 3) {
                    for (j <- 0 until 3) {
                        print("Array_2D output = ",dut.io.outMatrix(i)(j).peek().toString)
                    }
                }

        }
    }


}
