package gemmini

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class PE_tb  extends AnyFlatSpec with ChiselScalatestTester {
  "waveform" should "pass" in {
      test(new PE(SInt(8.W), SInt(32.W), SInt(32.W), Dataflow.OS, 1)).withAnnotations(Seq(WriteVcdAnnotation)){
         dut=>
        // Set initial values for input ports
        poke(dut.io.in_a, 2.S)
        poke(dut.io.in_b, 3.S)
        poke(dut.io.in_d, 1.S)
        poke(dut.io.in_control.dataflow, Dataflow.OS.id.U) // Output-stationary
        poke(dut.io.in_control.propagate, 0.U) // COMPUTE
        poke(dut.io.in_control.shift, 0.U)

        // Initialize other control signals
        poke(dut.io.in_id, 0.U)
        poke(dut.io.in_last, false.B)
        poke(dut.io.in_valid, true.B)

        // Wait a few cycles for computation to complete
        step(5)

        // Read output values
        val out_a = peek(dut.io.out_a)
        val out_b = peek(dut.io.out_b)
        val out_c = peek(dut.io.out_c)

        // Print output values
        println(s"Output a: $out_a")
        println(s"Output b: $out_b")
        println(s"Output c: $out_c")
      }
  }
}

