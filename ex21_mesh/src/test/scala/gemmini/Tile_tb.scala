package gemmini

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class TileSpec extends AnyFlatSpec with ChiselScalatestTester {
    "Tile" should "broadcast inputs correctly and drive outputs properly" in {
    // Define parameters
    val rows = 8
    val columns = 8
    val inputWidth = 8
    val outputWidth = 32
    val accWidth = 32
    val df = Dataflow.OS
    val tree_reduction = false
    val max_simultaneous_matmuls = 1

    // Instantiate Tile
    test(new Tile(SInt(inputWidth.W), SInt(outputWidth.W), SInt(accWidth.W), df, tree_reduction, max_simultaneous_matmuls, rows, columns)).withAnnotations(Seq(WriteVcdAnnotation)) { 
        dut =>
                println("")
                println("#### Tile_tb.scala ####")
                println("")
                // Set initial values for input ports
                val in_a_values = Seq.fill(rows)(scala.util.Random.nextInt(100).S)
                val in_b_values = Seq.fill(columns)(scala.util.Random.nextInt(100).S)
                val in_d_values = Seq.fill(columns)(scala.util.Random.nextInt(100).S)

                //val in_control_values = Seq.fill(columns)(new PEControl(SInt(accWidth.W)))
                val in_control_dataflow = Seq.fill(columns)(df.id.U)
                val in_control_propagate = Seq.fill(columns)(0.U)
                val in_control_shift = Seq.fill(columns)(0.U)
                val in_id_values = Seq.fill(columns)(scala.util.Random.nextInt(max_simultaneous_matmuls).U)
                //val in_last_values = Seq.fill(columns)(scala.util.Random.nextBoolean())
                val in_last_values = Seq.fill(columns)(false.B)
                //val in_valid_values = Seq.fill(columns)(scala.util.Random.nextBoolean())
                val in_valid_values = Seq.fill(columns)(true.B)

                // Set input ports
                for (r <- 0 until rows) {
                    dut.io.in_a(r).poke(in_a_values(r))
                }

                for (c <- 0 until columns) {
                    dut.io.in_b(c).poke(in_b_values(c))
                    dut.io.in_d(c).poke(in_d_values(c))

                    //dut.io.in_control(c).poke(in_control_values(c))
                    dut.io.in_control(c).dataflow.poke(in_control_dataflow(c))
                    dut.io.in_control(c).propagate.poke(in_control_propagate(c))
                    dut.io.in_control(c).shift.poke(in_control_shift(c))
                    
                    dut.io.in_id(c).poke(in_id_values(c))
                    dut.io.in_last(c).poke(in_last_values(c))
                    dut.io.in_valid(c).poke(in_valid_values(c))
                }

                // Wait a few cycles for computation to complete
                dut.clock.step(10)

                // Read output values
                val out_a_values = dut.io.out_a.map(_.peek())
                val out_b_values = dut.io.out_b.map(_.peek())
                val out_c_values = dut.io.out_c.map(_.peek())
                val out_control_values = dut.io.out_control.map(_.peek())
                //val out_control_dataflow = dut.io.out_control.dataflow.map(_.peek())
                //val out_control_propagate = dut.io.out_control.propagate.map(_.peek())
                //val out_control_shift = dut.io.out_control.lift.map(_.peek())

                val out_id_values = dut.io.out_id.map(_.peek())
                val out_last_values = dut.io.out_last.map(_.peek())
                val out_valid_values = dut.io.out_valid.map(_.peek())
                //println(s"out_control_values : $out_control_values")
                // Perform assertions
                for (r <- 0 until rows) {
                    //litValue()方法将返回SInt类型变量的数值，而不考虑数据类型。
                    assert(out_a_values(r).litValue == in_a_values(r).litValue)
                    println(s"out_control_values : $out_control_values(r)")
                    //println(s"out_a_values : $out_a_values(r)")
                    //println(s"in_a_values : $in_a_values(r)")
                }
            //这里一个out_control_values中包含8个PEControl
                for (c <- 0 until columns) {
                    /**/
                    assert(out_b_values(c).litValue == in_b_values(c).litValue)
                    //println(s"out_b_values : $out_b_values(c)")
                    //println(s"in_b_values : $in_b_values(c)")

                    assert(out_c_values(c).litValue == in_d_values(c).litValue)
                    //println(s"out_a_values a: $out_a_values(r)")

                    //assert(out_control_values(c) == in_control_values(c))
                    //assert(out_control_dataflow(c) == in_control_dataflow(c))
                    //assert(out_control_propagate(c) == in_control_propagate(c))
                    //assert(out_control_shift(c) == in_control_shift(c))
                    //println(s"out_a_values a: $out_a_values(r)")

                    assert(out_id_values(c).litValue == in_id_values(c).litValue)
                    //println(s"out_a_values a: $out_a_values(r)")

                    assert(out_last_values(c).toString() == in_last_values(c).toString())
                    //println(s"out_a_values a: $out_a_values(r)")

                    assert(out_valid_values(c).toString() == in_valid_values(c).toString())
                    //println(s"out_a_values a: $out_a_values(r)")
                    

                }
    }
  }
}
