import chisel3._
import chisel3.util._

class Five_Stage_CPU extends Module {
  val io = IO(new Bundle {
        val pc                        = Output(UInt(32.W))         // Tester_PC信号
        val instr                     = Output(UInt(32.W))         // Tester_instr信号
        val aluOut                    = Output(UInt(32.W))         // Tester_aluOut信号
        val writeData                 = Output(UInt(32.W))         // Tester_writeData
  })

        // IF阶段
        val if_pc                     = Wire(UInt(32.W))
        val if_pc_add4                = Wire(UInt(32.W))
        val if_nextPC                 = Wire(UInt(32.W))
        val if_instruction            = Wire(UInt(32.W))

        // ID阶段
        val id_pc                     = Wire(UInt(32.W))
        val id_instruction            = Wire(UInt(32.W))
        val id_imm32                  = Wire(UInt(32.W))
        val id_rs1Data                = Wire(UInt(32.W))
        val id_rs2Data                = Wire(UInt(32.W))
        val id_rd_address             = Wire(UInt(5.W))
        val id_rs1_address            = Wire(UInt(5.W))
        val id_rs2_address            = Wire(UInt(5.W))
        val id_opcode                 = Wire(UInt(7.W))
        val id_func3                  = Wire(UInt(3.W))
        val id_func7                  = Wire(UInt(7.W))
        val id_alu_ctr                = Wire(UInt(5.W))
        val id_wb_aluOut_or_CacheOut  = Wire(Bool())
        val id_rs1Data_or_PC          = Wire(Bool())
        val id_rs2Data_or_imm32_or_4  = Wire(UInt(2.W))
        val id_write_valid            = Wire(Bool())
        val id_write_code             = Wire(UInt(2.W))
        val id_read_code              = Wire(UInt(3.W))
        val id_immediate_code         = Wire(UInt(3.W))
        val id_nextPC_pc_or_rs1       = Wire(UInt(2.W))

        // EX阶段
        val ex_alu_ctr                = Wire(UInt(5.W))
        val ex_wb_aluOut_or_CacheOut  = Wire(Bool())
        val ex_rs1Data_or_PC          = Wire(Bool())
        val ex_rs2Data_or_imm32_or_4  = Wire(UInt(2.W))
        val ex_write_valid            = Wire(Bool())
        val ex_write_code             = Wire(UInt(2.W))
        val ex_read_code              = Wire(UInt(3.W))
        val ex_nextPC_pc_or_rs1       = Wire(UInt(2.W))
        val ex_pc                     = Wire(UInt(32.W))
        val ex_rs1Data                = Wire(UInt(32.W))
        val ex_rs2Data                = Wire(UInt(32.W))
        val ex_is_rs1Data             = Wire(UInt(32.W))
        val ex_is_rs2Data             = Wire(UInt(32.W))
        val ex_imm32                  = Wire(UInt(32.W))
        val ex_rd_address             = Wire(UInt(5.W))
        val ex_rs1_address            = Wire(UInt(5.W))
        val ex_rs2_address            = Wire(UInt(5.W))
        val ex_is_AluA                = Wire(UInt(32.W))
        val ex_is_AluB                = Wire(UInt(32.W))
        val ex_AluOut                 = Wire(UInt(32.W))
        val ex_pcImm                  = Wire(UInt(32.W))
        val ex_rs1Imm                 = Wire(UInt(32.W))
        val ex_conditionBranch        = Wire(Bool())

        val forwardA                  = Wire(UInt(2.W))
        val forwardB                  = Wire(UInt(2.W))
        val forwardC                  = Wire(Bool())

        val pause                     = Wire(Bool())
        val flush                     = Wire(Bool())
        // val nextPC_pcImm_or_rs1Imm    = Wire(UInt(2.W))

        // ME阶段
        val me_WB_aluOut_or_memOut    = Wire(Bool())
        val me_write_valid            = Wire(Bool())
        val me_write_code             = Wire(UInt(2.W))
        val me_read_code              = Wire(UInt(3.W))
        val me_nextPC_pcImm_or_rs1Imm = Wire(UInt(2.W))
        val me_conditionBranch        = Wire(Bool())
        val me_pcImm                  = Wire(UInt(32.W))
        val me_rs1Imm                 = Wire(UInt(32.W))
        val me_AluOut                 = Wire(UInt(32.W))
        val me_rs2Data                = Wire(UInt(32.W))
        val me_rd_address             = Wire(UInt(5.W))
        val me_rs2_address            = Wire(UInt(5.W))
        val me_is_rs2Data             = Wire(UInt(32.W))
        val me_MemOut                 = Wire(UInt(32.W))

