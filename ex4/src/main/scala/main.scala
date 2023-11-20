import chisel3._
import chisel3.util._

class mux4_1 extends  Module{
    val io = IO(new Bundle{
       val in_a = Input(UInt(4.W))
       val in_sel = Input(UInt(2.W)) 
       val out = Output(UInt(1.W))

    })
 
    when (io.in_sel ===0.U){
        io.out := io.in_a(0)
    }.elsewhen(io.in_sel ===1.U){
        io.out := io.in_a(1)
    }.elsewhen(io.in_sel ===2.U){
        io.out := io.in_a(2)
    }.elsewhen(io.in_sel ===3.U){
        io.out := io.in_a(3)
    }.otherwise{
       io.out := io.in_a(0)
    }
}
//io.out <= mux(_T, _io_out_T, 
//          mux(_T_1, _io_out_T_1,
//          mux(_T_2, _io_out_T_2, 
//          mux(_T_3, _io_out_T_3,
//                   VOID))))
object myModule extends App{
    emitVerilog (new mux4_1(),Array("--target-dir","generate") )
}