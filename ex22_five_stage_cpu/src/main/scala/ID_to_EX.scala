import chisel3._
import chisel3.util._

class ID_to_EX extends Module {
  val io = IO(new Bundle {
    val pause = Input(Bool())
    val flush = Input(Bool())

    val id_alu_ctr                = Input(UInt(5.W))
    val id_wb_aluOut_or_CacheOut  = Input(Bool())
    val id_rs1Data_or_PC          = Input(Bool())
    val id_rs2Data_or_imm32_or_4  = Input(UInt(2.W))
    val id_write_valid            = Input(Bool())
    val id_write_code             = Input(UInt(2.W))
    val id_read_code              = Input(UInt(3.W))
    val id_nextPC_pc_or_rs1       = Input(UInt(2.W))
    val id_pc                     = Input(UInt(32.W))
    val id_rs1Data                = Input(UInt(32.W))
    val id_rs2Data                = Input(UInt(32.W))
    val id_imm32                  = Input(UInt(32.W))
    val id_rd_address             = Input(UInt(5.W))
    val id_rs1_address            = Input(UInt(5.W))
    val id_rs2_address            = Input(UInt(5.W))

    val ex_alu_ctr                = Output(UInt(5.W))
    val ex_wb_aluOut_or_CacheOut  = Output(Bool())
    val ex_rs1Data_or_PC          = Output(Bool())
    val ex_rs2Data_or_imm32_or_4  = Output(UInt(2.W))
    val ex_write_valid            = Output(Bool())
    val ex_write_code             = Output(UInt(2.W))
    val ex_read_code              = Output(UInt(3.W))
    val ex_nextPC_pc_or_rs1       = Output(UInt(2.W))
    val ex_pc                     = Output(UInt(32.W))
    val ex_rs1Data                = Output(UInt(32.W))
    val ex_rs2Data                = Output(UInt(32.W))
    val ex_imm32                  = Output(UInt(32.W))
    val ex_rd_address             = Output(UInt(5.W))
    val ex_rs1_address            = Output(UInt(5.W))
    val ex_rs2_address            = Output(UInt(5.W))
  })

  val ex_alu_ctr                  = RegInit(0.U(5.W))
  val ex_wb_aluOut_or_CacheOut    = RegInit(false.B)
  val ex_rs1Data_or_PC            = RegInit(false.B)
  val ex_rs2Data_or_imm32_or_4    = RegInit(0.U(2.W))
  val ex_write_valid              = RegInit(true.B)
  val ex_write_code               = RegInit(0.U(2.W))
  val ex_read_code                = RegInit(0.U(3.W))
  val ex_nextPC_pc_or_rs1         = RegInit(0.U(2.W))
  val ex_pc                       = RegInit(0.U(32.W))
  val ex_rs1Data                  = RegInit(0.U(32.W))
  val ex_rs2Data                  = RegInit(0.U(32.W))
  val ex_imm32                    = RegInit(0.U(32.W))
  val ex_rd_address               = RegInit(0.U(5.W))
  val ex_rs1_address              = RegInit(0.U(5.W))
  val ex_rs2_address              = RegInit(0.U(5.W))

  when(io.pause || io.flush) {
      ex_alu_ctr                := 0.U
      ex_wb_aluOut_or_CacheOut  := false.B
      ex_rs1Data_or_PC          := false.B
      ex_rs2Data_or_imm32_or_4  := 1.U
      ex_write_valid            := true.B
      ex_write_code             := 0.U
      ex_read_code              := 0.U
      ex_nextPC_pc_or_rs1       := 0.U
      ex_pc                     := 0.U
      ex_rs1Data                := 0.U
      ex_rs2Data                := 0.U
      ex_imm32                  := 0.U
      ex_rd_address             := 0.U
      ex_rs1_address            := 0.U
      ex_rs2_address            := 0.U
  } .otherwise {
      ex_alu_ctr                  := io.id_alu_ctr
      ex_wb_aluOut_or_CacheOut    := io.id_wb_aluOut_or_CacheOut
      ex_rs1Data_or_PC            := io.id_rs1Data_or_PC
      ex_rs2Data_or_imm32_or_4    := io.id_rs2Data_or_imm32_or_4
      ex_write_valid              := io.id_write_valid
      ex_write_code               := io.id_write_code
      ex_read_code                := io.id_read_code
      ex_nextPC_pc_or_rs1         := io.id_nextPC_pc_or_rs1
      ex_pc                       := io.id_pc
      ex_rs1Data                  := io.id_rs1Data
      ex_rs2Data                  := io.id_rs2Data
      ex_imm32                    := io.id_imm32
      ex_rd_address               := io.id_rd_address
      ex_rs1_address              := io.id_rs1_address
      ex_rs2_address              := io.id_rs2_address
  }

  io.ex_alu_ctr                 := ex_alu_ctr
  io.ex_wb_aluOut_or_CacheOut   := ex_wb_aluOut_or_CacheOut
  io.ex_rs1Data_or_PC           := ex_rs1Data_or_PC
  io.ex_rs2Data_or_imm32_or_4   := ex_rs2Data_or_imm32_or_4
  io.ex_write_valid             := ex_write_valid
  io.ex_write_code              := ex_write_code
  io.ex_read_code               := ex_read_code
  io.ex_nextPC_pc_or_rs1        := ex_nextPC_pc_or_rs1
  io.ex_pc                      := ex_pc
  io.ex_rs1Data                 := ex_rs1Data
  io.ex_rs2Data                 := ex_rs2Data
  io.ex_imm32                   := ex_imm32
  io.ex_rd_address              := ex_rd_address
  io.ex_rs1_address             := ex_rs1_address
  io.ex_rs2_address             := ex_rs2_address
}

object ID_to_EX extends App {
  emitVerilog(new ID_to_EX(),Array("--target-dir","generate"))
}
