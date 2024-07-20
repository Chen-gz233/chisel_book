import chisel3._
import chisel3.util._

class Data_Cache extends Module {
  val io = IO(new Bundle {
    //RV32I的字长是32bit，但是，数据存储器不仅要支持32bit数据的存取，
    //同时也需要支持按字节（8bit）或半字（16bit）大小的读取
    // 为010时为4字节读
    // 为001时为2字节读带符号扩展
    // 为000时为1字节读带符号扩展
    // 为101时为2字节读无符号扩展
    // 为100时为1字节读无符号扩展
  
    //根据地址的低2位选择合适的数据拼接扩展成写的结果
    
    val write_code  = Input(UInt(2.W))   // 写入cache控制信号  （写操作的大小（字节、半字或字）） 
    val read_code   = Input(UInt(3.W))    // 读取cache控制信号   读操作的大小（字节、半字、字、符号扩展或零扩展）
    val address     = Input(UInt(32.W))    // 地址
    val write_data  = Input(UInt(32.W)) // 写入数据
    val out_data    = Output(UInt(32.W))   // 输出数据
  })

  // 定义数据存储器，双端口RAM（RAM 2 PORT） 128字节
  val data = Mem(128, UInt(8.W))

  // 异步读取操作
  io.out_data := 0.U
  
  switch(io.read_code(1,0)) {
    is("b00".U) {
      io.out_data := 0.U
    }
    is("b01".U) {
      io.out_data := Cat(data(io.address + 3.U), data(io.address + 2.U), data(io.address + 1.U), data(io.address))
    }
    is("b10".U) {
      io.out_data := Mux(io.read_code(2),
                        Cat(Fill(16, data(io.address + 1.U)(7)), data(io.address + 1.U), data(io.address)),
                        Cat(0.U(16.W), data(io.address + 1.U), data(io.address)))
    }
    is("b11".U) {
      io.out_data := Mux(io.read_code(2),
                        Cat(Fill(24, data(io.address)(7)), data(io.address)),
                        Cat(0.U(24.W), data(io.address)))
    }
  }

  // 同步写入操作
  when(io.write_code === "b01".U) {
    data(io.address + 3.U)  := io.write_data(31, 24)
    data(io.address + 2.U)  := io.write_data(23, 16)
    data(io.address + 1.U)  := io.write_data(15, 8)
    data(io.address) := io.write_data(7, 0)
  } .elsewhen(io.write_code === "b10".U) {
    data(io.address + 1.U)  := io.write_data(15, 8)
    data(io.address)        := io.write_data(7, 0)
  } .elsewhen(io.write_code === "b11".U) {
    data(io.address)        := io.write_data(7, 0)
  }
}

object Data_Cache extends App {
  emitVerilog(new Data_Cache(),Array("--target-dir","generate"))
}
