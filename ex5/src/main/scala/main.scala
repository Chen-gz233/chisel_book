import chisel3._
import chisel3.util._

class FuncModule extends Module{
    def adder(add_a:UInt , add_b:UInt):UInt = {
        add_a +& add_b
    }
    val io = IO(new Bundle{
        val a = Input(UInt(4.W))
        val b = Input(UInt(4.W))
        val out = Output(UInt(8.W))

    })
    val add_out = adder(io.a,io.b)
    io.out := add_out

}

object MyFuncModule extends App{
    emitVerilog (new FuncModule(),Array("--target-dir","generate"))
}