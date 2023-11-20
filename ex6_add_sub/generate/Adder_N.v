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
module Adder_N(
  input        clock,
  input        reset,
  input  [7:0] io_A,
  input  [7:0] io_B,
  input        io_Cin,
  output [7:0] io_Sum,
  output       io_Cout
);
  wire  Full_Adder_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_1_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_1_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_1_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_1_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_1_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_2_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_2_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_2_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_2_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_2_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_3_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_3_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_3_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_3_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_3_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_4_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_4_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_4_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_4_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_4_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_5_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_5_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_5_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_5_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_5_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_6_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_6_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_6_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_6_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_6_io_out_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_7_io_in_a; // @[Adder_N.scala 14:35]
  wire  Full_Adder_7_io_in_b; // @[Adder_N.scala 14:35]
  wire  Full_Adder_7_io_in_c; // @[Adder_N.scala 14:35]
  wire  Full_Adder_7_io_out_s; // @[Adder_N.scala 14:35]
  wire  Full_Adder_7_io_out_c; // @[Adder_N.scala 14:35]
  wire  sum_1 = Full_Adder_1_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire  sum_0 = Full_Adder_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire  sum_3 = Full_Adder_3_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire  sum_2 = Full_Adder_2_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire [3:0] io_Sum_lo = {sum_3,sum_2,sum_1,sum_0}; // @[Adder_N.scala 30:19]
  wire  sum_5 = Full_Adder_5_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire  sum_4 = Full_Adder_4_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire  sum_7 = Full_Adder_7_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire  sum_6 = Full_Adder_6_io_out_s; // @[Adder_N.scala 17:19 27:16]
  wire [3:0] io_Sum_hi = {sum_7,sum_6,sum_5,sum_4}; // @[Adder_N.scala 30:19]
  Full_Adder Full_Adder ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_io_in_a),
    .io_in_b(Full_Adder_io_in_b),
    .io_in_c(Full_Adder_io_in_c),
    .io_out_s(Full_Adder_io_out_s),
    .io_out_c(Full_Adder_io_out_c)
  );
  Full_Adder Full_Adder_1 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_1_io_in_a),
    .io_in_b(Full_Adder_1_io_in_b),
    .io_in_c(Full_Adder_1_io_in_c),
    .io_out_s(Full_Adder_1_io_out_s),
    .io_out_c(Full_Adder_1_io_out_c)
  );
  Full_Adder Full_Adder_2 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_2_io_in_a),
    .io_in_b(Full_Adder_2_io_in_b),
    .io_in_c(Full_Adder_2_io_in_c),
    .io_out_s(Full_Adder_2_io_out_s),
    .io_out_c(Full_Adder_2_io_out_c)
  );
  Full_Adder Full_Adder_3 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_3_io_in_a),
    .io_in_b(Full_Adder_3_io_in_b),
    .io_in_c(Full_Adder_3_io_in_c),
    .io_out_s(Full_Adder_3_io_out_s),
    .io_out_c(Full_Adder_3_io_out_c)
  );
  Full_Adder Full_Adder_4 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_4_io_in_a),
    .io_in_b(Full_Adder_4_io_in_b),
    .io_in_c(Full_Adder_4_io_in_c),
    .io_out_s(Full_Adder_4_io_out_s),
    .io_out_c(Full_Adder_4_io_out_c)
  );
  Full_Adder Full_Adder_5 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_5_io_in_a),
    .io_in_b(Full_Adder_5_io_in_b),
    .io_in_c(Full_Adder_5_io_in_c),
    .io_out_s(Full_Adder_5_io_out_s),
    .io_out_c(Full_Adder_5_io_out_c)
  );
  Full_Adder Full_Adder_6 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_6_io_in_a),
    .io_in_b(Full_Adder_6_io_in_b),
    .io_in_c(Full_Adder_6_io_in_c),
    .io_out_s(Full_Adder_6_io_out_s),
    .io_out_c(Full_Adder_6_io_out_c)
  );
  Full_Adder Full_Adder_7 ( // @[Adder_N.scala 14:35]
    .io_in_a(Full_Adder_7_io_in_a),
    .io_in_b(Full_Adder_7_io_in_b),
    .io_in_c(Full_Adder_7_io_in_c),
    .io_out_s(Full_Adder_7_io_out_s),
    .io_out_c(Full_Adder_7_io_out_c)
  );
  assign io_Sum = {io_Sum_hi,io_Sum_lo}; // @[Adder_N.scala 30:19]
  assign io_Cout = Full_Adder_7_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_io_in_a = io_A[0]; // @[Adder_N.scala 23:28]
  assign Full_Adder_io_in_b = io_B[0]; // @[Adder_N.scala 24:28]
  assign Full_Adder_io_in_c = io_Cin; // @[Adder_N.scala 16:21 20:14]
  assign Full_Adder_1_io_in_a = io_A[1]; // @[Adder_N.scala 23:28]
  assign Full_Adder_1_io_in_b = io_B[1]; // @[Adder_N.scala 24:28]
  assign Full_Adder_1_io_in_c = Full_Adder_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_2_io_in_a = io_A[2]; // @[Adder_N.scala 23:28]
  assign Full_Adder_2_io_in_b = io_B[2]; // @[Adder_N.scala 24:28]
  assign Full_Adder_2_io_in_c = Full_Adder_1_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_3_io_in_a = io_A[3]; // @[Adder_N.scala 23:28]
  assign Full_Adder_3_io_in_b = io_B[3]; // @[Adder_N.scala 24:28]
  assign Full_Adder_3_io_in_c = Full_Adder_2_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_4_io_in_a = io_A[4]; // @[Adder_N.scala 23:28]
  assign Full_Adder_4_io_in_b = io_B[4]; // @[Adder_N.scala 24:28]
  assign Full_Adder_4_io_in_c = Full_Adder_3_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_5_io_in_a = io_A[5]; // @[Adder_N.scala 23:28]
  assign Full_Adder_5_io_in_b = io_B[5]; // @[Adder_N.scala 24:28]
  assign Full_Adder_5_io_in_c = Full_Adder_4_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_6_io_in_a = io_A[6]; // @[Adder_N.scala 23:28]
  assign Full_Adder_6_io_in_b = io_B[6]; // @[Adder_N.scala 24:28]
  assign Full_Adder_6_io_in_c = Full_Adder_5_io_out_c; // @[Adder_N.scala 16:21 26:20]
  assign Full_Adder_7_io_in_a = io_A[7]; // @[Adder_N.scala 23:28]
  assign Full_Adder_7_io_in_b = io_B[7]; // @[Adder_N.scala 24:28]
  assign Full_Adder_7_io_in_c = Full_Adder_6_io_out_c; // @[Adder_N.scala 16:21 26:20]
endmodule
