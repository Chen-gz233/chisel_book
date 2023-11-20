
import chisel3._
import chisel3.util._

class Mymodule extends Module {
    val io = IO(new Bundle{
        val in_1 = Input(UInt(4.W))
        val in_2 = Input(UInt(4.W))
        val out_add = Output(UInt(4.W))
        val out_sub = Output(UInt(4.W))
        val out_mul =Output(UInt(4.W)) 
    })
        io.out_add := io.in_1 + io.in_2
        io.out_sub := io.in_1 - io.in_2
        io.out_mul := io.in_1 * io.in_2 

}

object myModuletest extends App{
    emitVerilog(new Mymodule(),Array("--target-dir","generated"))
}