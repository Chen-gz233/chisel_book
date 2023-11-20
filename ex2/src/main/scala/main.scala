
import chisel3._
import chisel3.util._

class Mymodule extends Module {
    val io = IO(new Bundle{
        val in_1 = Input(UInt(4.W))
        val in_2 = Input(UInt(4.W))
        val sel  = Input(Bool())

        val out_mux = Output(UInt(4.W))
        val out_cat = Output(UInt(8.W))
    })
        io.out_mux := Mux(io.sel , io.in_1 , io.in_2)
        io.out_cat := Cat(io.in_1 , io.in_2)
        

}

object myModule extends App{
    emitVerilog(new Mymodule(),Array("--target-dir","generated"))
}