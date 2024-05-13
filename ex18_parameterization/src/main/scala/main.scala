import chisel3._
import chisel3.util._


class ParameterizedWidthAdder(in0Width: Int, in1Width: Int, sumWidth: Int) extends Module {
  require(in0Width >= 0)
  require(in1Width >= 0)
  require(sumWidth >= 0)
  //是预展开的断言，在希望生成器只在一定的参数化或一些参数化互斥或无意义时很有用。
  //上面的代码就检查了宽度应该是非负数。
  //在仿真时有单独的断言构造，为assert(...)。
  val io = IO(new Bundle {
    val in0 = Input(UInt(in0Width.W))
    val in1 = Input(UInt(in1Width.W))
    val sum = Output(UInt(sumWidth.W))
  })
  // a +& b includes the carry, a + b does not
  io.sum := io.in0 +& io.in1
}

object MyModule extends App {
    emitVerilog (new ParameterizedWidthAdder(1, 4, 6),Array("--target-dir","generate") )
}
