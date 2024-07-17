import chisel3._
import chisel3.util._
/*
寄存器堆是CPU中用于存放指令执行过程中临时数据的存储单元。 
我们将要实现的RISC-V的基础版本CPU RV32I具有32个寄存器。 
RV32I采用 Load Store 架构，即所有数据都需要先用Load语句从内存中读取到寄存器里才可以进行算术和逻辑操作。 
因此，RV32I有32个通用寄存器，且每条算术运算可能要同时读取两个源寄存器并写入一个目标寄存器。 
为支持高速，多端口并行存取的寄存器堆，我们不能直接调用通用的RAM，而需要用Verilog语言单独编写寄存器堆。

RV32I共32个32bit的通用寄存器x0~x31（寄存器地址为5bit编码），其中寄存器x0中的内容总是0，无法改变。
*/
class Reg_Banks extends Module {
  val io = IO(new Bundle {
    val write_valid = Input(Bool())           // 写寄存器使能信号
    val rs1_address = Input(UInt(5.W))        // 源寄存器1地址
    val rs2_address = Input(UInt(5.W))        // 源寄存器2地址
    val rd_address  = Input(UInt(5.W))        // 目标寄存器地址
    val write_rd_data = Input(UInt(32.W))     // 写入目标寄存器的数据

    val read_rs1_data = Output(UInt(32.W))    // 读取源寄存器1的数据
    val read_rs2_data = Output(UInt(32.W))    // 读取源寄存器2的数据
  })

  // 定义32个32位寄存器组
  val Reg_Banks = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
  
  // 写寄存器
  when(io.write_valid && io.rd_address =/= 0.U) {
    Reg_Banks(io.rd_address) := io.write_rd_data
  }

   // 读取寄存器 rs1
  io.read_rs1_data := Mux(io.rs1_address === 0.U, 0.U, Mux(io.rs1_address === io.rd_address && io.write_valid, io.write_rd_data, Reg_Banks(io.rs1_address)))

  // 读取寄存器 rs2
  io.read_rs2_data := Mux(io.rs2_address === 0.U, 0.U, Mux(io.rs2_address === io.rd_address && io.write_valid, io.write_rd_data, Reg_Banks(io.rs2_address)))


}

object Reg_Banks extends App {
  emitVerilog(new Reg_Banks(),Array("--target-dir","generate"))
}
