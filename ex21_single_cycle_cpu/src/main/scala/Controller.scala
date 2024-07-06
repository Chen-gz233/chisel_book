import chisel3._
import chisel3.util._

class Controller extends Module {
  val io = IO(new Bundle {
    val opcode               = Input(UInt(7.W))
    val func3                = Input(UInt(3.W))
    val func7                = Input(UInt(7.W))

    val aluc                 = Output(UInt(5.W))
    val aluOut_WB_memOut     = Output(Bool())
    val rs1Data_EX_PC        = Output(Bool())
    val rs2Data_EX_imm32_4   = Output(UInt(2.W))
    val write_reg            = Output(Bool())
    val write_mem            = Output(UInt(2.W))
    val read_mem             = Output(UInt(3.W))
    val extOP                = Output(UInt(3.W))
    val pcImm_NEXTPC_rs1Imm  = Output(UInt(2.W))
  })

  // 默认值设置为0
  io.aluc := 0.U
  io.aluOut_WB_memOut := false.B
  io.rs1Data_EX_PC := false.B
  io.rs2Data_EX_imm32_4 := 0.U
  io.write_reg := false.B
  io.write_mem := 0.U
  io.read_mem := 0.U
  io.extOP := 0.U
  io.pcImm_NEXTPC_rs1Imm := 0.U

  // 根据opcode和func3, func7解码生成控制信号
  switch(io.opcode) {
    is("b0110011".U) { // R型指令
      io.write_reg := true.B
      io.rs2Data_EX_imm32_4 := "b00".U
      switch(io.func3) {
        is("b000".U) {
          when(io.func7 === "b0000000".U) {
            io.aluc := "b00000".U // ADD
          }.elsewhen(io.func7 === "b0100000".U) {
            io.aluc := "b00001".U // SUB
          }
        }
        is("b111".U) { io.aluc := "b00010".U } // AND
        is("b110".U) { io.aluc := "b00011".U } // OR
        is("b100".U) { io.aluc := "b00100".U } // XOR
        is("b001".U) { io.aluc := "b00101".U } // SLL
        is("b101".U) {
          when(io.func7 === "b0000000".U) {
            io.aluc := "b01000".U // SRL
          }.elsewhen(io.func7 === "b0100000".U) {
            io.aluc := "b01001".U // SRA
          }
        }
      }
    }
    is("b0010011".U) { // I型指令
      io.write_reg := true.B
      io.rs2Data_EX_imm32_4 := "b01".U
      switch(io.func3) {
        is("b000".U) { io.aluc := "b00000".U } // ADDI
        is("b111".U) { io.aluc := "b00010".U } // ANDI
        is("b110".U) { io.aluc := "b00011".U } // ORI
        is("b100".U) { io.aluc := "b00100".U } // XORI
        is("b001".U) { io.aluc := "b00101".U } // SLLI
        is("b101".U) {
          when(io.func7 === "b0000000".U) {
            io.aluc := "b01000".U // SRLI
          }.elsewhen(io.func7 === "b0100000".U) {
            io.aluc := "b01001".U // SRAI
          }
        }
      }
    }
    is("b0000011".U) { // Load指令
      io.write_reg := true.B
      io.read_mem := "b001".U
      io.rs2Data_EX_imm32_4 := "b01".U
      io.aluc := "b00000".U // ADD
    }
    is("b0100011".U) { // S型指令 (Store)
      io.write_mem := "b01".U
      io.rs2Data_EX_imm32_4 := "b01".U
      io.aluc := "b00000".U // ADD
    }
    is("b1100011".U) { // B型指令 (Branch)
      io.pcImm_NEXTPC_rs1Imm := "b01".U
      io.aluc := "b00001".U // SUB
      switch(io.func3) {
        is("b000".U) { io.aluOut_WB_memOut := true.B } // BEQ
        is("b001".U) { io.aluOut_WB_memOut := true.B } // BNE
        is("b100".U) { io.aluOut_WB_memOut := true.B } // BLT
        is("b101".U) { io.aluOut_WB_memOut := true.B } // BGE
      }
    }
    is("b1101111".U) { // J型指令 (JAL)
      io.pcImm_NEXTPC_rs1Imm := "b01".U
      io.write_reg := true.B
    }
    is("b1100111".U) { // I型指令 (JALR)
      io.pcImm_NEXTPC_rs1Imm := "b10".U
      io.write_reg := true.B
    }
    is("b0110111".U) { // U型指令 (LUI)
      io.write_reg := true.B
      io.extOP := "b001".U
    }
    is("b0010111".U) { // U型指令 (AUIPC)
      io.write_reg := true.B
      io.extOP := "b010".U
    }
  }
}

object Controller extends App {
  emitVerilog(new Controller(),Array("--target-dir","generate"))
}