        // WB阶段
        val wb_aluOut_or_memOut       = Wire(Bool())
        val wb_write_valid            = Wire(Bool())
        val wb_MemOut                 = Wire(UInt(32.W))
        val wb_AluOut                 = Wire(UInt(32.W))
        val wb_rdData                 = Wire(UInt(32.W))
        val wb_rd_address             = Wire(UInt(5.W))

        // Next PC
        val nextPC = Module(new NextPC)
        nextPC.io.nextPC_pcImm_or_rs1Imm  :=  me_nextPC_pcImm_or_rs1Imm
        nextPC.io.condition_branch        :=  me_conditionBranch
        nextPC.io.pc                      :=  if_pc_add4
        nextPC.io.pcImm                   :=  me_pcImm
        nextPC.io.rs1Imm                  :=  me_rs1Imm
        if_nextPC                         :=  nextPC.io.next_pc
        flush                             :=  nextPC.io.flush

        // AddPC = pc+4
        val addPc = Module(new PC_Add4)
        addPc.io.pc_in                    := if_pc
        if_pc_add4                        := addPc.io.pc_out

        // PC
        val pc = Module(new PC)
        pc.io.pause                       := pause
        pc.io.next_pc                     := if_nextPC
        if_pc                             := pc.io.pc

        // Instruction Cache
        val instructionCache = Module(new Instruction_Cache)
        instructionCache.io.pc            := if_pc
        if_instruction                    := instructionCache.io.instruction

        // IF_to_ID Register
        val ifToId = Module(new IF_to_ID)
        ifToId.io.pause                   := pause
        ifToId.io.flush                   := flush
        ifToId.io.if_pc                   := if_pc
        ifToId.io.if_instruction          := if_instruction
        id_pc                             := ifToId.io.id_pc
        id_instruction                    := ifToId.io.id_instruction

        // ID Stage
        val id = Module(new Instruction_Decode)
        id.io.instruction                 := id_instruction
        id_opcode                         := id.io.opcode
        id_func3                          := id.io.func3
        id_func7                          := id.io.func7
        id_rd_address                     := id.io.rd_address
        id_rs1_address                    := id.io.rs1_address
        id_rs2_address                    := id.io.rs2_address

        val controller = Module(new Controller)
        controller.io.opcode              := id_opcode
        controller.io.func3               := id_func3
        controller.io.func7               := id_func7
        id_alu_ctr                        := controller.io.alu_ctr
        id_wb_aluOut_or_CacheOut          := controller.io.wb_aluOut_or_CacheOut
        id_rs1Data_or_PC                  := controller.io.alu1_rs1Data_or_PC
        id_rs2Data_or_imm32_or_4          := controller.io.alu2_rs2Data_or_imm32_or_4
        id_write_valid                    := controller.io.write_valid
        id_write_code                     := controller.io.write_code
        id_read_code                      := controller.io.read_code
        id_immediate_code                 := controller.io.immediate_code
        id_nextPC_pc_or_rs1               := controller.io.nextPC_pc_or_rs1

        val regBanks = Module(new Reg_Banks)
        regBanks.io.write_valid           := wb_write_valid
        regBanks.io.rs1_address           := id_rs1_address
        regBanks.io.rs2_address           := id_rs2_address
        regBanks.io.rd_address            := wb_rd_address
        regBanks.io.write_rd_data         := wb_rdData
        id_rs1Data                        := regBanks.io.read_rs1_data
        id_rs2Data                        := regBanks.io.read_rs2_data

        val immediateGenerator = Module(new Immediate_Generator)
        immediateGenerator.io.instruction     := id_instruction
        immediateGenerator.io.immediate_code  := id_immediate_code
        id_imm32                              := immediateGenerator.io.immediate_out

        val hazardDetectionUnit = Module(new Hazard_Detection_Unit)
        hazardDetectionUnit.io.EX_ReadCache   := ex_read_code
        hazardDetectionUnit.io.EX_rd_address  := ex_rd_address
        hazardDetectionUnit.io.EX_rs1_address := id_rs1_address
        hazardDetectionUnit.io.EX_rs2_address := id_rs2_address
        pause                                 := hazardDetectionUnit.io.pause

