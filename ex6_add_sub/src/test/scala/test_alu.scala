import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
    val io= IO(new Bundle{
    val in_a = Input(UInt(8.W))
    val in_b = Input(UInt(8.W))
    val in_sel = Input(UInt(1.W))
    val out_result = Output(UInt(8.W))
    val out_overflow = Output(UInt(1.W))
    val out_zero = Output(UInt(1.W))
})
*/
class ALU_sub_and_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new ALU_sub_and).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>

                        dut.io.in_a.poke(8.U)
                        dut.io.in_b.poke(7.U)
                        dut.io.in_sel.poke(0.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                        dut.clock.step()
                        println(" out_result = ",dut.io.out_result.peek().toString)
                        println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                        println(" out_zero = ",dut.io.out_zero.peek().toString)
                        //assert(dut.io.out_result.peek().toString === 17.U)
                        println("")
                        dut.clock.step()
                        dut.io.in_a.poke(12.U)
                        dut.io.in_b.poke(6.U)
                        dut.io.in_sel.poke(1.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                        dut.clock.step()
                        println(" out_result = ",dut.io.out_result.peek().toString)
                        println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                        println(" out_zero = ",dut.io.out_zero.peek().toString)
                        println("")
                        dut.clock.step()
                        dut.io.in_a.poke(2.U)
                        dut.io.in_b.poke(0.U)
                        dut.io.in_sel.poke(1.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                        dut.clock.step()
                        println(" out_result = ",dut.io.out_result.peek().toString)
                        println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                        println(" out_zero = ",dut.io.out_zero.peek().toString)
                        println("")

                        /*
                        dut.clock.step()
                        dut.io.in_a.poke(1.U)
                        dut.io.in_b.poke(-2.U)
                        dut.io.in_sel.poke(1.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                        dut.clock.step()
                        println(" out_result = ",dut.io.out_result.peek().toString)
                        println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                        println(" out_zero = ",dut.io.out_zero.peek().toString)
                        println("")
                        dut.clock.step()
                        dut.io.in_a.poke(12.U)
                        dut.io.in_b.poke(-5.U)
                        dut.io.in_sel.poke(0.U)
                        println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                        dut.clock.step()
                        println(" out_result = ",dut.io.out_result.peek().toString)
                        println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                        println(" out_zero = ",dut.io.out_zero.peek().toString)
                        println("")
                        */



    }

}}