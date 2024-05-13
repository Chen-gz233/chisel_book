import chisel3._
import chisel3.util._


//具备默认值的参数的Option
//当对象或函数有很多参数的时候，每次都指定全部显然是又麻烦又易错。
//在很前面，我们介绍了命名参数和参数默认值。有的时候，参数并没有一个好的默认值。
//Option可以和默认值None一起使用在这些场合。

class DelayBy1(resetValue: Option[UInt] = None) extends Module {
  val io = IO(new Bundle {
    val in  = Input( UInt(16.W))
    val out = Output(UInt(16.W))
  })
  val reg = if (resetValue.isDefined) { // resetValue = Some(number)
    RegInit(resetValue.get)
  } else { //resetValue = None
  //如果resetValue = None，即默认值，寄存器将会无法得到复位值并被初始化为辣鸡值。
    Reg(UInt())
  }
  reg := io.in
  io.out := reg
}

object MyModule extends App {
//两者的区别在于，前者未对reset信号进行相应，而后者在时钟上升沿收到reset信号后，将寄存器的值复位为16'h3。
  println(getVerilogString(new DelayBy1))
  println(getVerilogString(new DelayBy1(Some(3.U))))
}
