import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    val alu_ctr           = Input(UInt(5.W))             // ALU控制信号
    val a                 = Input(UInt(32.W))            // ALU的第一个输入操作数
    val b                 = Input(UInt(32.W))            // ALU的第二个输入操作数
    val out               = Output(UInt(32.W))           // ALU的输出结果
    val condition_branch  = Output(Bool())               // 条件分支信号
  })

  io.out              := 0.U                          // 默认输出值
  io.condition_branch := false.B         // 默认条件分支信号

  switch(io.alu_ctr) {
    is("b00000".U) { io.out := io.a + io.b }                             // 加法
    is("b00001".U) { io.out := io.a - io.b }                             // 减法
    is("b00010".U) { io.out := io.a & io.b }                             // 按位与
    is("b00011".U) { io.out := io.a | io.b }                             // 按位或
    is("b00100".U) { io.out := io.a ^ io.b }                             // 按位异或
    is("b00101".U) { io.out := io.a << io.b(4,0) }                       // 逻辑左移
    is("b00110".U) { io.out := (io.a.asSInt < io.b.asSInt).asUInt }      // 有符号比较小于
    is("b00111".U) { io.out := (io.a < io.b).asUInt }                    // 无符号比较小于
    is("b01000".U) { io.out := io.a >> io.b(4,0) }                       // 逻辑右移
    is("b01001".U) { io.out := (io.a.asSInt >> io.b(4,0)).asUInt }       // 算术右移
    is("b01010".U) { io.out := (io.a + io.b) & "hFFFFFFFE".U     }       // 加法，并将最低位清零                  
    //注意：比较大小或判断相等时应使用减法操作。
    is("b01011".U) { io.condition_branch := io.a === io.b }              // 相等比较
    is("b01100".U) { io.condition_branch := io.a =/= io.b }              // 不相等比较
    is("b01101".U) { io.condition_branch := io.a.asSInt < io.b.asSInt }  // 有符号小于比较
    is("b01110".U) { io.condition_branch := io.a.asSInt >= io.b.asSInt } // 有符号大于等于比较
    is("b01111".U) { io.condition_branch := io.a < io.b }                // 无符号小于比较
    is("b10000".U) { io.condition_branch := io.a >= io.b }               // 无符号大于等于比较
  }
}

object ALU extends App {
  emitVerilog(new ALU(),Array("--target-dir","generate"))
}
