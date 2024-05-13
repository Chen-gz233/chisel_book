import chisel3._
import chisel3.util._

//有可选字段的IO 
//有时候我们会希望IO接口可选地被包含或排外。
//也许有一些内置语句可以在调试的时候很好用，但是你希望在生成器用于系统的时候隐藏它们。
//也许你的生成器有一些输入不需要在每种场合都连接，因为有一个有意义的默认值。
class HalfFullAdder(val hasCarry: Boolean) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    //io.carryIn会有Some[UInt]类型并包括在IO中
    //如果进位输入接口不被包含，io.carryIn会有None类型并从IO中排除
    val carryIn = if (hasCarry) Some(Input(UInt(1.W))) else None
    val s = Output(UInt(1.W))
    val carryOut = Output(UInt(1.W))
  })
  val sum = io.a +& io.b +& io.carryIn.getOrElse(0.U)
  io.s := sum(0)
  io.carryOut := sum(1)
}

object MyHalfFullAdder extends App {
    emitVerilog (new HalfFullAdder(false),Array("--target-dir","generate") )
}