        // ID/EX Register
        val id_to_ex = Module(new ID_to_EX)
        id_to_ex.io.pause                     := pause
        id_to_ex.io.flush                     := flush
        id_to_ex.io.id_alu_ctr                := id_alu_ctr
        id_to_ex.io.id_wb_aluOut_or_CacheOut  := id_wb_aluOut_or_CacheOut
        id_to_ex.io.id_rs1Data_or_PC          := id_rs1Data_or_PC
        id_to_ex.io.id_rs2Data_or_imm32_or_4  := id_rs2Data_or_imm32_or_4
        id_to_ex.io.id_write_valid            := id_write_valid
        id_to_ex.io.id_write_code             := id_write_code
        id_to_ex.io.id_read_code              := id_read_code
        id_to_ex.io.id_nextPC_pc_or_rs1       := id_nextPC_pc_or_rs1
        id_to_ex.io.id_pc                     := id_pc
        id_to_ex.io.id_rs1Data                := id_rs1Data
        id_to_ex.io.id_rs2Data                := id_rs2Data
        id_to_ex.io.id_imm32                  := id_imm32
        id_to_ex.io.id_rd_address             := id_rd_address
        id_to_ex.io.id_rs1_address            := id_rs1_address
        id_to_ex.io.id_rs2_address            := id_rs2_address

        ex_alu_ctr                            := id_to_ex.io.ex_alu_ctr
        ex_wb_aluOut_or_CacheOut              := id_to_ex.io.ex_wb_aluOut_or_CacheOut
        ex_rs1Data_or_PC                      := id_to_ex.io.ex_rs1Data_or_PC
        ex_rs2Data_or_imm32_or_4              := id_to_ex.io.ex_rs2Data_or_imm32_or_4
        ex_write_valid                        := id_to_ex.io.ex_write_valid
        ex_write_code                         := id_to_ex.io.ex_write_code
        ex_read_code                          := id_to_ex.io.ex_read_code
        ex_nextPC_pc_or_rs1                   := id_to_ex.io.ex_nextPC_pc_or_rs1
        ex_pc                                 := id_to_ex.io.ex_pc
        ex_rs1Data                            := id_to_ex.io.ex_rs1Data
        ex_rs2Data                            := id_to_ex.io.ex_rs2Data
        ex_imm32                              := id_to_ex.io.ex_imm32
        ex_rd_address                         := id_to_ex.io.ex_rd_address
        ex_rs1_address                        := id_to_ex.io.ex_rs1_address
        ex_rs2_address                        := id_to_ex.io.ex_rs2_address

        // EX Stage
        val muxForwardA = Module(new Mux3)
        muxForwardA.io.signal                 := forwardA
        muxForwardA.io.a                      := ex_rs1Data
        muxForwardA.io.b                      := me_AluOut
        muxForwardA.io.c                      := wb_rdData
        ex_is_rs1Data                         := muxForwardA.io.out

        val muxForwardB = Module(new Mux3)
        muxForwardB.io.signal                 := forwardB
        muxForwardB.io.a                      := ex_rs2Data
        muxForwardB.io.b                      := me_AluOut
        muxForwardB.io.c                      := wb_rdData
        ex_is_rs2Data                         := muxForwardB.io.out

        val muxExA = Module(new Mux2)
        muxExA.io.signal                      := ex_rs1Data_or_PC
        muxExA.io.a                           := ex_is_rs1Data
        muxExA.io.b                           := ex_pc
        ex_is_AluA                            := muxExA.io.out

        val muxExB = Module(new Mux3)
        muxExB.io.signal                      := ex_rs2Data_or_imm32_or_4
        muxExB.io.a                           := ex_is_rs2Data
        muxExB.io.b                           := ex_imm32
        muxExB.io.c                           := 4.U
        ex_is_AluB                            := muxExB.io.out

        val pcAdd = Module(new PC_Add)
        pcAdd.io.pc                           := ex_pc
        pcAdd.io.imm32                        := ex_imm32
        pcAdd.io.rs1Data                      := ex_is_rs1Data
        ex_pcImm                              := pcAdd.io.pcImm
        ex_rs1Imm                             := pcAdd.io.rs1Imm

        val alu = Module(new ALU)
        alu.io.alu_ctr                        := ex_alu_ctr
        alu.io.a                              := ex_is_AluA
        alu.io.b                              := ex_is_AluB
        ex_AluOut                             := alu.io.out
        ex_conditionBranch                    := alu.io.condition_branch

