import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class CPUTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new Five_Stage_CPU).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            c=> {
                c.clock.step(1)
                 for (i <- 0 until 10) {
                        // 读取当前PC值
                        val pc = c.io.pc.peek()
                        println(s"PC: $pc")

                        // 读取指令存储器中的指令
                        val instr = c.io.instr.peek()
                        println(s"Instruction: $instr")

                        // 模拟时钟周期
                        c.clock.step(1)

                        // 检查一些关键信号的输出
                        val aluOut = c.io.aluOut.peek()
                        println(s"ALU Out: $aluOut")

                        val writeData = c.io.writeData.peek()
                        println(s"Write Data: $writeData")
                    }



                }
        }
    }
}