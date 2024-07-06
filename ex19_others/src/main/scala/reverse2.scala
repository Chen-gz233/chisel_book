
  
import chisel3._  
import chisel3.util._  
  
class MeshNew2(meshRows: Int, meshColumns: Int) extends Module {  
  val io = IO(new Bundle {  
    val in_b = Output(Vec(meshRows, Vec(meshColumns, SInt(8.W))))  
  })  
  
  val d_in = Reg(Vec(meshRows, Vec(meshColumns, SInt(8.W))))  
  
  // 初始化 d_in 的值（仅作为示例）  
  d_in := VecInit(Seq.fill(meshRows)(VecInit.tabulate(meshColumns)(i => (i + 1).S(8.W))))  
  
  // 反转每一行并将其传递给 io.in_b  
  for (r <- 0 until meshRows) {  
    io.in_b(r) := d_in(r).reverse  
  }  
  
  // 这是一个 Scala 方法，用于在 Scala 环境中打印 d_in 的内容  
  def printDInContent(): Unit = {  
    for (r <- 0 until meshRows) {  
      for (c <- 0 until meshColumns) {  
        println(s"d_in[$r][$c]: ${d_in(r)(c)}")  
      }  
    }  
  }  
}