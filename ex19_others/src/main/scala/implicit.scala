/* 
`隐式
编程的时候经常会需要很多样板代码。
为了处理这种使用情况，Scala引入了implicit这个关键词，允许编译器用一些语法糖。
因为很多事发生在一幕之后，隐式可以表现得很有魔力。
这一节有一些基本的例子来解释他们是什么东西，通常什么时候会用到。

`隐式参数
有时候你的代码需要从一系列很深的调用中以某种顺序访问一个顶层变量。
不用手动让这个变量穿过每个函数调用，你可以使用隐式参数来完成这件事。

object CatDog {
  implicit val numberOfCats: Int = 3
  //implicit val numberOfDogs: Int = 5

  def tooManyCats(nDogs: Int)(implicit nCats: Int): Boolean = nCats > nDogs
    
  val imp = tooManyCats(2)    // Argument passed implicitly!
  val exp = tooManyCats(2)(1) // Argument passed explicitly!
}
CatDog.imp  //res16_1: Boolean = true
CatDog.exp  //res16_2: Boolean = false



有两种情况使用隐式参数会失败：

1. 范围内定义了两个及以上给定类型的隐式值；
2. 编译器找不到函数调用必须的那个隐式值；
*/

import chisel3._
import chisel3.util._


object MyModule extends App {
  sealed trait Verbosity
  implicit case object Silent extends Verbosity
  case object Verbose extends Verbosity

  class ParameterizedWidthAdder(in0Width: Int, in1Width: Int, sumWidth: Int)(implicit verbosity: Verbosity)
  extends Module {
    def log(msg: => String): Unit = verbosity match {
      case Silent =>
      case Verbose => println(msg)
    }
    require(in0Width >= 0)
    log(s"// in0Width of $in0Width OK")
    require(in1Width >= 0)
    log(s"// in1Width of $in1Width OK")
    require(sumWidth >= 0)
    log(s"// sumWidth of $sumWidth OK")
    val io = IO(new Bundle {
      val in0 = Input(UInt(in0Width.W))
      val in1 = Input(UInt(in1Width.W))
      val sum = Output(UInt(sumWidth.W))
    })
    log("// Made IO")
    io.sum := io.in0 + io.in1
    log("// Assigned output")
  }
  println(getVerilogString(new ParameterizedWidthAdder(1, 4, 5)))
  println(getVerilogString(new ParameterizedWidthAdder(1, 4, 5)(Verbose)))
}

