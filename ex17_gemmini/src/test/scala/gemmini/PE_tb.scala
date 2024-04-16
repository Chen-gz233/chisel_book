package gemmini

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class PE_tb extends  AnyFlatSpec with ChiselScalatestTester {
  "waveform" should "pass" in {
      test(new PE(SInt(8.W), SInt(32.W), SInt(32.W), Dataflow.OS, 1)).withAnnotations(Seq(WriteVcdAnnotation)){
         dut=>
        // Set initial values for input ports
        dut.io.in_a.poke(2.S)
        dut.io.in_b.poke(3.S)
        dut.io.in_d.poke( 1.S)
        dut.io.in_control.dataflow.poke( Dataflow.OS.id.U) // Output-stationary
        dut.io.in_control.propagate.poke( 0.U) // COMPUTE
        dut.io.in_control.shift.poke( 0.U)

        // Initialize other control signals
        dut.io.in_id.poke( 0.U)
        dut.io.in_last.poke( false.B)
        dut.io.in_valid.poke( true.B)

        // Wait a few cycles for computation to complete
        dut.clock.step(5)

        // Read output values
        val out_a = dut.io.out_a.peek()
        val out_b = dut.io.out_b.peek()
        val out_c = dut.io.out_c.peek()

        // Print output values
        println(s"Output a: $out_a")
        println(s"Output b: $out_b")
        println(s"Output c: $out_c")
      }
  }
}