        val forwardUnit = Module(new ForwardUnit)
        forwardUnit.io.me_write_valid         := me_write_valid
        forwardUnit.io.me_rd_address          := me_rd_address
        forwardUnit.io.wb_rd_address          := wb_rd_address
        forwardUnit.io.wb_write_valid         := wb_write_valid
        forwardUnit.io.ex_rs1_address         := ex_rs1_address
        forwardUnit.io.ex_rs2_address         := ex_rs2_address
        forwardUnit.io.me_rs2_address         := me_rs2_address
        forwardA                              := forwardUnit.io.ex_forwardA
        forwardB                              := forwardUnit.io.ex_forwardB
        forwardC                              := forwardUnit.io.me_forwardC

        // EX/ME Register
        val ex_to_me = Module(new EX_to_ME)
        ex_to_me.io.flush                     := flush
        ex_to_me.io.ex_wb_aluOut_or_CacheOut  := ex_wb_aluOut_or_CacheOut
        ex_to_me.io.ex_write_valid            := ex_write_valid
        ex_to_me.io.ex_write_code             := ex_write_code
        ex_to_me.io.ex_read_code              := ex_read_code
        ex_to_me.io.ex_nextPC_pc_or_rs1       := ex_nextPC_pc_or_rs1
        ex_to_me.io.ex_conditionBranch        := ex_conditionBranch
        ex_to_me.io.ex_pcImm                  := ex_pcImm
        ex_to_me.io.ex_rs1Imm                 := ex_rs1Imm
        ex_to_me.io.ex_AluOut                 := ex_AluOut
        ex_to_me.io.ex_rs2Data                := ex_is_rs2Data
        ex_to_me.io.ex_rd_address             := ex_rd_address
        ex_to_me.io.ex_rs2_address            := ex_rs2_address
        me_WB_aluOut_or_memOut                := ex_to_me.io.me_WB_aluOut_or_memOut
        me_write_valid                        := ex_to_me.io.me_write_valid
        me_write_code                         := ex_to_me.io.me_write_code
        me_read_code                          := ex_to_me.io.me_read_code
        me_nextPC_pcImm_or_rs1Imm             := ex_to_me.io.me_nextPC_pcImm_or_rs1Imm
        me_conditionBranch                    := ex_to_me.io.me_conditionBranch
        me_pcImm                              := ex_to_me.io.me_pcImm
        me_rs1Imm                             := ex_to_me.io.me_rs1Imm
        me_AluOut                             := ex_to_me.io.me_AluOut
        me_rs2Data                            := ex_to_me.io.me_rs2Data
        me_rd_address                         := ex_to_me.io.me_rd_address
        me_rs2_address                        := ex_to_me.io.me_rs2_address

        // MEM Stage
        val muxWBData = Module(new Mux2)
        muxWBData.io.signal                   := forwardC
        muxWBData.io.a                        := me_rs2Data
        muxWBData.io.b                        := wb_rdData
        me_is_rs2Data                         := muxWBData.io.out

        val datacache = Module(new Data_Cache)
        datacache.io.address                  := me_AluOut
        datacache.io.write_data               := me_is_rs2Data
        datacache.io.write_code               := me_write_code
        datacache.io.read_code                := me_read_code
        me_MemOut                             := datacache.io.out_data

        // ME/WB Register
        val me_to_wb = Module(new ME_to_WB)
        me_to_wb.io.me_WB_aluOut_or_memOut    := me_WB_aluOut_or_memOut
        me_to_wb.io.me_write_valid            := me_write_valid
        me_to_wb.io.me_MemOut                 := me_MemOut
        me_to_wb.io.me_AluOut                 := me_AluOut
        me_to_wb.io.me_rd_address             := me_rd_address
        wb_aluOut_or_memOut                   := me_to_wb.io.wb_aluOut_or_memOut
        wb_write_valid                        := me_to_wb.io.wb_write_valid
        wb_MemOut                             := me_to_wb.io.wb_MemOut
        wb_AluOut                             := me_to_wb.io.wb_AluOut
        wb_rd_address                         := me_to_wb.io.wb_rd_address

        // WB Stage
        val muxWB = Module(new Mux2)
        muxWB.io.signal                       := wb_aluOut_or_memOut
        muxWB.io.a                            := wb_AluOut
        muxWB.io.b                            := wb_MemOut
        wb_rdData                             := muxWB.io.out

        // 将PC模块的pc信号连接到CPU模块的io接口
        io.pc                                 := pc.io.pc
        io.instr                              := instructionCache.io.instruction
        io.aluOut                             := alu.io.out
        io.writeData                          := regBanks.io.write_rd_data
}

object Five_Stage_CPU extends App {
  emitVerilog(new Five_Stage_CPU(),Array("--target-dir","generate"))
}
