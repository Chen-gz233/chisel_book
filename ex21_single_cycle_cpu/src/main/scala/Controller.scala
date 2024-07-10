import chisel3._
import chisel3.util._

class Controller extends Module {
  val io = IO(new Bundle {
    val opcode               = Input(UInt(7.W))
    val func3                = Input(UInt(3.W))
    val func7                = Input(UInt(7.W))

    val alu_code                     = Output(UInt(5.W))  // ALU Control
    val wb_aluOut_or_CacheOut        = Output(Bool())     //Write Back  alu or cache
    val alu1_rs1Data_or_PC           = Output(Bool())     //ALU 选择操作第一个数 rs1 or pc
    val alu2_rs2Data_or_imm32_or_4   = Output(UInt(2.W))  //ALU 选择操作第二个数 rs1 or 立即数 or 4
    val write_valid                  = Output(Bool())
    val write_code                   = Output(UInt(2.W))
    val read_code                    = Output(UInt(3.W))
    val immediate_code               = Output(UInt(3.W))  //立即数扩展操作信号 (生成的立即数类型（I型、S型、B型、U型或J型）)
    val nextPC_pc_or_rs1       = Output(UInt(2.W))  //下一条指令地址 (pc + 4、pc + 偏移量、rs1 + 偏移量)
  })

  // 默认值设置为0
  io.alu_code := 0.U
  io.wb_aluOut_or_CacheOut := false.B
  io.alu1_rs1Data_or_PC := false.B
  io.alu2_rs2Data_or_imm32_or_4 := 0.U
  io.write_valid := false.B
  io.write_code := 0.U
  io.read_code := 0.U
  io.immediate_code := 0.U
  io.nextPC_pc_or_rs1 := 0.U

  // 根据opcode和func3, func7解码生成控制信号
  switch(io.opcode) {
    is("b0110011".U) { // R型指令
      io.write_valid := true.B
      io.alu2_rs2Data_or_imm32_or_4 := "b00".U
      switch(io.func3) {
        is("b000".U) {
          when(io.func7 === "b0000000".U) {
            io.alu_code := "b00000".U // ADD
          }.elsewhen(io.func7 === "b0100000".U) {
            io.alu_code := "b00001".U // SUB
          }
        }
        is("b111".U) { io.alu_code := "b00010".U } // AND
        is("b110".U) { io.alu_code := "b00011".U } // OR
        is("b100".U) { io.alu_code := "b00100".U } // XOR
        is("b001".U) { io.alu_code := "b00101".U } // SLL
        is("b101".U) {
          when(io.func7 === "b0000000".U) {
            io.alu_code := "b01000".U // SRL
          }.elsewhen(io.func7 === "b0100000".U) {
            io.alu_code := "b01001".U // SRA
          }
        }
      }
    }
    is("b0010011".U) { // I型指令
      io.write_valid := true.B
      io.alu2_rs2Data_or_imm32_or_4 := "b01".U
      switch(io.func3) {
        is("b000".U) { io.alu_code := "b00000".U } // ADDI
        is("b111".U) { io.alu_code := "b00010".U } // ANDI
        is("b110".U) { io.alu_code := "b00011".U } // ORI
        is("b100".U) { io.alu_code := "b00100".U } // XORI
        is("b001".U) { io.alu_code := "b00101".U } // SLLI
        is("b101".U) {
          when(io.func7 === "b0000000".U) {
            io.alu_code := "b01000".U // SRLI
          }.elsewhen(io.func7 === "b0100000".U) {
            io.alu_code := "b01001".U // SRAI
          }
        }
      }
    }
    is("b0000011".U) { // Load指令
      io.write_valid := true.B
      io.read_code := "b001".U
      io.alu2_rs2Data_or_imm32_or_4 := "b01".U
      io.alu_code := "b00000".U // ADD
    }
    is("b0100011".U) { // S型指令 (Store)
      io.write_code := "b01".U
      io.alu2_rs2Data_or_imm32_or_4 := "b01".U
      io.alu_code := "b00000".U // ADD
    }
    is("b1100011".U) { // B型指令 (Branch)
      io.nextPC_pc_or_rs1 := "b01".U
      io.alu_code := "b00001".U // SUB
      switch(io.func3) {
        is("b000".U) { io.wb_aluOut_or_CacheOut := true.B } // BEQ
        is("b001".U) { io.wb_aluOut_or_CacheOut := true.B } // BNE
        is("b100".U) { io.wb_aluOut_or_CacheOut := true.B } // BLT
        is("b101".U) { io.wb_aluOut_or_CacheOut := true.B } // BGE
      }
    }
    is("b1101111".U) { // J型指令 (JAL)
      io.nextPC_pc_or_rs1 := "b01".U
      io.write_valid := true.B
    }
    is("b1100111".U) { // I型指令 (JALR)
      io.nextPC_pc_or_rs1 := "b10".U
      io.write_valid := true.B
    }
    is("b0110111".U) { // U型指令 (LUI)
      io.write_valid := true.B
      io.immediate_code := "b001".U
    }
    is("b0010111".U) { // U型指令 (AUIPC)
      io.write_valid := true.B
      io.immediate_code := "b010".U
    }
  }
}

object Controller extends App {
  emitVerilog(new Controller(),Array("--target-dir","generate"))
}
