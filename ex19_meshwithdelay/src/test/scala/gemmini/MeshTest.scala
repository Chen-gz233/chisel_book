package gemmini
/*
import chisel3._
//import chisel3.experimental.BundleLiterals._
import chisel3.iotesters.PeekPokeTester

class MeshTester(mesh: Mesh[SInt]) extends PeekPokeTester(mesh) {
  val tileRows = mesh.tileRows
  val tileColumns = mesh.tileColumns
  val meshRows = mesh.meshRows
  val meshColumns = mesh.meshColumns

  // Input test data
  val testDataA = Seq.fill(meshRows)(Seq.fill(tileRows)(Seq.fill(tileColumns)(scala.util.Random.nextInt(100).S)))
  val testDataB = Seq.fill(meshColumns)(Seq.fill(tileColumns)(Seq.fill(tileRows)(scala.util.Random.nextInt(100).S)))
  val testDataD = Seq.fill(meshColumns)(Seq.fill(tileColumns)(Seq.fill(tileRows)(scala.util.Random.nextInt(100).S)))
  val testControl = Seq.fill(meshColumns)(Seq.fill(tileColumns)(new PEControl(mesh.accType)))
  val testId = Seq.fill(meshColumns)(Seq.fill(tileColumns)(scala.util.Random.nextInt(mesh.max_simultaneous_matmuls).U))
  val testLast = Seq.fill(meshColumns)(Seq.fill(tileColumns)(scala.util.Random.nextBoolean()))

  // Push input data into Mesh
  for (r <- 0 until meshRows) {
    for (c <- 0 until meshColumns) {
      for (tr <- 0 until tileRows) {
        poke(mesh.io.in_a(r)(tr), testDataA(r)(tr)(c))
      }
    }
  }

  for (c <- 0 until meshColumns) {
    for (tr <- 0 until tileRows) {
      poke(mesh.io.in_b(c)(tr), testDataB(c)(tr)(0))
      poke(mesh.io.in_d(c)(tr), testDataD(c)(tr)(0))
      poke(mesh.io.in_valid(c)(tr), true.B)
    }
  }

  for (c <- 0 until meshColumns) {
    for (tr <- 0 until tileRows) {
      poke(mesh.io.in_control(c)(tr), testControl(c)(tr))
      poke(mesh.io.in_id(c)(tr), testId(c)(tr))
      poke(mesh.io.in_last(c)(tr), testLast(c)(tr))
    }
  }

  // Wait a few cycles for computation to finish
  step(10)

  // Peek output data from Mesh
  for (c <- 0 until meshColumns) {
    for (tr <- 0 until tileRows) {
      expect(mesh.io.out_b(c)(tr), testDataB(c)(tr)(0))
      expect(mesh.io.out_c(c)(tr), testDataD(c)(tr)(0))
      expect(mesh.io.out_valid(c)(tr), true.B)
      expect(mesh.io.out_control(c)(tr), testControl(c)(tr))
      expect(mesh.io.out_id(c)(tr), testId(c)(tr))
      expect(mesh.io.out_last(c)(tr), testLast(c)(tr))
    }
  }
}

object MeshTester extends App {
  val tileRows = 8
  val tileColumns = 8
  val meshRows = 1
  val meshColumns = 1

  // Parameters for Mesh module
  val inputType = SInt(16.W)
  val outputType = SInt(16.W)
  val accType = SInt(24.W)
  val df = Dataflow.OS
  val tree_reduction = false
  val tile_latency = 1
  val max_simultaneous_matmuls = 1
  val output_delay = 1

  chisel3.iotesters.Driver(() => new Mesh(inputType, outputType, accType, df, tree_reduction, tile_latency, max_simultaneous_matmuls, output_delay, tileRows, tileColumns, meshRows, meshColumns)) {
    c => new MeshTester(c)
  }
}
*/ 