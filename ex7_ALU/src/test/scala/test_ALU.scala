import  chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
/*
    val in_a = Input(SInt(n.W))
    val in_b = Input(SInt(n.W))
    val in_sel = Input(UInt(3.W))

    val out_result = Output(SInt(n.W))
    val out_overflow = Output(UInt(1.W))
    val out_zero = Output(UInt(1.W))
    val out_xor = Output(UInt(n.W))
    val out_and = Output(UInt(n.W))
    val out_or = Output(UInt(n.W))
    val out_not = Output(UInt(n.W))
    val out_compare = Output(UInt(1.W))
    val out_equal = Output(UInt(1.W))
})
*/
class ALU_Test extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        
        test (new ALU(32)).withAnnotations(Seq(WriteVcdAnnotation)){
        dut =>
                println("sel = 0 ##加法 ")

                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(0.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()

                println(" out_result = ",dut.io.out_result.peek().toString)
                println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                println(" out_zero = ",dut.io.out_zero.peek().toString)


                println("sel = 1 ##减法 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(1.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_result = ",dut.io.out_result.peek().toString)
                println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                println(" out_zero = ",dut.io.out_zero.peek().toString)

                println("sel = 2 ##取反 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(2.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_not = ",dut.io.out_not.peek().toString)

                println("sel = 3 ##与 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(3.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_and = ",dut.io.out_and.peek().toString)

                println("sel = 4 ##或 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(4.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_or = ",dut.io.out_or.peek().toString)

                println("sel = 5 ##异或 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(5.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_xor = ",dut.io.out_xor.peek().toString)

                println("sel = 6 ##比较大小 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(6.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_compare = ",dut.io.out_compare.peek().toString)


                println("sel = 7 ##判断相等 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(7.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
                
                println(" out_equal = ",dut.io.out_equal.peek().toString)


                println("sel = 8 ##其他 ")
                dut.io.in_a.poke(8.S)
                dut.io.in_b.poke(7.S)
                dut.io.in_sel.poke(7.U)
                println("in_a = ",dut.io.in_a.peek().toString,"in_b = ",dut.io.in_b.peek().toString,"in_sel =",dut.io.in_sel.peek().toString)
                dut.clock.step()
        
                println(" out_result = ",dut.io.out_result.peek().toString)
                println(" out_overflow = ",dut.io.out_overflow.peek().toString)
                println(" out_zero = ",dut.io.out_zero.peek().toString)
                println(" out_equal = ",dut.io.out_equal.peek().toString)
                println(" out_xor = ",dut.io.out_xor.peek().toString)
                println(" out_and = ",dut.io.out_and.peek().toString)
                println(" out_or = ",dut.io.out_or.peek().toString)
                println(" out_not = ",dut.io.out_not.peek().toString)
                println(" out_compare = ",dut.io.out_compare.peek().toString)






    }

}}