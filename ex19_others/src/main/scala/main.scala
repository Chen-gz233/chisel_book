import chisel3._
import chisel3.util._



class others extends  Module{

    val io = IO(new Bundle{
        val in = Input(UInt(1.W))
        val out = Output(UInt(1.W))
    })
    //有个映射（Map），包含几个键值对（Key-Value Pairs）
    val map = Map("a" -> 1)
    val a = map("a")
    println(a)
    //得到不确定的切片
    //Map提供了另一种方式来访问一个键值对，是通过get方法。
    //使用get方法会返回一个抽象类Option的值。
    //Option有两个子类，Some和None。
    //Option极其重要，因为它可以让用户用匹配语句来检查Scala类型或值。
    val b = map.get("b")
    println(b)
    val c= map.get("a")
    println(c)


    //和Map一样，Option也有一个get方法，如果在None上调用的话就会报错
    //对于这种实例，我们可以用getOrElse提供一个默认值，即如果有值就返回值，没有就返回该方法的参数值。
    val some = Some(1)
    val none = None
    println(some.get)          // Returns 1
    // println(none.get)       // Errors!
    println(some.getOrElse(2)) // Returns 1
    println(none.getOrElse(2)) // Returns 2

/* 
    Scala提供了match运算符，支持以下功能：
        1.对于候选项的简单测试，类似于C语言的swtich语句；
        2.对值的ad-hoc组合的更复杂的测试；
        3.当一个变量的类型未知或待指定时，基于该变量的类型采取行为，例如：
            3.1 变量来自一个异构的列表：val mixedList = List(1, "string", false)；
            3.2 或已知变量是一个超类的成员，但不知道是指定的哪个子类；
        4.根据一个正则表达式从一个字符串中提取子串；
*/
    val y = 7
    val x = y match {
    case 0 => "zero" 
    case 1 =>        // match语句会按顺序进行搜索，一旦匹配就不会检查后续的情况了
        "one"        
    case 2 => {      // 每个=>操作符之后的代码块都会延续到右大括号或者下一个case语句之前
        "two"
    }
    case _ => "many" // _下划线是通配符，用于匹配前面没有匹配上的任何其他情况
    }
    println("y is " + x)
    println("")
    //多个值可以同时进行匹配。
    def animalType(biggerThanBreadBox: Boolean, meanAsCanBe: Boolean): String = {
    (biggerThanBreadBox, meanAsCanBe) match {
        case (true, true) => "wolverine"
        case (true, false) => "elephant"
        case (false, true) => "shrew"
        case (false, false) => "puppy"
    }
    }
    println(animalType(true, true))

    println("")
    //类型匹配
    //Scala是一种强类型的语言，所以每个对象在执行的时候都是知道类型的。
    //我们可以使用match语句来利用这个信息指示控制流：
    val sequence = Seq("a", 1, 0.0)
    sequence.foreach { x =>
    x match {
        //代码中case s中的s是待输入的对象，写成a也行，x也行。
        case s: String => println(s"$x is a String")
        case s: Int    => println(s"$x is an Int")
        case s: Double => println(s"$x is a Double")
        case _ => println(s"$x is an unknown type!")
    }
    }

    //类型匹配和擦除
    //类型匹配有一些限制。因为Scala是在JVM上运行的，而JVM不会维护复合（polymorphic）类型，
    //所以不能在运行时匹配，因为会被擦除。下面的例子会总是匹配第一个条件语句，
    //因为[String]、[Int]和[Double]复合类型被擦除了，case语句只会匹配上Seq
    println("")
    println("类型匹配和擦除")
    val sequences = Seq(Seq("a"), Seq(1), Seq(0.0))
    sequences.foreach { x =>
        x match {
            case s: Seq[String] => println(s"$x is a String")
            case s: Seq[Int]    => println(s"$x is an Int")
            case s: Seq[Double] => println(s"$x is a Double")
        }
    }


    io.out := io.in
}



object My_others extends App{
    emitVerilog (new others(),Array("--target-dir","generate") )
}