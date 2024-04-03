https://blog.csdn.net/qq_39507748/article/details/118219777

# 一、chisel的printf 基本介绍
Chisel提供了一个“ printf ”函数来打印信息，用于电路调试。它有Scala和C两种风格。如果在when语句块里，只有条件成立时才运行。隐式的全局复位信号有效时也不会触发。

**printf函数会转换成Verilog的系统函数“$fwrite”**，包含在宏定义块“ ifndef SYNTHESIS...... endif ”里。通过Verilog的宏定义，可以取消这部分**不可综合**的代码。

## Ⅰ、Scala风格
该风格类似于Scala的字符串插值器。**Chisel自定义了一个p插值器，该插值器可以对字符串内的一些自定义表达式进行求值、Chiel类型转化成字符串类型等**。

### ①简单格式，Binary、Decimal、Hexadecimal、Character可以将Bits类型的数据转换成想要的格式，这在调试时很有用。

```
val myUInt = 33.U
// 显示Chisel自定义的类型的数据
printf(p"myUInt = $myUInt") // myUInt = 33 默认是十进制
//printf(p"myUInt = ${Decimal(myUInt)}") // myUInt = 33 
// 显示成十六进制
printf(p"myUInt = 0x${Hexadecimal(myUInt)}") // myUInt = 0x21
// 显示成二进制
printf(p"myUInt = ${Binary(myUInt)}") // myUInt = 100001
// 显示成字符(ASCⅡ码)
printf(p"myUInt = ${Character(myUInt)}") // myUInt = !


```

### ②聚合数据类型

```
val myVec = VecInit(5.U, 10.U, 13.U)
printf(p"myVec = $myVec") // myVec = Vec(5, 10, 13)

val myBundle = Wire(new Bundle {
    val foo = UInt()
    val bar = UInt()
})
myBundle.foo := 3.U
myBundle.bar := 11.U
printf(p"myBundle = $myBundle") // myBundle = Bundle(a -> 3, b -> 11)

```

### ③自定义打印信息
对于自定义的Bundle类型，可以重写toPrintable方法来定制打印内容。当自定义的Bundle配合其他硬件类型例如Wire构成具体的硬件，并且被赋值后，可以用p插值器来求值该硬件，此时就会调用重写的toPrintable方法。例如：

```class Message extends Bundle {
  val valid = Bool()
  val addr = UInt(32.W)
  val length = UInt(4.W)
  val data = UInt(64.W)
  override def toPrintable: Printable = {
      val char = Mux(valid, 'v'.U, '-'.U)
      p"Message:\n" +
      p"  valid  : ${Character(char)}\n" +
      p"  addr   : 0x${Hexadecimal(addr)}\n" +
      p"  length : $length\n" +
      p"  data   : 0x${Hexadecimal(data)}\n"
  }
}

val myMessage = Wire(new Message)
myMessage.valid := true.B
myMessage.addr := "h1234".U
myMessage.length := 10.U
myMessage.data := "hdeadbeef".U

printf(p"$myMessage")


```

## Ⅱ、C风格
```
val myUInt = 32.U
printf("myUInt = %d", myUInt) // myUInt = 32

```

# 关于打印函数使用的一些细节

## 1、chisel的prinf、scala的printf和println都可以使用，但：

```
·chisel的printf只能写在用户定义的Module中；并且必须要有时钟和复位，否则生成verilog报错，因此如果使用了RawModule，那么需要自定义时钟和复位域；
·scala的printf和println既可以用在Module中，也可以用在主函数中，但是它们的运行时机不一样，下面会说；
·因为后导入的chisel3包覆盖了Scala的标准包，所以Scala里的printf函数要写成“Predef.printf”的完整路径形式；

```

## 2、打印函数运行的时机

```
·chisel的printf写在Module中，只在运行测试的时候才有效，并且clk每走一次(也即step(1))，打印一次，必须要有step，否则printf不工作！！！因为从生成的verilog代码中就可以看出来，它是随clk和reset变化的。即使你其他的逻辑都是组合逻辑，生成的verilog代码中prinf对应的部分也是时序逻辑。如果只是运行的生成verilog的代码，它不会输出信息，最多只是会被转换成Verilog的系统函数“$fwrite”。
·写在主函数中的打印函数，只要运行主函数，就会输出信息。
·scala的打印函数，如果写在Module里，那么只在Elaborating design阶段有效，并且无论是测试还是生成verilog时都可以，因为它们都有Elaborating design阶段。
```

## 3、举例说明

```import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.RawTester.test

class PrintingModule extends Module {
    val io = IO(new Bundle {
        val in = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    io.out := io.in

    printf("Print during simulation: Input is %d\n", io.in)
    // chisel printf has its own string interpolator too
    printf(p"Print during simulation: IO is $io\n")

    println(s"Print during generation: Input is ${io.in}")
}


object PrintTester extends App {
    println("Start Testing")

    test(new PrintingModule ) { c =>
        c.io.in.poke(3.U)
        c.clock.step(5) // circuit will print
        
        println(s"Print during testing: Input is ${c.io.in.peek()}")
        }
}
```