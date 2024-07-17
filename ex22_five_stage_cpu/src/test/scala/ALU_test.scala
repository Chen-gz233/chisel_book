import chisel3._
import chiseltest._
import scala.util.Random
import org.scalatest.flatspec.AnyFlatSpec

class ALUTester extends AnyFlatSpec with ChiselScalatestTester{
    "Waveform" should "pass" in {
        test (new ALU).withAnnotations(Seq(WriteVcdAnnotation)){//WriteVcdAnnotation
            c=> {

                    // 测试加法
                    c.io.alu_ctr.poke("b00000".U)
                    c.io.a.poke(10.U)
                    c.io.b.poke(32.U)
                    c.clock.step(1)
                    c.io.out.expect( 42.U)

                    // 测试减法
                    c.io.alu_ctr.poke("b00001".U)
                    c.io.a.poke(42.U)
                    c.io.b.poke( 32.U)
                    c.clock.step(1)
                    c.io.out.expect(10.U)

                    // 测试按位与
                    c.io.alu_ctr.poke( "b00010".U)
                    c.io.a.poke( "b1100".U)
                    c.io.b.poke( "b1010".U)
                    c.clock.step(1)
                    c.io.out.expect( "b1000".U)

                    // 测试按位或
                    c.io.alu_ctr.poke( "b00011".U)
                    c.io.a.poke( "b1100".U)
                    c.io.b.poke( "b1010".U)
                    c.clock.step(1)
                    c.io.out.expect( "b1110".U)

                    // 测试按位异或
                    c.io.alu_ctr.poke("b00100".U)
                    c.io.a.poke("b1100".U)
                    c.io.b.poke("b1010".U)
                    c.clock.step(1)
                    c.io.out.expect( "b0110".U)

                    // 测试逻辑左移
                    c.io.alu_ctr.poke( "b00101".U)
                    c.io.a.poke(1.U)
                    c.io.b.poke(2.U)
                    c.clock.step(1)
                    c.io.out.expect(4.U)

                    // 测试有符号比较小于
                    c.io.alu_ctr.poke( "b00110".U)
                    c.io.a.poke("hFFFFFFFF".U)// -1 的无符号表示
                    c.io.b.poke(1.U)
                    c.clock.step(1)
                    c.io.out.expect( 1.U)

                    // 测试无符号比较小于
                    c.io.alu_ctr.poke( "b00111".U)
                    c.io.a.poke(1.U)
                    c.io.b.poke(2.U)
                    c.clock.step(1)
                    c.io.out.expect(1.U)

                    // 测试逻辑右移
                    c.io.alu_ctr.poke("b01000".U)
                    c.io.a.poke(4.U)
                    c.io.b.poke( 1.U)
                    c.clock.step(1)
                    c.io.out.expect( 2.U)

                    // 测试算术右移
                    c.io.alu_ctr.poke( "b01001".U)
                    c.io.a.poke("hFFFFFFFC".U)      // -4 的无符号表示
                    c.io.b.poke(1.U)
                    c.clock.step(1)
                    c.io.out.expect("hFFFFFFFE".U)  // -2 的无符号表示

                    // 测试加法并清零最低位
                    c.io.alu_ctr.poke( "b01010".U)
                    c.io.a.poke( 3.U)
                    c.io.b.poke( 2.U)
                    c.clock.step(1)
                    c.io.out.expect( 4.U)  // 3 + 2 = 5, 但最低位清零，结果为 4

                    // 测试相等比较
                    c.io.alu_ctr.poke( "b01011".U)
                    c.io.a.poke(10.U)
                    c.io.b.poke( 10.U)
                    c.clock.step(1)
                    c.io.condition_branch.expect( true.B)

                    // 测试不相等比较
                    c.io.alu_ctr.poke( "b01100".U)
                    c.io.a.poke(10.U)
                    c.io.b.poke( 20.U)
                    c.clock.step(1)
                    c.io.condition_branch.expect( true.B)

                    // 测试有符号小于比较
                    c.io.alu_ctr.poke("b01101".U)
                    c.io.a.poke("hFFFFFFF6".U) // -10 的无符号表示
                    c.io.b.poke(20.U)
                    c.clock.step(1)
                    c.io.condition_branch.expect( true.B)

                    // 测试有符号大于等于比较
                    c.io.alu_ctr.poke("b01110".U)
                    c.io.a.poke(20.U)
                    c.io.b.poke( 10.U)
                    c.clock.step(1)
                    c.io.condition_branch.expect( true.B)

                    // 测试无符号小于比较
                    c.io.alu_ctr.poke("b01111".U)
                    c.io.a.poke(10.U)
                    c.io.b.poke( 20.U)
                    c.clock.step(1)
                    c.io.condition_branch.expect( true.B)

                    // 测试无符号大于等于比较
                    c.io.alu_ctr.poke( "b10000".U)
                    c.io.a.poke( 20.U)
                    c.io.b.poke( 10.U)
                    c.clock.step(1)
                    c.io.condition_branch.expect( true.B)
                  }
        }
    }
}

