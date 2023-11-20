import chisel3._
import chisel3.util._

//算数移位，考虑输入数据的符号位不被移
//算术左移同逻辑左移一样，算术右移最左面的空位补符号位。

class shiftReg_A (val n:Int,val d:Int)extends  Module{
        val io = IO(new Bundle{
        val in_d = Input(UInt(n.W))
        val out_d = Output(UInt(n.W))

    })
    //递归，重复cat N次
    def repeatValue(value: UInt, times: Int): UInt = {
    if (times == 1) value
    else Cat(value, repeatValue(value, times - 1))
    }

    val shiftReg = Seq.fill(d)(RegInit(0.U(n.W)))

    //shiftReg(0) := Cat(io.in_d(n-1),io.in_d(n-1,1))   //移一位的情况

    shiftReg(0) := Cat(repeatValue(io.in_d(n-1), (d)),io.in_d(n-1,d))
    for (i <- 1 until d) {
        shiftReg(i) := shiftReg(i - 1)
    }
    io.out_d := shiftReg(d-1)

}

object myshiftReg_A extends App{
    emitVerilog (new shiftReg_A(8,4),Array("--target-dir","generate") )
}