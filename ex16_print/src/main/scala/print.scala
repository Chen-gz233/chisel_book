import chisel3._
import chisel3.util._


class Message extends Bundle {
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


class print extends Module{
    val io = IO(new Bundle {
        val in = Input(UInt(4.W))
        val out = Output(UInt(4.W))
    })
    io.out := io.in
    //C语言printf 与chisel的打印相同
    printf("在仿真过程中: 输入 %d\n", io.in)

    // Chisel printf也有自己的字符串插值器
    //只在运行测试的时候才有效，并且clk每走一次(也即step(1))
    //打印一次，必须要有step，否则printf不工作！！！
    printf(p"在仿真过程中: IO is $io\n")

    //scala的打印函数，在生成verilog代码时候打印一次就结束
    println(s"在生成过程中: 输入 is ${io.in}")

    val x_n1 = RegNext(io.in,0.U)
    val x_n2 = RegNext(x_n1,0.U)
    val x_n3 = RegNext(x_n2,0.U)
    //printf(p"x_n1 = $x_n1 ，x_n2=$x_n2,x_n3 =$x_n2 \n")
    printf("x_n1 = %d,x_n2 = %d,x_n3 = %d \n", x_n1,x_n2,x_n3)
    val myVec = VecInit(5.U, 10.U, 13.U)
    printf(p"myVec = $myVec \n") // myVec = Vec(5, 10, 13)

    val myBundle = Wire(new Bundle {
        val foo = UInt()
        val bar = UInt()
    })
    myBundle.foo := 3.U
    myBundle.bar := 11.U
    printf(p"myBundle = $myBundle \n") // myBundle = Bundle(a -> 3, b -> 11)

    val myMessage = Wire(new Message)
    myMessage.valid := true.B
    myMessage.addr := "h1234".U
    myMessage.length := 10.U
    myMessage.data := "hdeadbeef".U

    printf(p"$myMessage")




}
 
object print extends App{
    emitVerilog(new print(),Array("--target-dir","generate"))
    
}

