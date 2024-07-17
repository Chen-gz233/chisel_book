import chisel3._
import chisel3.util._

// class PC extends Module {
//   val io = IO(new Bundle {
//     val next_pc = Input(UInt(32.W))    // 下一条指令地址
//     val pc      = Output(UInt(32.W))   // 更新pc
//   })

//   val pcReg = RegInit(0x34.U(32.W)) 

//   pcReg := io.next_pc

//   io.pc := pcReg                       // 输出更新PC值
// }
class PC extends Module {
  val io = IO(new Bundle {
    val pause = Input(Bool())
    val next_pc = Input(UInt(32.W))
    val pc = Output(UInt(32.W))
  })

  val pcReg = RegInit(52.U(32.W))

  // pcReg := () ? io.next_pc : pcReg
  pcReg := Mux((!io.pause), io.next_pc, pcReg)

  io.pc := pcReg
}

object PC extends App{
    emitVerilog(new PC(),Array("--target-dir","generate"))
    
}