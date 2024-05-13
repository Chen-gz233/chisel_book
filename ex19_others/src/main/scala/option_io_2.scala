import chisel3._
import chisel3.util._

//有零宽网线的可选IO        Chisel类型允许零宽
//对于Option另一种实现类似功能的方法是零宽度的网线（zero-width wire） 
//一个零宽的IO接口会从生成的Verilog代码中修剪掉，所有尝试使用零宽值的都会得到一个常数0。
//如果0是有意义的默认值，那用零宽网线就很好，因为消除了匹配选项或调用getOrElse的需要。
class HalfFullAdder_2(val hasCarry: Boolean) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val carryIn = Input(if (hasCarry) UInt(1.W) else UInt(0.W))
    val s = Output(UInt(1.W))
    val carryOut = Output(UInt(1.W))
  })
  val sum = io.a +& io.b +& io.carryIn
  io.s := sum(0)
  io.carryOut := sum(1)
}

object MyModule extends App {
  println("// Half Adder:")
  println(getVerilogString(new HalfFullAdder(false)))
  println("\n\n// Full Adder:")
  println(getVerilogString(new HalfFullAdder(true)))
}
