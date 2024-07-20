import chisel3._
import chisel3.util._

class Hazard_Detection_Unit extends Module {
    val io = IO(new Bundle{
        val EX_ReadCache = Input(UInt(3.W))
        val EX_rd_address = Input(UInt(5.W))
        val EX_rs1_address = Input(UInt(5.W))
        val EX_rs2_address = Input(UInt(5.W))
        val pause = Output(Bool())
    })

    // io.pause := false.B

    when((io.EX_ReadCache =/= 0.U) && ((io.EX_rd_address === io.EX_rs1_address)  || (io.EX_rd_address === io.EX_rs2_address))){
        io.pause := true.B
    }.otherwise{
        io.pause := false.B
    }

}

object Hazard_Detection_Unit extends App {
  emitVerilog(new Hazard_Detection_Unit(),Array("--target-dir","generate"))
}