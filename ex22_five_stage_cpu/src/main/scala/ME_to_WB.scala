import chisel3._

class ME_to_WB extends Module {
  val io = IO(new Bundle {
    val me_WB_aluOut_or_memOut = Input(Bool())
    val me_write_valid         = Input(Bool())
    val me_MemOut              = Input(UInt(32.W))
    val me_AluOut              = Input(UInt(32.W))
    val me_rd_address          = Input(UInt(5.W))

    val wb_aluOut_or_memOut    = Output(Bool())
    val wb_write_valid         = Output(Bool())
    val wb_MemOut              = Output(UInt(32.W))
    val wb_AluOut              = Output(UInt(32.W))
    val wb_rd_address          = Output(UInt(5.W))
  })

  val wb_aluOut_or_memOut      = RegInit(false.B)
  val wb_write_valid           = RegInit(true.B)
  val wb_MemOut                = RegInit(0.U(32.W))
  val wb_AluOut                = RegInit(0.U(32.W))
  val wb_rd_address            = RegInit(0.U(5.W))

    wb_aluOut_or_memOut        := io.me_WB_aluOut_or_memOut
    wb_write_valid             := io.me_write_valid
    wb_MemOut                  := io.me_MemOut
    wb_AluOut                  := io.me_AluOut
    wb_rd_address              := io.me_rd_address


  io.wb_aluOut_or_memOut       := wb_aluOut_or_memOut
  io.wb_write_valid            := wb_write_valid
  io.wb_MemOut                 := wb_MemOut
  io.wb_AluOut                 := wb_AluOut
  io.wb_rd_address             := wb_rd_address
}

object ME_to_WB extends App {
  emitVerilog(new ME_to_WB(),Array("--target-dir","generate"))
}