import chisel3._
import chisel3.util._
/*
    输入3x3矩阵
    输出3x3矩阵

    想一个一个输入
    一个一个输出
    但是不太好控制
*/
class Array_2D extends  Module{
    val io = IO(new Bundle{
    val inMatrix = Input(Vec(3, Vec(3, UInt(8.W))))
    val outMatrix = Output(Vec(3, Vec(3, UInt(8.W))))

    })
    
    for (i <- 0 until 3) {
        for (j <- 0 until 3) {
            io.outMatrix(i)(j) := io.inMatrix(j)(i)
        }
    }
}


object myArray_2D extends App{
    emitVerilog (new Array_2D(),Array("--target-dir","generate") )
}