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
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_Sum
);
  wire  Full_Adder_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_1_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_1_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_1_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_1_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_1_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_2_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_2_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_2_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_2_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_2_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_3_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_3_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_3_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_3_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_3_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_4_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_4_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_4_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_4_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_4_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_5_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_5_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_5_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_5_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_5_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_6_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_6_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_6_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_6_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_6_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_7_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_7_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_7_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_7_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_7_io_out_c; // @[Adder_N.scala 15:35]
  wire  sum_1 = Full_Adder_1_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_0 = Full_Adder_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_3 = Full_Adder_3_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_2 = Full_Adder_2_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_5 = Full_Adder_5_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_4 = Full_Adder_4_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_7 = Full_Adder_7_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_6 = Full_Adder_6_io_out_s; // @[Adder_N.scala 18:19 28:16]
  Full_Adder Full_Adder ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_io_in_a),
    .io_in_b(Full_Adder_io_in_b),
    .io_in_c(Full_Adder_io_in_c),
    .io_out_s(Full_Adder_io_out_s),
    .io_out_c(Full_Adder_io_out_c)
  );
  Full_Adder Full_Adder_1 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_1_io_in_a),
    .io_in_b(Full_Adder_1_io_in_b),
    .io_in_c(Full_Adder_1_io_in_c),
    .io_out_s(Full_Adder_1_io_out_s),
    .io_out_c(Full_Adder_1_io_out_c)
  );
  Full_Adder Full_Adder_2 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_2_io_in_a),
    .io_in_b(Full_Adder_2_io_in_b),
    .io_in_c(Full_Adder_2_io_in_c),
    .io_out_s(Full_Adder_2_io_out_s),
    .io_out_c(Full_Adder_2_io_out_c)
  );
  Full_Adder Full_Adder_3 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_3_io_in_a),
    .io_in_b(Full_Adder_3_io_in_b),
    .io_in_c(Full_Adder_3_io_in_c),
    .io_out_s(Full_Adder_3_io_out_s),
    .io_out_c(Full_Adder_3_io_out_c)
  );
  Full_Adder Full_Adder_4 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_4_io_in_a),
    .io_in_b(Full_Adder_4_io_in_b),
    .io_in_c(Full_Adder_4_io_in_c),
    .io_out_s(Full_Adder_4_io_out_s),
    .io_out_c(Full_Adder_4_io_out_c)
  );
  Full_Adder Full_Adder_5 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_5_io_in_a),
    .io_in_b(Full_Adder_5_io_in_b),
    .io_in_c(Full_Adder_5_io_in_c),
    .io_out_s(Full_Adder_5_io_out_s),
    .io_out_c(Full_Adder_5_io_out_c)
  );
  Full_Adder Full_Adder_6 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_6_io_in_a),
    .io_in_b(Full_Adder_6_io_in_b),
    .io_in_c(Full_Adder_6_io_in_c),
    .io_out_s(Full_Adder_6_io_out_s),
    .io_out_c(Full_Adder_6_io_out_c)
  );
  Full_Adder Full_Adder_7 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_7_io_in_a),
    .io_in_b(Full_Adder_7_io_in_b),
    .io_in_c(Full_Adder_7_io_in_c),
    .io_out_s(Full_Adder_7_io_out_s),
    .io_out_c(Full_Adder_7_io_out_c)
  );
  assign io_Sum = {sum_7,sum_6,sum_5,sum_4,sum_3,sum_2,sum_1,sum_0}; // @[Adder_N.scala 31:26]
  assign Full_Adder_io_in_a = io_A[0]; // @[Adder_N.scala 24:28]
  assign Full_Adder_io_in_b = io_B[0]; // @[Adder_N.scala 25:28]
  assign Full_Adder_io_in_c = 1'h0; // @[Adder_N.scala 17:21 21:14]
  assign Full_Adder_1_io_in_a = io_A[1]; // @[Adder_N.scala 24:28]
  assign Full_Adder_1_io_in_b = io_B[1]; // @[Adder_N.scala 25:28]
  assign Full_Adder_1_io_in_c = Full_Adder_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_2_io_in_a = io_A[2]; // @[Adder_N.scala 24:28]
  assign Full_Adder_2_io_in_b = io_B[2]; // @[Adder_N.scala 25:28]
  assign Full_Adder_2_io_in_c = Full_Adder_1_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_3_io_in_a = io_A[3]; // @[Adder_N.scala 24:28]
  assign Full_Adder_3_io_in_b = io_B[3]; // @[Adder_N.scala 25:28]
  assign Full_Adder_3_io_in_c = Full_Adder_2_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_4_io_in_a = io_A[4]; // @[Adder_N.scala 24:28]
  assign Full_Adder_4_io_in_b = io_B[4]; // @[Adder_N.scala 25:28]
  assign Full_Adder_4_io_in_c = Full_Adder_3_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_5_io_in_a = io_A[5]; // @[Adder_N.scala 24:28]
  assign Full_Adder_5_io_in_b = io_B[5]; // @[Adder_N.scala 25:28]
  assign Full_Adder_5_io_in_c = Full_Adder_4_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_6_io_in_a = io_A[6]; // @[Adder_N.scala 24:28]
  assign Full_Adder_6_io_in_b = io_B[6]; // @[Adder_N.scala 25:28]
  assign Full_Adder_6_io_in_c = Full_Adder_5_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_7_io_in_a = io_A[7]; // @[Adder_N.scala 24:28]
  assign Full_Adder_7_io_in_b = io_B[7]; // @[Adder_N.scala 25:28]
  assign Full_Adder_7_io_in_c = Full_Adder_6_io_out_c; // @[Adder_N.scala 17:21 27:20]
