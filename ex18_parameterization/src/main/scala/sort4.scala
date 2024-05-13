import chisel3._
import chisel3.util._


class sort4(ascending: Boolean) extends Module {
  val io = IO(new Bundle {
    val in0 = Input(UInt(16.W))
    val in1 = Input(UInt(16.W))
    val in2 = Input(UInt(16.W))
    val in3 = Input(UInt(16.W))

    val out0 = Output(UInt(16.W))
    val out1 = Output(UInt(16.W))
    val out2 = Output(UInt(16.W))
    val out3 = Output(UInt(16.W))
  })
  
  def comp(l:UInt , r:UInt):Bool ={
    if(ascending){  //升序
        l < r
    }else{  //降序
        l > r
    }
  }

    val row10 = Wire(UInt(16.W))
    val row11 = Wire(UInt(16.W))
    val row12 = Wire(UInt(16.W))
    val row13 = Wire(UInt(16.W))

    val row20 = Wire(UInt(16.W))
    val row21 = Wire(UInt(16.W))
    val row22 = Wire(UInt(16.W))
    val row23 = Wire(UInt(16.W))
    //row10 , row11
    when(comp(io.in0,io.in1)){
        row10 := io.in0
        row11 := io.in1
    }.otherwise{
        row11 := io.in0
        row10 := io.in1
    }
    //row12 , row13
    when(comp(io.in2,io.in3)){
        row12 := io.in2
        row13 := io.in3
    }.otherwise{
        row13 := io.in2
        row12 := io.in3
    }
    //row20 , row21
    when(comp(row11,row12)){
        row21 := row11
        row22 := row12
    }.otherwise{
        row21 := row12
        row22 := row11
    }
    //row22 , row23
    when(comp(row10,row13)){
        row20 := row10
        row23 := row13
    }.otherwise{
        row20 := row13
        row23 := row10
    }
    //out0 , out1
    when(comp(row20,row21)){
        io.out0 := row20
        io.out1 := row21
    }.otherwise{
        io.out0 := row21
        io.out1 := row20
    }
    //out2 , out3
    when(comp(row22,row23)){
        io.out2 := row22
        io.out3 := row23
    }.otherwise{
        io.out2 := row23
        io.out3 := row22
    }

}

object sort4_v extends App {
    emitVerilog (new sort4(true),Array("--target-dir","generate") )
}
