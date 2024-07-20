import chisel3._
import chisel3.util._

class IF_to_ID extends Module{
    val io = IO(new Bundle{
        val pause           = Input(Bool())
        val flush           = Input(Bool())
        val if_pc           = Input(UInt(32.W))
        val if_instruction  = Input(UInt(32.W))
        val id_pc           = Output(UInt(32.W))
        val id_instruction  = Output(UInt(32.W)) 
    })
    val idPcReg     = RegInit(0.U(32.W))
    val idInstrReg  = RegInit("h00000013".U(32.W)) // NOP instruction

    when(io.flush) {
        idPcReg     := 0.U
        idInstrReg  := "h00000013".U(32.W) // NOP instruction
    } .elsewhen(!io.pause) {
        idPcReg     := io.if_pc
        idInstrReg  := io.if_instruction
    }.otherwise{
        idPcReg     := idPcReg
        idInstrReg  := idInstrReg
    }

    io.id_pc          := idPcReg
    io.id_instruction := idInstrReg

}