endmodule
module ALU_sub_and_n(
  input        clock,
  input        reset,
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  input        io_in_sel,
  output [7:0] io_out_result,
  output       io_out_overflow,
  output       io_out_zero
);
  wire [7:0] Adder_nModule_io_A; // @[alu_add_sub_n.scala 17:27]
  wire [7:0] Adder_nModule_io_B; // @[alu_add_sub_n.scala 17:27]
  wire [7:0] Adder_nModule_io_Sum; // @[alu_add_sub_n.scala 17:27]
  wire [7:0] _in_b_env_T_1 = ~io_in_b; // @[alu_add_sub_n.scala 27:17]
  wire [7:0] _in_b_env_T_4 = $signed(_in_b_env_T_1) + 8'sh1; // @[alu_add_sub_n.scala 27:27]
  wire  _io_out_overflow_T_5 = Adder_nModule_io_Sum[7] != io_in_a[7]; // @[alu_add_sub_n.scala 34:51]
  wire [7:0] _io_out_zero_T_2 = ~io_out_result; // @[alu_add_sub_n.scala 36:20]
  wire [7:0] in_b_env = io_in_sel ? $signed(_in_b_env_T_4) : $signed(io_in_b); // @[alu_add_sub_n.scala 26:24 27:14 39:14]
  wire [7:0] _GEN_6 = io_in_sel ? _io_out_zero_T_2 : _io_out_zero_T_2; // @[alu_add_sub_n.scala 26:24 36:17 46:17]
  Adder_N Adder_nModule ( // @[alu_add_sub_n.scala 17:27]
    .io_A(Adder_nModule_io_A),
    .io_B(Adder_nModule_io_B),
    .io_Sum(Adder_nModule_io_Sum)
  );
  assign io_out_result = Adder_nModule_io_Sum; // @[alu_add_sub_n.scala 26:24 31:19 43:19]
  assign io_out_overflow = io_in_sel ? io_in_a[7] == io_in_b[7] & _io_out_overflow_T_5 : io_in_a[7] == io_in_b[7] &
    _io_out_overflow_T_5; // @[alu_add_sub_n.scala 26:24 33:21 44:21]
  assign io_out_zero = _GEN_6[0];
  assign Adder_nModule_io_A = io_in_a; // @[alu_add_sub_n.scala 26:24 29:24 41:24]
  assign Adder_nModule_io_B = io_in_sel ? $signed(in_b_env) : $signed(io_in_b); // @[alu_add_sub_n.scala 26:24 30:24 42:24]
endmodule
