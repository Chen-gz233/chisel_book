import chisel3._
import chisel3.util._

class EX_to_ME extends Module {
  val io = IO(new Bundle {
    val flush                    = Input(Bool())

    val ex_wb_aluOut_or_CacheOut = Input(Bool())
    val ex_write_valid           = Input(Bool())
    val ex_write_code            = Input(UInt(2.W))
    val ex_read_code             = Input(UInt(3.W))
    val ex_nextPC_pc_or_rs1      = Input(UInt(2.W))
    val ex_conditionBranch       = Input(Bool())
    val ex_pcImm                 = Input(UInt(32.W))
    val ex_rs1Imm                = Input(UInt(32.W))
    val ex_AluOut                = Input(UInt(32.W))
    val ex_rs2Data               = Input(UInt(32.W))
    val ex_rd_address            = Input(UInt(5.W))
    val ex_rs2_address           = Input(UInt(5.W))

    val me_WB_aluOut_or_memOut    = Output(Bool())
    val me_write_valid            = Output(Bool())
    val me_write_code             = Output(UInt(2.W))
    val me_read_code              = Output(UInt(3.W))
    val me_nextPC_pcImm_or_rs1Imm = Output(UInt(2.W))
    val me_conditionBranch        = Output(Bool())
    val me_pcImm                  = Output(UInt(32.W))
    val me_rs1Imm                 = Output(UInt(32.W))
    val me_AluOut                 = Output(UInt(32.W))
    val me_rs2Data                = Output(UInt(32.W))
    val me_rd_address             = Output(UInt(5.W))
    val me_rs2_address            = Output(UInt(5.W))
  })

  val me_WB_aluOut_or_memOut      = RegInit(false.B)
  val me_write_valid              = RegInit(true.B)
  val me_write_code               = RegInit(0.U(2.W))
  val me_read_code                = RegInit(0.U(3.W))
  val me_nextPC_pcImm_or_rs1Imm   = RegInit(0.U(2.W))
  val me_conditionBranch          = RegInit(false.B)
  val me_pcImm                    = RegInit(0.U(32.W))
  val me_rs1Imm                   = RegInit(0.U(32.W))
  val me_AluOut                   = RegInit(0.U(32.W))
  val me_rs2Data                  = RegInit(0.U(32.W))
  val me_rd_address               = RegInit(0.U(5.W))
  val me_rs2_address              = RegInit(0.U(5.W))

  when( io.flush) {
    me_WB_aluOut_or_memOut    := false.B
    me_write_valid            := true.B
    me_write_code             := 0.U
    me_read_code              := 0.U
    me_nextPC_pcImm_or_rs1Imm := 0.U
    me_conditionBranch        := false.B
    me_pcImm                  := 0.U
    me_rs1Imm                 := 0.U
    me_AluOut                 := 0.U
    me_rs2Data                := 0.U
    me_rd_address             := 0.U
    me_rs2_address            := 0.U
  } .otherwise {
    me_WB_aluOut_or_memOut    := io.ex_wb_aluOut_or_CacheOut
    me_write_valid            := io.ex_write_valid
    me_write_code             := io.ex_write_code
    me_read_code              := io.ex_read_code
    me_nextPC_pcImm_or_rs1Imm := io.ex_nextPC_pc_or_rs1
    me_conditionBranch        := io.ex_conditionBranch
    me_pcImm                  := io.ex_pcImm
    me_rs1Imm                 := io.ex_rs1Imm
    me_AluOut                 := io.ex_AluOut
    me_rs2Data                := io.ex_rs2Data
    me_rd_address             := io.ex_rd_address
    me_rs2_address            := io.ex_rs2_address
  }

  io.me_WB_aluOut_or_memOut     := me_WB_aluOut_or_memOut
  io.me_write_valid             := me_write_valid
  io.me_write_code              := me_write_code
  io.me_read_code               := me_read_code
  io.me_nextPC_pcImm_or_rs1Imm  := me_nextPC_pcImm_or_rs1Imm
  io.me_conditionBranch         := me_conditionBranch
  io.me_pcImm                   := me_pcImm
  io.me_rs1Imm                  := me_rs1Imm
  io.me_AluOut                  := me_AluOut
  io.me_rs2Data                 := me_rs2Data
  io.me_rd_address              := me_rd_address
  io.me_rs2_address             := me_rs2_address
}

object EX_to_ME extends App {
  emitVerilog(new EX_to_ME(),Array("--target-dir","generate"))
}

