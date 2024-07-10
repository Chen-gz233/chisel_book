import chisel3._
import chisel3.util._

class CPU extends Module {
  val io = IO(new Bundle {
    val pc = Output(UInt(32.W))         // Tester_PC信号
    val instr = Output(UInt(32.W))      // Tester_instr信号
    val aluOut = Output(UInt(32.W))     // Tester_aluOut信号
    val writeData = Output(UInt(32.W))  // Tester_writeData
  })

  // 子模块实例化
  val pc = Module(new PC) 
  val instruction_cache = Module(new Instruction_Cache)
  val instruction_decode = Module(new Instruction_Decode)
  val controller = Module(new Controller)
  val immediate_generator = Module(new Immediate_Generator)
  val reg_banks = Module(new Reg_Banks)
  val mux_wb = Module(new Mux2)
  val mux_alu2 = Module(new Mux3)
  val mux_alu1 = Module(new Mux2)
  val alu = Module(new ALU)
  val data_dache = Module(new Data_Cache)
  val nextPC = Module(new NextPC)

  // PC 模块连接
  pc.io.next_pc := nextPC.io.next_pc

  // Instruction Cache 连接
  instruction_cache.io.pc := pc.io.pc

  // Instruction Decode 连接
  instruction_decode.io.instruction := instruction_cache.io.instruction

  // Controller 连接
  controller.io.opcode := instruction_decode.io.opcode
  controller.io.func3 := instruction_decode.io.func3
  controller.io.func7 := instruction_decode.io.func7

  // Immediate Generator 连接
  immediate_generator.io.instruction := instruction_cache.io.instruction
  immediate_generator.io.immediate_code := controller.io.immediate_code

  // Register Banks 连接
  reg_banks.io.write_valid := controller.io.write_valid
  reg_banks.io.rs1_address := instruction_decode.io.rs1_address
  reg_banks.io.rs2_address := instruction_decode.io.rs2_address
  reg_banks.io.rd_address := instruction_decode.io.rd_address
  reg_banks.io.write_rd_data := mux_wb.io.out

  // ALU 输入多路选择器 连接
  mux_alu1.io.signal := controller.io.alu1_rs1Data_or_PC
  mux_alu1.io.a := reg_banks.io.read_rs1_data
  mux_alu1.io.b := pc.io.pc

  mux_alu2.io.signal := controller.io.alu1_rs1Data_or_PC
  mux_alu2.io.a := reg_banks.io.read_rs2_data
  mux_alu2.io.b := immediate_generator.io.immediate_32
  mux_alu2.io.c := 4.U

  // ALU 连接
  alu.io.alu_code := controller.io.alu_code
  alu.io.a := mux_alu1.io.out
  alu.io.b := mux_alu2.io.out

  // Data Cache 连接
  data_dache.io.address := alu.io.out
  data_dache.io.write_data := reg_banks.io.read_rs2_data
  data_dache.io.write_code := controller.io.write_code
  data_dache.io.read_code := controller.io.read_code

  // Write Back 多路选择器 连接
  mux_wb.io.signal := controller.io.wb_aluOut_or_CacheOut
  mux_wb.io.a := alu.io.out
  mux_wb.io.b := data_dache.io.out_data

  // Next PC 模块连接
  nextPC.io.nextPC_pc_or_rs1 := controller.io.nextPC_pc_or_rs1
  nextPC.io.condition_branch := alu.io.condition_branch
  nextPC.io.pc := pc.io.pc
  nextPC.io.offset := immediate_generator.io.immediate_32
  nextPC.io.rs1Data := reg_banks.io.read_rs1_data

  // 将PC模块的pc信号连接到CPU模块的io接口
  io.pc := pc.io.pc
  io.instr := instruction_cache.io.instruction
  io.aluOut := alu.io.out
  io.writeData := reg_banks.io.write_rd_data
}

object CPU extends App {
  emitVerilog(new CPU(),Array("--target-dir","generate"))
}
