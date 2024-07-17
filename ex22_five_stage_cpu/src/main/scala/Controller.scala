import chisel3._
import chisel3.util._

class Controller extends Module {
  val io = IO(new Bundle {
    val opcode               = Input(UInt(7.W))
    val func3                = Input(UInt(3.W))
    val func7                = Input(UInt(7.W))

    val alu_ctr                      = Output(UInt(5.W))  // ALU Control
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
  io.alu_ctr := 0.U
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
    is("b0110111".U) { // lui
      io.write_valid := true.B
      io.alu2_rs2Data_or_imm32_or_4 := 1.U
      io.alu_ctr := 0.U
      io.immediate_code := 1.U
    }
    is("b0010111".U) { // auipc
      io.write_valid := true.B
      io.alu1_rs1Data_or_PC := true.B
      io.alu2_rs2Data_or_imm32_or_4 := 1.U
      io.alu_ctr := 0.U
      io.immediate_code := 1.U
    }
    is("b1101111".U) { // jal
      io.write_valid := true.B
      io.alu1_rs1Data_or_PC := true.B
      io.alu2_rs2Data_or_imm32_or_4 := 3.U
      io.alu_ctr := 0.U
      io.nextPC_pc_or_rs1 := 1.U
      io.immediate_code := 4.U
    }
    is("b1100111".U) { // jalr
      io.write_valid := true.B
      io.alu1_rs1Data_or_PC := true.B
      io.alu2_rs2Data_or_imm32_or_4 := 3.U
      io.alu_ctr := "b01010".U
      io.nextPC_pc_or_rs1 := 2.U
    }
    is("b1100011".U) { // B-type
      io.immediate_code := 3.U
      switch(io.func3) {
        is("b000".U) { io.alu_ctr := "b01011".U } // beq
        is("b001".U) { io.alu_ctr := "b01100".U } // bne
        is("b100".U) { io.alu_ctr := "b01101".U } // blt
        is("b101".U) { io.alu_ctr := "b01110".U } // bge
        is("b110".U) { io.alu_ctr := "b01111".U } // bltu
        is("b111".U) { io.alu_ctr := "b10000".U } // bgeu
      }
    }
    is("b0000011".U) { // L-type
      io.write_valid := true.B
      io.wb_aluOut_or_CacheOut := true.B
      io.alu2_rs2Data_or_imm32_or_4 := 1.U
      io.alu_ctr := 0.U
      switch(io.func3) {
        is("b010".U) { io.write_code := "b001".U } // lw
        is("b001".U) { io.write_code := "b110".U } // lh
        is("b000".U) { io.write_code := "b111".U } // lb
        is("b100".U) { io.write_code := "b011".U } // lbu
        is("b101".U) { io.write_code := "b010".U } // lhu
      }
    }
    is("b0100011".U) { // S-type
      io.alu2_rs2Data_or_imm32_or_4 := 1.U
      io.alu_ctr := 0.U
      io.immediate_code := 2.U
      switch(io.func3) {
        is("b010".U) { io.write_code := "b01".U } // sw
        is("b001".U) { io.write_code := "b10".U } // sh
        is("b000".U) { io.write_code := "b11".U } // sb
      }
    }
    is("b0010011".U) { // I-type
      io.write_valid := true.B
      io.alu2_rs2Data_or_imm32_or_4 := 1.U
      switch(io.func3) {
        is("b000".U) { io.alu_ctr := "b00000".U } // addi
        is("b010".U) { io.alu_ctr := "b00110".U } // slti
        is("b011".U) { io.alu_ctr := "b00111".U } // sltiu
        is("b100".U) { io.alu_ctr := "b00100".U } // xori
        is("b110".U) { io.alu_ctr := "b00011".U } // ori
        is("b111".U) { io.alu_ctr := "b00010".U } // andi
        is("b001".U) { io.alu_ctr := "b00101".U } // slli
        is("b101".U) {
          when(io.func7(5)) { io.alu_ctr := "b01001".U }
          .otherwise { io.alu_ctr := "b01000".U }
        } // srli, srai
      }
    }
    is("b0110011".U) { // R-type
      io.write_valid := true.B
      io.immediate_code := 7.U
      switch(io.func3) {
        is("b000".U) {
          when(io.func7(5)) { io.alu_ctr := "b00001".U }
          .otherwise { io.alu_ctr := "b00000".U }
        } // sub, add
        is("b110".U) { io.alu_ctr := "b00011".U } // or
        is("b111".U) { io.alu_ctr := "b00010".U } // and
        is("b100".U) { io.alu_ctr := "b00100".U } // xor
        is("b001".U) { io.alu_ctr := "b00101".U } // sll
        is("b010".U) { io.alu_ctr := "b00110".U } // slt
        is("b011".U) { io.alu_ctr := "b00111".U } // sltu
        is("b101".U) {
          when(io.func7(5)) { io.alu_ctr := "b01001".U }
          .otherwise { io.alu_ctr := "b01000".U }
        } // srl, sra
      }
    }
}
}

object Controller extends App {
  emitVerilog(new Controller(),Array("--target-dir","generate"))
}
