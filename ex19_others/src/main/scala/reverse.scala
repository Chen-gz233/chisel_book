import chisel3._
import chisel3.util._

class MeshNew(meshRows: Int, meshColumns: Int) extends Module {
  val io = IO(new Bundle {
    val in_b = Output(Vec(meshRows, Vec(meshColumns, SInt(8.W))))
    // 其他端口定义...
  })

  // 定义为一个 meshRows x meshColumns 的矩阵，元素类型为 8 位的 SInt
  val d_in = Reg(Vec(meshRows, Vec(meshColumns, SInt(8.W))))

  // 初始化 d_in 的值（仅作为示例）
  d_in := VecInit(Seq(
    VecInit(1.S(8.W), 2.S(8.W), 3.S(8.W)),
    VecInit(4.S(8.W), 5.S(8.W), 6.S(8.W)),
    VecInit(7.S(8.W), 8.S(8.W), 9.S(8.W))
  ))

  // 反转每一行并将其传递给 io.in_b
  for (r <- 0 until meshRows) {
    io.in_b(r) := d_in(r).reverse
  }

  // 打印反转后的矩阵（仅用于调试）
  printf(p"Reversed d_in: ${io.in_b}\n")
    println(s"Reversed d_in: ${io.in_b}\n")
}
object MeshNewMain extends App {
  //chisel3.Driver.execute(args, () => new MeshNew(3, 3))
  emitVerilog (new MeshNew(3, 3),Array("--target-dir","generate") )
}
