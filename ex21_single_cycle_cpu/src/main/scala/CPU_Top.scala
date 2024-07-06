import chisel3._
import chisel3.util._

class CPU extends Module {
  val io = IO(new Bundle {
    val clk = Input(Clock()) // 时钟信号
    val rst = Input(Bool())  // 复位信号
  })

  // 子模块实例化
  val pc = Module(new PC)
  val instructionMem = Module(new InstructionMem)
  val id = Module(new ID)
  val controller = Module(new Controller)
  val imm = Module(new IMM)
  val regFile = Module(new RegFile)
  val muxWB = Module(new Mux2)
  val muxEXB = Module(new Mux3)
  val muxEXA = Module(new Mux2)
  val alu = Module(new ALU)
  val dataMem = Module(new DataMem)
  val nextPC = Module(new NextPC)

  // PC 模块连接
  pc.io.rst := io.rst
  pc.io.clk := io.clk
  pc.io.next_pc := nextPC.io.next_pc

  // Instruction Memory 连接
  instructionMem.io.pc := pc.io.pc

  // Instruction Decode 连接
  id.io.instr := instructionMem.io.instruction

  // Controller 连接
  controller.io.opcode := id.io.opcode
  controller.io.func3 := id.io.func3
  controller.io.func7 := id.io.func7

  // Immediate Generator 连接
  imm.io.instr := instructionMem.io.instruction
  imm.io.extOP := controller.io.extOP

  // Register File 连接
  regFile.io.rst := io.rst
  regFile.io.clk := io.clk
  regFile.io.write_reg := controller.io.write_reg
  regFile.io.rs1 := id.io.rs1
  regFile.io.rs2 := id.io.rs2
  regFile.io.target_reg := id.io.rd
  regFile.io.write_rd_data := muxWB.io.out

  // ALU 输入多路选择器 连接
  muxEXA.io.signal := controller.io.rs1Data_EX_PC
  muxEXA.io.a := regFile.io.read_rs1_data
  muxEXA.io.b := pc.io.pc

  muxEXB.io.signal := controller.io.rs2Data_EX_imm32_4
  muxEXB.io.a := regFile.io.read_rs2_data
  muxEXB.io.b := imm.io.imm_32
  muxEXB.io.c := 4.U

  // ALU 连接
  alu.io.aluc := controller.io.aluc
  alu.io.a := muxEXA.io.out
  alu.io.b := muxEXB.io.out

  // Data Memory 连接
  dataMem.io.clk := io.clk
  dataMem.io.rst := io.rst
  dataMem.io.address := alu.io.out
  dataMem.io.write_data := regFile.io.read_rs2_data
  dataMem.io.write_mem := controller.io.write_mem
  dataMem.io.read_mem := controller.io.read_mem

  // Write Back 多路选择器 连接
  muxWB.io.signal := controller.io.aluOut_WB_memOut
  muxWB.io.a := alu.io.out
  muxWB.io.b := dataMem.io.out_mem

  // Next PC 模块连接
  nextPC.io.pcImm_NEXTPC_rs1Imm := controller.io.pcImm_NEXTPC_rs1Imm
  nextPC.io.condition_branch := alu.io.condition_branch
  nextPC.io.pc := pc.io.pc
  nextPC.io.offset := imm.io.imm_32
  nextPC.io.rs1Data := regFile.io.read_rs1_data
}

object CPU extends App {
  emitVerilog(new CPU(),Array("--target-dir","generate"))
}
