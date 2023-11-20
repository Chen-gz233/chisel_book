module Full_Adder(
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
module Adder_8(
  input        clock,
  input        reset,
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [8:0] io_out
);
  wire  FA0_io_in_a; // @[Adder_8.scala 13:21]
  wire  FA0_io_in_b; // @[Adder_8.scala 13:21]
  wire  FA0_io_in_c; // @[Adder_8.scala 13:21]
  wire  FA0_io_out_s; // @[Adder_8.scala 13:21]
  wire  FA0_io_out_c; // @[Adder_8.scala 13:21]
  wire  FA1_io_in_a; // @[Adder_8.scala 14:21]
  wire  FA1_io_in_b; // @[Adder_8.scala 14:21]
  wire  FA1_io_in_c; // @[Adder_8.scala 14:21]
  wire  FA1_io_out_s; // @[Adder_8.scala 14:21]
  wire  FA1_io_out_c; // @[Adder_8.scala 14:21]
  wire  FA2_io_in_a; // @[Adder_8.scala 15:21]
  wire  FA2_io_in_b; // @[Adder_8.scala 15:21]
  wire  FA2_io_in_c; // @[Adder_8.scala 15:21]
  wire  FA2_io_out_s; // @[Adder_8.scala 15:21]
  wire  FA2_io_out_c; // @[Adder_8.scala 15:21]
  wire  FA3_io_in_a; // @[Adder_8.scala 16:21]
  wire  FA3_io_in_b; // @[Adder_8.scala 16:21]
  wire  FA3_io_in_c; // @[Adder_8.scala 16:21]
  wire  FA3_io_out_s; // @[Adder_8.scala 16:21]
  wire  FA3_io_out_c; // @[Adder_8.scala 16:21]
  wire  FA4_io_in_a; // @[Adder_8.scala 17:21]
  wire  FA4_io_in_b; // @[Adder_8.scala 17:21]
  wire  FA4_io_in_c; // @[Adder_8.scala 17:21]
  wire  FA4_io_out_s; // @[Adder_8.scala 17:21]
  wire  FA4_io_out_c; // @[Adder_8.scala 17:21]
  wire  FA5_io_in_a; // @[Adder_8.scala 18:21]
  wire  FA5_io_in_b; // @[Adder_8.scala 18:21]
  wire  FA5_io_in_c; // @[Adder_8.scala 18:21]
  wire  FA5_io_out_s; // @[Adder_8.scala 18:21]
  wire  FA5_io_out_c; // @[Adder_8.scala 18:21]
  wire  FA6_io_in_a; // @[Adder_8.scala 19:21]
  wire  FA6_io_in_b; // @[Adder_8.scala 19:21]
  wire  FA6_io_in_c; // @[Adder_8.scala 19:21]
  wire  FA6_io_out_s; // @[Adder_8.scala 19:21]
  wire  FA6_io_out_c; // @[Adder_8.scala 19:21]
  wire  FA7_io_in_a; // @[Adder_8.scala 20:21]
  wire  FA7_io_in_b; // @[Adder_8.scala 20:21]
  wire  FA7_io_in_c; // @[Adder_8.scala 20:21]
  wire  FA7_io_out_s; // @[Adder_8.scala 20:21]
  wire  FA7_io_out_c; // @[Adder_8.scala 20:21]
  wire  out_temp2_1 = FA1_io_out_s; // @[Adder_8.scala 23:25 37:20]
  wire  out_temp2_0 = FA0_io_out_s; // @[Adder_8.scala 23:25 31:18]
  wire  out_temp2_3 = FA3_io_out_s; // @[Adder_8.scala 23:25 47:20]
  wire  out_temp2_2 = FA2_io_out_s; // @[Adder_8.scala 23:25 42:20]
  wire [3:0] io_out_lo = {out_temp2_3,out_temp2_2,out_temp2_1,out_temp2_0}; // @[Adder_8.scala 70:25]
  wire  out_temp2_5 = FA5_io_out_s; // @[Adder_8.scala 23:25 57:20]
  wire  out_temp2_4 = FA4_io_out_s; // @[Adder_8.scala 23:25 52:20]
  wire  out_temp2_8 = FA7_io_out_c; // @[Adder_8.scala 23:25 68:20]
  wire  out_temp2_7 = FA7_io_out_s; // @[Adder_8.scala 23:25 67:20]
  wire  out_temp2_6 = FA6_io_out_s; // @[Adder_8.scala 23:25 62:20]
  wire [4:0] io_out_hi = {out_temp2_8,out_temp2_7,out_temp2_6,out_temp2_5,out_temp2_4}; // @[Adder_8.scala 70:25]
  Full_Adder FA0 ( // @[Adder_8.scala 13:21]
    .io_in_a(FA0_io_in_a),
    .io_in_b(FA0_io_in_b),
    .io_in_c(FA0_io_in_c),
    .io_out_s(FA0_io_out_s),
    .io_out_c(FA0_io_out_c)
  );
  Full_Adder FA1 ( // @[Adder_8.scala 14:21]
    .io_in_a(FA1_io_in_a),
    .io_in_b(FA1_io_in_b),
    .io_in_c(FA1_io_in_c),
    .io_out_s(FA1_io_out_s),
    .io_out_c(FA1_io_out_c)
  );
  Full_Adder FA2 ( // @[Adder_8.scala 15:21]
    .io_in_a(FA2_io_in_a),
    .io_in_b(FA2_io_in_b),
    .io_in_c(FA2_io_in_c),
    .io_out_s(FA2_io_out_s),
    .io_out_c(FA2_io_out_c)
  );
  Full_Adder FA3 ( // @[Adder_8.scala 16:21]
    .io_in_a(FA3_io_in_a),
    .io_in_b(FA3_io_in_b),
    .io_in_c(FA3_io_in_c),
    .io_out_s(FA3_io_out_s),
    .io_out_c(FA3_io_out_c)
  );
  Full_Adder FA4 ( // @[Adder_8.scala 17:21]
    .io_in_a(FA4_io_in_a),
    .io_in_b(FA4_io_in_b),
    .io_in_c(FA4_io_in_c),
    .io_out_s(FA4_io_out_s),
    .io_out_c(FA4_io_out_c)
  );
  Full_Adder FA5 ( // @[Adder_8.scala 18:21]
    .io_in_a(FA5_io_in_a),
    .io_in_b(FA5_io_in_b),
    .io_in_c(FA5_io_in_c),
    .io_out_s(FA5_io_out_s),
    .io_out_c(FA5_io_out_c)
  );
  Full_Adder FA6 ( // @[Adder_8.scala 19:21]
    .io_in_a(FA6_io_in_a),
    .io_in_b(FA6_io_in_b),
    .io_in_c(FA6_io_in_c),
    .io_out_s(FA6_io_out_s),
    .io_out_c(FA6_io_out_c)
  );
  Full_Adder FA7 ( // @[Adder_8.scala 20:21]
    .io_in_a(FA7_io_in_a),
    .io_in_b(FA7_io_in_b),
    .io_in_c(FA7_io_in_c),
    .io_out_s(FA7_io_out_s),
    .io_out_c(FA7_io_out_c)
  );
  assign io_out = {io_out_hi,io_out_lo}; // @[Adder_8.scala 70:25]
  assign FA0_io_in_a = io_in_a[0]; // @[Adder_8.scala 27:27]
  assign FA0_io_in_b = io_in_b[0]; // @[Adder_8.scala 28:27]
  assign FA0_io_in_c = 1'h0; // @[Adder_8.scala 29:17]
  assign FA1_io_in_a = io_in_a[1]; // @[Adder_8.scala 34:27]
  assign FA1_io_in_b = io_in_b[1]; // @[Adder_8.scala 35:27]
  assign FA1_io_in_c = FA0_io_out_c; // @[Adder_8.scala 30:17]
  assign FA2_io_in_a = io_in_a[2]; // @[Adder_8.scala 39:27]
  assign FA2_io_in_b = io_in_b[2]; // @[Adder_8.scala 40:27]
  assign FA2_io_in_c = FA1_io_out_c; // @[Adder_8.scala 36:17]
  assign FA3_io_in_a = io_in_a[3]; // @[Adder_8.scala 44:27]
  assign FA3_io_in_b = io_in_b[3]; // @[Adder_8.scala 45:27]
  assign FA3_io_in_c = FA2_io_out_c; // @[Adder_8.scala 41:17]
  assign FA4_io_in_a = io_in_a[4]; // @[Adder_8.scala 49:27]
  assign FA4_io_in_b = io_in_b[4]; // @[Adder_8.scala 50:27]
  assign FA4_io_in_c = FA3_io_out_c; // @[Adder_8.scala 46:17]
  assign FA5_io_in_a = io_in_a[5]; // @[Adder_8.scala 54:27]
  assign FA5_io_in_b = io_in_b[5]; // @[Adder_8.scala 55:27]
  assign FA5_io_in_c = FA4_io_out_c; // @[Adder_8.scala 51:17]
  assign FA6_io_in_a = io_in_a[6]; // @[Adder_8.scala 59:27]
  assign FA6_io_in_b = io_in_b[6]; // @[Adder_8.scala 60:27]
  assign FA6_io_in_c = FA5_io_out_c; // @[Adder_8.scala 56:17]
  assign FA7_io_in_a = io_in_a[7]; // @[Adder_8.scala 64:27]
  assign FA7_io_in_b = io_in_b[7]; // @[Adder_8.scala 65:27]
  assign FA7_io_in_c = FA6_io_out_c; // @[Adder_8.scala 61:17]
endmodule
