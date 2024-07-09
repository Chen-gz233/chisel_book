import chisel3._
import chisel3.util._

class DataMem extends Module {
  val io = IO(new Bundle {
    // val clk = Input(Clock())           // 时钟信号
    // val rst = Input(Bool())            // 复位信号
    val write_mem = Input(UInt(2.W))   // 写入内存控制信号
    val read_mem = Input(UInt(3.W))    // 读取内存控制信号
    val address = Input(UInt(32.W))    // 地址信号
    val write_data = Input(UInt(32.W)) // 写入数据
    val out_mem = Output(UInt(32.W))   // 输出数据
  })

  // 定义数据存储器，128字节
  val data = Mem(128, UInt(8.W))

  // 异步读取操作
  io.out_mem := 0.U
  switch(io.read_mem(1,0)) {
    is("b00".U) {
      io.out_mem := 0.U
    }
    is("b01".U) {
      io.out_mem := Cat(data(io.address + 3.U), data(io.address + 2.U), data(io.address + 1.U), data(io.address))
    }
    is("b10".U) {
      io.out_mem := Mux(io.read_mem(2),
                        Cat(Fill(16, data(io.address + 1.U)(7)), data(io.address + 1.U), data(io.address)),
                        Cat(0.U(16.W), data(io.address + 1.U), data(io.address)))
    }
    is("b11".U) {
      io.out_mem := Mux(io.read_mem(2),
                        Cat(Fill(24, data(io.address)(7)), data(io.address)),
                        Cat(0.U(24.W), data(io.address)))
    }
  }

  // 同步写入操作
  when(io.write_mem === "b01".U) {
    data(io.address + 3.U) := io.write_data(31, 24)
    data(io.address + 2.U) := io.write_data(23, 16)
    data(io.address + 1.U) := io.write_data(15, 8)
    data(io.address) := io.write_data(7, 0)
  } .elsewhen(io.write_mem === "b10".U) {
    data(io.address + 1.U) := io.write_data(15, 8)
    data(io.address) := io.write_data(7, 0)
  } .elsewhen(io.write_mem === "b11".U) {
    data(io.address) := io.write_data(7, 0)
  }
}

object DataMem extends App {
  emitVerilog(new DataMem(),Array("--target-dir","generate"))
}
