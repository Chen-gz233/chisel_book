package gemmini
/* 
import chisel3._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import gemmini._

class MeshWithDelaysTest(c: MeshWithDelays[SInt, SInt]) extends PeekPokeTester(c) {
  // Initialize input matrices A and B
  val matrixA = Array.ofDim[Int](8, 8)
  val matrixB = Array.ofDim[Int](8, 8)

  // Fill matrices A and B with sample data
  for (i <- 0 until 8) {
    for (j <- 0 until 8) {
      matrixA(i)(j) = i + j // Sample data
      matrixB(i)(j) = i - j // Sample data
    }
  }

  // Load matrix A into the input A port
  for (i <- 0 until 8) {
    for (j <- 0 until 8) {
      poke(c.io.a.bits(i)(j), matrixA(i)(j).S)
    }
  }
  poke(c.io.a.valid, true)

  // Load matrix B into the input B port
  for (i <- 0 until 8) {
    for (j <- 0 until 8) {
      poke(c.io.b.bits(i)(j), matrixB(i)(j).S)
    }
  }
  poke(c.io.b.valid, true)

  // Set up the request
  poke(c.io.req.bits.pe_control.propagate, 0.U)
  poke(c.io.req.bits.pe_control.dataflow, Dataflow.OS.id) // OS dataflow
  poke(c.io.req.bits.a_transpose, false.B)
  poke(c.io.req.bits.bd_transpose, false.B)
  poke(c.io.req.bits.total_rows, 8.U) // 8x8 matrix
  poke(c.io.req.bits.tag, 0.U) // Tag value
  poke(c.io.req.bits.flush, 0.U) // No flush
  poke(c.io.req.valid, true)

  // Wait until response is valid
  while (peek(c.io.resp.valid) == 0) {
    step(1)
  }

  // Read the output matrix C
  val resultC = Array.ofDim[Int](8, 8)
  for (i <- 0 until 8) {
    for (j <- 0 until 8) {
      resultC(i)(j) = peek(c.io.resp.bits.data(i)(j)).toInt
    }
  }

  // Perform your validations/assertions here based on the resultC
}

class MeshWithDelaysSpec extends ChiselFlatSpec {
  behavior of "MeshWithDelays"

  it should "correctly multiply 8x8 matrices using OS dataflow" in {
    Driver(() => new MeshWithDelays(SInt(8.W), SInt(8.W), SInt(8.W), UInt(16.W), Dataflow.OS, false, 1, 1,
      4, 4, 8, 8, 1, 1, 1, 10)) {
      c => new MeshWithDelaysTest(c)
    } should be(true)
  }
}

// Run the tests
object MeshWithDelaysTester extends App {
  chisel3.iotesters.Driver(() => new MeshWithDelays(SInt(8.W), SInt(8.W), SInt(8.W), UInt(16.W), Dataflow.OS, false, 1, 1,
    4, 4, 8, 8, 1, 1, 1, 10)) { c =>
    new MeshWithDelaysTest(c)
  }
}
*/