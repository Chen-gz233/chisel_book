module Full_Adder(
  input   clock,
  input   reset,
  input   io_in_a,
  input   io_in_b,
  input   io_in_c,
  output  io_out_s,
  output  io_out_c
);
  wire  a_xor_b = io_in_a ^ io_in_b; // @[FA.scala 15:27]
  wire  a_and_b = io_in_a & io_in_b; // @[FA.scala 16:27]
  wire  c_and_axorb = io_in_c & a_xor_b; // @[FA.scala 19:31]
  assign io_out_s = io_in_c ^ a_xor_b; // @[FA.scala 17:25]
  assign io_out_c = c_and_axorb | a_and_b; // @[FA.scala 21:29]
endmodule
