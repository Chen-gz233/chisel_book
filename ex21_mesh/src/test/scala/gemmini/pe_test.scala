package gemmini

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PETester extends AnyFlatSpec with ChiselScalatestTester {
  "PE" should "perform correct MAC operation in output-stationary dataflow" in {
    test(new PE(SInt(8.W), SInt(32.W), SInt(32.W), Dataflow.OS, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // Set initial values for input ports
      dut.io.in_a.poke(2.S)
      dut.io.in_b.poke(3.S)
      dut.io.in_d.poke(1.S)
      dut.io.in_control.dataflow.poke(Dataflow.OS.id.U) // Output-stationary
      dut.io.in_control.propagate.poke(0.U) // COMPUTE
      dut.io.in_control.shift.poke(0.U)

      // Initialize other control signals
      dut.io.in_id.poke(0.U)
      dut.io.in_last.poke(false.B)
      dut.io.in_valid.poke(true.B)

      // Wait a few cycles for computation to complete
      dut.clock.step(5)

      // Read output values
      val out_a = dut.io.out_a.peek()
      val out_b = dut.io.out_b.peek()
      val out_c = dut.io.out_c.peek()

      // Check output values
        assert(out_a == 2.S)
        assert(out_b == 3.S)
        assert(out_c == 1.S)
        println("Dataflow.OS")
        println(s"Output1 a: $out_a")
        println(s"Output1 b: $out_b")
        println(s"Output1 c: $out_c")
    }
  }

  it should "perform correct MAC operation in weight-stationary dataflow" in {
    test(new PE(SInt(8.W), SInt(32.W), SInt(32.W), Dataflow.WS, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // Set initial values for input ports
      dut.io.in_a.poke(2.S)
      dut.io.in_b.poke(3.S)
      dut.io.in_d.poke(1.S)
      dut.io.in_control.dataflow.poke(Dataflow.WS.id.U) // Weight-stationary
      dut.io.in_control.propagate.poke(0.U) // COMPUTE
      dut.io.in_control.shift.poke(0.U)

      // Initialize other control signals
      dut.io.in_id.poke(0.U)
      dut.io.in_last.poke(false.B)
      dut.io.in_valid.poke(true.B)

      // Wait a few cycles for computation to complete
      dut.clock.step(5)

      // Read output values
      val out_a = dut.io.out_a.peek()
      val out_b = dut.io.out_b.peek()
      val out_c = dut.io.out_c.peek()

      // Check output values
      //assert(out_a == 2.S)
      //assert(out_b == 3.S)
      //assert(out_c == 6.S)
        println(s"Output2 a: $out_a")
        println(s"Output2 b: $out_b")
        println(s"Output2 c: $out_c")
    }
  }

  it should "propagate correct values in output-stationary dataflow" in {
    test(new PE(SInt(8.W), SInt(32.W), SInt(32.W), Dataflow.OS, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // Set initial values for input ports
      dut.io.in_a.poke(2.S)
      dut.io.in_b.poke(3.S)
      dut.io.in_d.poke(1.S)
      dut.io.in_control.dataflow.poke(Dataflow.OS.id.U) // Output-stationary
      dut.io.in_control.propagate.poke(1.U) // PROPAGATE
      dut.io.in_control.shift.poke(0.U)

      // Initialize other control signals
      dut.io.in_id.poke(0.U)
      dut.io.in_last.poke(false.B)
      dut.io.in_valid.poke(true.B)

      // Wait a few cycles for computation to complete
      dut.clock.step(5)

      // Read output values
      val out_a = dut.io.out_a.peek()
      val out_b = dut.io.out_b.peek()
      val out_c = dut.io.out_c.peek()

      // Check output values
      //assert(out_a == 2.S)
      //assert(out_b == 3.S)
      //assert(out_c == 3.S)
        println(s"Output3 a: $out_a")
        println(s"Output3 b: $out_b")
        println(s"Output3 c: $out_c")
    }
  }

  it should "propagate correct values in weight-stationary dataflow" in {
    test(new PE(SInt(8.W), SInt(32.W), SInt(32.W), Dataflow.WS, 1)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // Set initial values for input ports
      dut.io.in_a.poke(2.S)
      dut.io.in_b.poke(3.S)
      dut.io.in_d.poke(1.S)
      dut.io.in_control.dataflow.poke(Dataflow.WS.id.U) // Weight-stationary
      dut.io.in_control.propagate.poke(1.U) // PROPAGATE
      dut.io.in_control.shift.poke(0.U)

      // Initialize other control signals
      dut.io.in_id.poke(0.U)
      dut.io.in_last.poke(false.B)
      dut.io.in_valid.poke(true.B)

      // Wait a few cycles for computation to complete
      dut.clock.step(5)

      // Read output values
      val out_a = dut.io.out_a.peek()
      val out_b = dut.io.out_b.peek()
      val out_c = dut.io.out_c.peek()

      // Check output values
      //assert(out_a == 2.S)
      //assert(out_b == 3.S)
      //assert(out_c == 6.S)
        println(s"Output4 a: $out_a")
        println(s"Output4 b: $out_b")
        println(s"Output4 c: $out_c")
    }
  }
}
