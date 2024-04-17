package gemmini

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class MeshSpec extends AnyFlatSpec with ChiselScalatestTester {
  "Mesh" should "broadcast inputs correctly and drive outputs properly" in {
    // Define parameters
    val meshRows = 8
    val meshColumns = 8
    val tileRows = 1
    val tileColumns = 1
    val inputWidth = 8
    val outputWidth = 32
    val accWidth = 32
    val df = Dataflow.OS
    val tree_reduction = false
    val tile_latency = 1
    val max_simultaneous_matmuls = 1
    val output_delay = 1

    // Instantiate Mesh
    test(new Mesh(SInt(inputWidth.W), SInt(outputWidth.W), SInt(accWidth.W), df, tree_reduction, tile_latency, max_simultaneous_matmuls, output_delay, tileRows, tileColumns, meshRows, meshColumns)).withAnnotations(Seq(WriteVcdAnnotation)) {
      dut =>

        println("")
        println("#### Mesh_tb.scala ####")
        println("")

        // Set initial values for input ports
        val in_a_values = Seq.fill(meshRows, tileRows)(scala.util.Random.nextInt(100).S)
        val in_b_values = Seq.fill(meshColumns, tileColumns)(scala.util.Random.nextInt(100).S)
        val in_d_values = Seq.fill(meshColumns, tileColumns)(scala.util.Random.nextInt(100).S)
        //val in_control_values = Seq.fill(meshColumns, tileColumns)(new PEControl(SInt(accWidth.W)))
        val in_control_dataflow = Seq.fill(meshColumns, tileColumns)(df.id.U)
        val in_control_propagate = Seq.fill(meshColumns, tileColumns)(0.U)
        val in_control_shift = Seq.fill(meshColumns, tileColumns)(0.U) 

        val in_id_values = Seq.fill(meshColumns, tileColumns)(scala.util.Random.nextInt(max_simultaneous_matmuls).U)
        //val in_last_values = Seq.fill(meshColumns, tileColumns)(scala.util.Random.nextBoolean())
        val in_last_values = Seq.fill(meshColumns, tileColumns)(false.B)
        //val in_valid_values = Seq.fill(meshColumns, tileColumns)(scala.util.Random.nextBoolean())
        val in_valid_values = Seq.fill(meshColumns, tileColumns)(true.B)

        // Set input ports
        for (r <- 0 until meshRows) {
          for (t <- 0 until tileRows) {
            dut.io.in_a(r)(t).poke(in_a_values(r)(t))
          }
        }

        for (c <- 0 until meshColumns) {
          for (t <- 0 until tileColumns) {
            dut.io.in_b(c)(t).poke(in_b_values(c)(t))
            dut.io.in_d(c)(t).poke(in_d_values(c)(t))
            //dut.io.in_control(c)(t).poke(in_control_values(c)(t))
            dut.io.in_control(c)(t).dataflow.poke(in_control_dataflow(c)(t))
            dut.io.in_control(c)(t).propagate.poke(in_control_propagate(c)(t))
            dut.io.in_control(c)(t).shift.poke(in_control_shift(c)(t))

            dut.io.in_id(c)(t).poke(in_id_values(c)(t))
            dut.io.in_last(c)(t).poke(in_last_values(c)(t))
            dut.io.in_valid(c)(t).poke(in_valid_values(c)(t))
          }
        }

        // Wait a few cycles for computation to complete
        dut.clock.step(40)

        // Read output values
        val out_b_values = dut.io.out_b.map(_.map(_.peek()))
        val out_c_values = dut.io.out_c.map(_.map(_.peek()))
        val out_valid_values = dut.io.out_valid.map(_.map(_.peek()))
        val out_control_values = dut.io.out_control.map(_.map(_.peek()))
        val out_id_values = dut.io.out_id.map(_.map(_.peek()))
        val out_last_values = dut.io.out_last.map(_.map(_.peek()))

        // Perform assertions
        for (r <- 0 until meshRows) {
          for (t <- 0 until tileRows) {
            assert(out_b_values(r)(t).litValue == in_b_values(r)(t).litValue)
          }
        }

        for (c <- 0 until meshColumns) {
          for (t <- 0 until tileColumns) {
            assert(out_c_values(c)(t).litValue == in_d_values(c)(t).litValue)
            assert(out_valid_values(c)(t).toString() == in_valid_values(c)(t).toString())
            //assert(out_control_values(c)(t) == in_control_values(c)(t))
            assert(out_id_values(c)(t).litValue == in_id_values(c)(t).litValue)
            assert(out_last_values(c)(t).toString() == in_last_values(c)(t).toString())
          }
        }
    }
  }
}
