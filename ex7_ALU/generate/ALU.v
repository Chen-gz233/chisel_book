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
  input  [31:0] io_A,
  input  [31:0] io_B,
  output [31:0] io_Sum
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
  wire  Full_Adder_8_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_8_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_8_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_8_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_8_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_9_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_9_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_9_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_9_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_9_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_10_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_10_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_10_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_10_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_10_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_11_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_11_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_11_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_11_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_11_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_12_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_12_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_12_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_12_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_12_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_13_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_13_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_13_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_13_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_13_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_14_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_14_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_14_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_14_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_14_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_15_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_15_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_15_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_15_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_15_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_16_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_16_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_16_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_16_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_16_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_17_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_17_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_17_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_17_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_17_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_18_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_18_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_18_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_18_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_18_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_19_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_19_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_19_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_19_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_19_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_20_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_20_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_20_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_20_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_20_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_21_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_21_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_21_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_21_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_21_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_22_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_22_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_22_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_22_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_22_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_23_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_23_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_23_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_23_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_23_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_24_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_24_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_24_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_24_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_24_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_25_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_25_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_25_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_25_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_25_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_26_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_26_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_26_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_26_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_26_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_27_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_27_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_27_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_27_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_27_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_28_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_28_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_28_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_28_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_28_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_29_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_29_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_29_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_29_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_29_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_30_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_30_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_30_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_30_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_30_io_out_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_31_io_in_a; // @[Adder_N.scala 15:35]
  wire  Full_Adder_31_io_in_b; // @[Adder_N.scala 15:35]
  wire  Full_Adder_31_io_in_c; // @[Adder_N.scala 15:35]
  wire  Full_Adder_31_io_out_s; // @[Adder_N.scala 15:35]
  wire  Full_Adder_31_io_out_c; // @[Adder_N.scala 15:35]
  wire  sum_1 = Full_Adder_1_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_0 = Full_Adder_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_3 = Full_Adder_3_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_2 = Full_Adder_2_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_5 = Full_Adder_5_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_4 = Full_Adder_4_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_7 = Full_Adder_7_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_6 = Full_Adder_6_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire [7:0] io_Sum_lo_lo = {sum_7,sum_6,sum_5,sum_4,sum_3,sum_2,sum_1,sum_0}; // @[Adder_N.scala 31:19]
  wire  sum_9 = Full_Adder_9_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_8 = Full_Adder_8_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_11 = Full_Adder_11_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_10 = Full_Adder_10_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_13 = Full_Adder_13_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_12 = Full_Adder_12_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_15 = Full_Adder_15_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_14 = Full_Adder_14_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire [15:0] io_Sum_lo = {sum_15,sum_14,sum_13,sum_12,sum_11,sum_10,sum_9,sum_8,io_Sum_lo_lo}; // @[Adder_N.scala 31:19]
  wire  sum_17 = Full_Adder_17_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_16 = Full_Adder_16_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_19 = Full_Adder_19_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_18 = Full_Adder_18_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_21 = Full_Adder_21_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_20 = Full_Adder_20_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_23 = Full_Adder_23_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_22 = Full_Adder_22_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire [7:0] io_Sum_hi_lo = {sum_23,sum_22,sum_21,sum_20,sum_19,sum_18,sum_17,sum_16}; // @[Adder_N.scala 31:19]
  wire  sum_25 = Full_Adder_25_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_24 = Full_Adder_24_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_27 = Full_Adder_27_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_26 = Full_Adder_26_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_29 = Full_Adder_29_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_28 = Full_Adder_28_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_31 = Full_Adder_31_io_out_s; // @[Adder_N.scala 18:19 28:16]
  wire  sum_30 = Full_Adder_30_io_out_s; // @[Adder_N.scala 18:19 28:16]
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
  Full_Adder Full_Adder_8 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_8_io_in_a),
    .io_in_b(Full_Adder_8_io_in_b),
    .io_in_c(Full_Adder_8_io_in_c),
    .io_out_s(Full_Adder_8_io_out_s),
    .io_out_c(Full_Adder_8_io_out_c)
  );
  Full_Adder Full_Adder_9 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_9_io_in_a),
    .io_in_b(Full_Adder_9_io_in_b),
    .io_in_c(Full_Adder_9_io_in_c),
    .io_out_s(Full_Adder_9_io_out_s),
    .io_out_c(Full_Adder_9_io_out_c)
  );
  Full_Adder Full_Adder_10 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_10_io_in_a),
    .io_in_b(Full_Adder_10_io_in_b),
    .io_in_c(Full_Adder_10_io_in_c),
    .io_out_s(Full_Adder_10_io_out_s),
    .io_out_c(Full_Adder_10_io_out_c)
  );
  Full_Adder Full_Adder_11 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_11_io_in_a),
    .io_in_b(Full_Adder_11_io_in_b),
    .io_in_c(Full_Adder_11_io_in_c),
    .io_out_s(Full_Adder_11_io_out_s),
    .io_out_c(Full_Adder_11_io_out_c)
  );
  Full_Adder Full_Adder_12 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_12_io_in_a),
    .io_in_b(Full_Adder_12_io_in_b),
    .io_in_c(Full_Adder_12_io_in_c),
    .io_out_s(Full_Adder_12_io_out_s),
    .io_out_c(Full_Adder_12_io_out_c)
  );
  Full_Adder Full_Adder_13 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_13_io_in_a),
    .io_in_b(Full_Adder_13_io_in_b),
    .io_in_c(Full_Adder_13_io_in_c),
    .io_out_s(Full_Adder_13_io_out_s),
    .io_out_c(Full_Adder_13_io_out_c)
  );
  Full_Adder Full_Adder_14 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_14_io_in_a),
    .io_in_b(Full_Adder_14_io_in_b),
    .io_in_c(Full_Adder_14_io_in_c),
    .io_out_s(Full_Adder_14_io_out_s),
    .io_out_c(Full_Adder_14_io_out_c)
  );
  Full_Adder Full_Adder_15 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_15_io_in_a),
    .io_in_b(Full_Adder_15_io_in_b),
    .io_in_c(Full_Adder_15_io_in_c),
    .io_out_s(Full_Adder_15_io_out_s),
    .io_out_c(Full_Adder_15_io_out_c)
  );
  Full_Adder Full_Adder_16 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_16_io_in_a),
    .io_in_b(Full_Adder_16_io_in_b),
    .io_in_c(Full_Adder_16_io_in_c),
    .io_out_s(Full_Adder_16_io_out_s),
    .io_out_c(Full_Adder_16_io_out_c)
  );
  Full_Adder Full_Adder_17 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_17_io_in_a),
    .io_in_b(Full_Adder_17_io_in_b),
    .io_in_c(Full_Adder_17_io_in_c),
    .io_out_s(Full_Adder_17_io_out_s),
    .io_out_c(Full_Adder_17_io_out_c)
  );
  Full_Adder Full_Adder_18 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_18_io_in_a),
    .io_in_b(Full_Adder_18_io_in_b),
    .io_in_c(Full_Adder_18_io_in_c),
    .io_out_s(Full_Adder_18_io_out_s),
    .io_out_c(Full_Adder_18_io_out_c)
  );
  Full_Adder Full_Adder_19 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_19_io_in_a),
    .io_in_b(Full_Adder_19_io_in_b),
    .io_in_c(Full_Adder_19_io_in_c),
    .io_out_s(Full_Adder_19_io_out_s),
    .io_out_c(Full_Adder_19_io_out_c)
  );
  Full_Adder Full_Adder_20 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_20_io_in_a),
    .io_in_b(Full_Adder_20_io_in_b),
    .io_in_c(Full_Adder_20_io_in_c),
    .io_out_s(Full_Adder_20_io_out_s),
    .io_out_c(Full_Adder_20_io_out_c)
  );
  Full_Adder Full_Adder_21 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_21_io_in_a),
    .io_in_b(Full_Adder_21_io_in_b),
    .io_in_c(Full_Adder_21_io_in_c),
    .io_out_s(Full_Adder_21_io_out_s),
    .io_out_c(Full_Adder_21_io_out_c)
  );
  Full_Adder Full_Adder_22 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_22_io_in_a),
    .io_in_b(Full_Adder_22_io_in_b),
    .io_in_c(Full_Adder_22_io_in_c),
    .io_out_s(Full_Adder_22_io_out_s),
    .io_out_c(Full_Adder_22_io_out_c)
  );
  Full_Adder Full_Adder_23 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_23_io_in_a),
    .io_in_b(Full_Adder_23_io_in_b),
    .io_in_c(Full_Adder_23_io_in_c),
    .io_out_s(Full_Adder_23_io_out_s),
    .io_out_c(Full_Adder_23_io_out_c)
  );
  Full_Adder Full_Adder_24 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_24_io_in_a),
    .io_in_b(Full_Adder_24_io_in_b),
    .io_in_c(Full_Adder_24_io_in_c),
    .io_out_s(Full_Adder_24_io_out_s),
    .io_out_c(Full_Adder_24_io_out_c)
  );
  Full_Adder Full_Adder_25 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_25_io_in_a),
    .io_in_b(Full_Adder_25_io_in_b),
    .io_in_c(Full_Adder_25_io_in_c),
    .io_out_s(Full_Adder_25_io_out_s),
    .io_out_c(Full_Adder_25_io_out_c)
  );
  Full_Adder Full_Adder_26 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_26_io_in_a),
    .io_in_b(Full_Adder_26_io_in_b),
    .io_in_c(Full_Adder_26_io_in_c),
    .io_out_s(Full_Adder_26_io_out_s),
    .io_out_c(Full_Adder_26_io_out_c)
  );
  Full_Adder Full_Adder_27 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_27_io_in_a),
    .io_in_b(Full_Adder_27_io_in_b),
    .io_in_c(Full_Adder_27_io_in_c),
    .io_out_s(Full_Adder_27_io_out_s),
    .io_out_c(Full_Adder_27_io_out_c)
  );
  Full_Adder Full_Adder_28 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_28_io_in_a),
    .io_in_b(Full_Adder_28_io_in_b),
    .io_in_c(Full_Adder_28_io_in_c),
    .io_out_s(Full_Adder_28_io_out_s),
    .io_out_c(Full_Adder_28_io_out_c)
  );
  Full_Adder Full_Adder_29 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_29_io_in_a),
    .io_in_b(Full_Adder_29_io_in_b),
    .io_in_c(Full_Adder_29_io_in_c),
    .io_out_s(Full_Adder_29_io_out_s),
    .io_out_c(Full_Adder_29_io_out_c)
  );
  Full_Adder Full_Adder_30 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_30_io_in_a),
    .io_in_b(Full_Adder_30_io_in_b),
    .io_in_c(Full_Adder_30_io_in_c),
    .io_out_s(Full_Adder_30_io_out_s),
    .io_out_c(Full_Adder_30_io_out_c)
  );
  Full_Adder Full_Adder_31 ( // @[Adder_N.scala 15:35]
    .io_in_a(Full_Adder_31_io_in_a),
    .io_in_b(Full_Adder_31_io_in_b),
    .io_in_c(Full_Adder_31_io_in_c),
    .io_out_s(Full_Adder_31_io_out_s),
    .io_out_c(Full_Adder_31_io_out_c)
  );
  assign io_Sum = {sum_31,sum_30,sum_29,sum_28,sum_27,sum_26,sum_25,sum_24,io_Sum_hi_lo,io_Sum_lo}; // @[Adder_N.scala 31:26]
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
  assign Full_Adder_8_io_in_a = io_A[8]; // @[Adder_N.scala 24:28]
  assign Full_Adder_8_io_in_b = io_B[8]; // @[Adder_N.scala 25:28]
  assign Full_Adder_8_io_in_c = Full_Adder_7_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_9_io_in_a = io_A[9]; // @[Adder_N.scala 24:28]
  assign Full_Adder_9_io_in_b = io_B[9]; // @[Adder_N.scala 25:28]
  assign Full_Adder_9_io_in_c = Full_Adder_8_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_10_io_in_a = io_A[10]; // @[Adder_N.scala 24:28]
  assign Full_Adder_10_io_in_b = io_B[10]; // @[Adder_N.scala 25:28]
  assign Full_Adder_10_io_in_c = Full_Adder_9_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_11_io_in_a = io_A[11]; // @[Adder_N.scala 24:28]
  assign Full_Adder_11_io_in_b = io_B[11]; // @[Adder_N.scala 25:28]
  assign Full_Adder_11_io_in_c = Full_Adder_10_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_12_io_in_a = io_A[12]; // @[Adder_N.scala 24:28]
  assign Full_Adder_12_io_in_b = io_B[12]; // @[Adder_N.scala 25:28]
  assign Full_Adder_12_io_in_c = Full_Adder_11_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_13_io_in_a = io_A[13]; // @[Adder_N.scala 24:28]
  assign Full_Adder_13_io_in_b = io_B[13]; // @[Adder_N.scala 25:28]
  assign Full_Adder_13_io_in_c = Full_Adder_12_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_14_io_in_a = io_A[14]; // @[Adder_N.scala 24:28]
  assign Full_Adder_14_io_in_b = io_B[14]; // @[Adder_N.scala 25:28]
  assign Full_Adder_14_io_in_c = Full_Adder_13_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_15_io_in_a = io_A[15]; // @[Adder_N.scala 24:28]
  assign Full_Adder_15_io_in_b = io_B[15]; // @[Adder_N.scala 25:28]
  assign Full_Adder_15_io_in_c = Full_Adder_14_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_16_io_in_a = io_A[16]; // @[Adder_N.scala 24:28]
  assign Full_Adder_16_io_in_b = io_B[16]; // @[Adder_N.scala 25:28]
  assign Full_Adder_16_io_in_c = Full_Adder_15_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_17_io_in_a = io_A[17]; // @[Adder_N.scala 24:28]
  assign Full_Adder_17_io_in_b = io_B[17]; // @[Adder_N.scala 25:28]
  assign Full_Adder_17_io_in_c = Full_Adder_16_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_18_io_in_a = io_A[18]; // @[Adder_N.scala 24:28]
  assign Full_Adder_18_io_in_b = io_B[18]; // @[Adder_N.scala 25:28]
  assign Full_Adder_18_io_in_c = Full_Adder_17_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_19_io_in_a = io_A[19]; // @[Adder_N.scala 24:28]
  assign Full_Adder_19_io_in_b = io_B[19]; // @[Adder_N.scala 25:28]
  assign Full_Adder_19_io_in_c = Full_Adder_18_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_20_io_in_a = io_A[20]; // @[Adder_N.scala 24:28]
  assign Full_Adder_20_io_in_b = io_B[20]; // @[Adder_N.scala 25:28]
  assign Full_Adder_20_io_in_c = Full_Adder_19_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_21_io_in_a = io_A[21]; // @[Adder_N.scala 24:28]
  assign Full_Adder_21_io_in_b = io_B[21]; // @[Adder_N.scala 25:28]
  assign Full_Adder_21_io_in_c = Full_Adder_20_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_22_io_in_a = io_A[22]; // @[Adder_N.scala 24:28]
  assign Full_Adder_22_io_in_b = io_B[22]; // @[Adder_N.scala 25:28]
  assign Full_Adder_22_io_in_c = Full_Adder_21_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_23_io_in_a = io_A[23]; // @[Adder_N.scala 24:28]
  assign Full_Adder_23_io_in_b = io_B[23]; // @[Adder_N.scala 25:28]
  assign Full_Adder_23_io_in_c = Full_Adder_22_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_24_io_in_a = io_A[24]; // @[Adder_N.scala 24:28]
  assign Full_Adder_24_io_in_b = io_B[24]; // @[Adder_N.scala 25:28]
  assign Full_Adder_24_io_in_c = Full_Adder_23_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_25_io_in_a = io_A[25]; // @[Adder_N.scala 24:28]
  assign Full_Adder_25_io_in_b = io_B[25]; // @[Adder_N.scala 25:28]
  assign Full_Adder_25_io_in_c = Full_Adder_24_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_26_io_in_a = io_A[26]; // @[Adder_N.scala 24:28]
  assign Full_Adder_26_io_in_b = io_B[26]; // @[Adder_N.scala 25:28]
  assign Full_Adder_26_io_in_c = Full_Adder_25_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_27_io_in_a = io_A[27]; // @[Adder_N.scala 24:28]
  assign Full_Adder_27_io_in_b = io_B[27]; // @[Adder_N.scala 25:28]
  assign Full_Adder_27_io_in_c = Full_Adder_26_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_28_io_in_a = io_A[28]; // @[Adder_N.scala 24:28]
  assign Full_Adder_28_io_in_b = io_B[28]; // @[Adder_N.scala 25:28]
  assign Full_Adder_28_io_in_c = Full_Adder_27_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_29_io_in_a = io_A[29]; // @[Adder_N.scala 24:28]
  assign Full_Adder_29_io_in_b = io_B[29]; // @[Adder_N.scala 25:28]
  assign Full_Adder_29_io_in_c = Full_Adder_28_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_30_io_in_a = io_A[30]; // @[Adder_N.scala 24:28]
  assign Full_Adder_30_io_in_b = io_B[30]; // @[Adder_N.scala 25:28]
  assign Full_Adder_30_io_in_c = Full_Adder_29_io_out_c; // @[Adder_N.scala 17:21 27:20]
  assign Full_Adder_31_io_in_a = io_A[31]; // @[Adder_N.scala 24:28]
  assign Full_Adder_31_io_in_b = io_B[31]; // @[Adder_N.scala 25:28]
  assign Full_Adder_31_io_in_c = Full_Adder_30_io_out_c; // @[Adder_N.scala 17:21 27:20]
endmodule
module NOT(
  input  [31:0] io_in_a,
  output [31:0] io_out_not_a
);
  assign io_out_not_a = ~io_in_a; // @[NOT.scala 11:21]
endmodule
module AND(
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_and
);
  assign io_out_and = io_in_a & io_in_b; // @[AND.scala 12:26]
endmodule
module OR(
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_or
);
  assign io_out_or = io_in_a | io_in_b; // @[OR.scala 12:25]
endmodule
module XOR(
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_xor
);
  assign io_out_xor = io_in_a ^ io_in_b; // @[XOR.scala 12:26]
endmodule
module COMP(
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output        io_out_comp
);
  assign io_out_comp = $signed(io_in_a) < $signed(io_in_b); // @[COMP.scala 11:18]
endmodule
module IsEqual(
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output        io_out_equal
);
  assign io_out_equal = $signed(io_in_a) == $signed(io_in_b); // @[IsEqual.scala 11:18]
endmodule
module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  input  [2:0]  io_in_sel,
  output [31:0] io_out_result,
  output        io_out_overflow,
  output        io_out_zero,
  output [31:0] io_out_xor,
  output [31:0] io_out_and,
  output [31:0] io_out_or,
  output [31:0] io_out_not,
  output        io_out_compare,
  output        io_out_equal
);
  wire [31:0] Adder_8Module_io_A; // @[ALU.scala 30:31]
  wire [31:0] Adder_8Module_io_B; // @[ALU.scala 30:31]
  wire [31:0] Adder_8Module_io_Sum; // @[ALU.scala 30:31]
  wire [31:0] Adder_8Module_1_io_A; // @[ALU.scala 49:31]
  wire [31:0] Adder_8Module_1_io_B; // @[ALU.scala 49:31]
  wire [31:0] Adder_8Module_1_io_Sum; // @[ALU.scala 49:31]
  wire [31:0] NotModule_io_in_a; // @[ALU.scala 72:27]
  wire [31:0] NotModule_io_out_not_a; // @[ALU.scala 72:27]
  wire [31:0] ANDModule_io_in_a; // @[ALU.scala 89:27]
  wire [31:0] ANDModule_io_in_b; // @[ALU.scala 89:27]
  wire [31:0] ANDModule_io_out_and; // @[ALU.scala 89:27]
  wire [31:0] ORModule_io_in_a; // @[ALU.scala 107:26]
  wire [31:0] ORModule_io_in_b; // @[ALU.scala 107:26]
  wire [31:0] ORModule_io_out_or; // @[ALU.scala 107:26]
  wire [31:0] XORModule_io_in_a; // @[ALU.scala 125:27]
  wire [31:0] XORModule_io_in_b; // @[ALU.scala 125:27]
  wire [31:0] XORModule_io_out_xor; // @[ALU.scala 125:27]
  wire [31:0] COMPModule_io_in_a; // @[ALU.scala 142:28]
  wire [31:0] COMPModule_io_in_b; // @[ALU.scala 142:28]
  wire  COMPModule_io_out_comp; // @[ALU.scala 142:28]
  wire [31:0] IsEqualModule_io_in_a; // @[ALU.scala 160:31]
  wire [31:0] IsEqualModule_io_in_b; // @[ALU.scala 160:31]
  wire  IsEqualModule_io_out_equal; // @[ALU.scala 160:31]
  wire  _io_out_overflow_T_2 = io_in_a[31] == io_in_b[31]; // @[ALU.scala 36:37]
  wire  _io_out_overflow_T_5 = Adder_8Module_io_Sum[31] != io_in_a[31]; // @[ALU.scala 37:51]
  wire [31:0] _io_out_zero_T_2 = ~io_out_result; // @[ALU.scala 38:20]
  wire  _io_out_overflow_T_12 = Adder_8Module_1_io_Sum[31] != io_in_a[31]; // @[ALU.scala 56:51]
  wire  _GEN_0 = io_in_sel == 3'h7 & IsEqualModule_io_out_equal; // @[ALU.scala 158:30 163:18 183:20]
  wire  _GEN_3 = io_in_sel == 3'h6 & COMPModule_io_out_comp; // @[ALU.scala 140:30 145:20]
  wire  _GEN_6 = io_in_sel == 3'h6 ? 1'h0 : _GEN_0; // @[ALU.scala 140:30 153:20]
  wire [31:0] _GEN_7 = io_in_sel == 3'h5 ? XORModule_io_out_xor : 32'h0; // @[ALU.scala 121:30 128:16]
  wire  _GEN_10 = io_in_sel == 3'h5 ? 1'h0 : _GEN_3; // @[ALU.scala 121:30 135:20]
  wire  _GEN_11 = io_in_sel == 3'h5 ? 1'h0 : _GEN_6; // @[ALU.scala 121:30 136:20]
  wire [31:0] _GEN_12 = io_in_sel == 3'h4 ? ORModule_io_out_or : 32'h0; // @[ALU.scala 103:30 110:15]
  wire [31:0] _GEN_15 = io_in_sel == 3'h4 ? 32'h0 : _GEN_7; // @[ALU.scala 103:30 114:20]
  wire  _GEN_16 = io_in_sel == 3'h4 ? 1'h0 : _GEN_10; // @[ALU.scala 103:30 117:20]
  wire  _GEN_17 = io_in_sel == 3'h4 ? 1'h0 : _GEN_11; // @[ALU.scala 103:30 118:20]
  wire [31:0] _GEN_18 = io_in_sel == 3'h3 ? ANDModule_io_out_and : 32'h0; // @[ALU.scala 85:30 92:16]
  wire [31:0] _GEN_21 = io_in_sel == 3'h3 ? 32'h0 : _GEN_15; // @[ALU.scala 85:30 96:20]
  wire [31:0] _GEN_22 = io_in_sel == 3'h3 ? 32'h0 : _GEN_12; // @[ALU.scala 85:30 97:20]
  wire  _GEN_23 = io_in_sel == 3'h3 ? 1'h0 : _GEN_16; // @[ALU.scala 85:30 99:20]
  wire  _GEN_24 = io_in_sel == 3'h3 ? 1'h0 : _GEN_17; // @[ALU.scala 100:20 85:30]
  wire [31:0] _GEN_25 = io_in_sel == 3'h2 ? NotModule_io_out_not_a : 32'h0; // @[ALU.scala 69:30 74:16]
  wire [31:0] _GEN_28 = io_in_sel == 3'h2 ? 32'h0 : _GEN_21; // @[ALU.scala 69:30 78:20]
  wire [31:0] _GEN_29 = io_in_sel == 3'h2 ? 32'h0 : _GEN_18; // @[ALU.scala 69:30 79:20]
  wire [31:0] _GEN_30 = io_in_sel == 3'h2 ? 32'h0 : _GEN_22; // @[ALU.scala 69:30 80:20]
  wire  _GEN_31 = io_in_sel == 3'h2 ? 1'h0 : _GEN_23; // @[ALU.scala 69:30 81:20]
  wire  _GEN_32 = io_in_sel == 3'h2 ? 1'h0 : _GEN_24; // @[ALU.scala 69:30 82:20]
  wire [31:0] _GEN_34 = io_in_sel == 3'h0 ? $signed(Adder_8Module_1_io_Sum) : $signed(32'sh0); // @[ALU.scala 48:30 54:19]
  wire  _GEN_35 = io_in_sel == 3'h0 & (_io_out_overflow_T_2 & _io_out_overflow_T_12); // @[ALU.scala 48:30 55:21]
  wire [31:0] _GEN_36 = io_in_sel == 3'h0 ? _io_out_zero_T_2 : 32'h0; // @[ALU.scala 48:30 57:17]
  wire [31:0] _GEN_37 = io_in_sel == 3'h0 ? 32'h0 : _GEN_28; // @[ALU.scala 48:30 61:20]
  wire [31:0] _GEN_38 = io_in_sel == 3'h0 ? 32'h0 : _GEN_29; // @[ALU.scala 48:30 62:20]
  wire [31:0] _GEN_39 = io_in_sel == 3'h0 ? 32'h0 : _GEN_30; // @[ALU.scala 48:30 63:20]
  wire [31:0] _GEN_40 = io_in_sel == 3'h0 ? 32'h0 : _GEN_25; // @[ALU.scala 48:30 64:20]
  wire  _GEN_41 = io_in_sel == 3'h0 ? 1'h0 : _GEN_31; // @[ALU.scala 48:30 65:20]
  wire  _GEN_42 = io_in_sel == 3'h0 ? 1'h0 : _GEN_32; // @[ALU.scala 48:30 66:20]
  wire [31:0] _GEN_46 = io_in_sel == 3'h1 ? _io_out_zero_T_2 : _GEN_36; // @[ALU.scala 29:24 38:17]
  Adder_N Adder_8Module ( // @[ALU.scala 30:31]
    .io_A(Adder_8Module_io_A),
    .io_B(Adder_8Module_io_B),
    .io_Sum(Adder_8Module_io_Sum)
  );
  Adder_N Adder_8Module_1 ( // @[ALU.scala 49:31]
    .io_A(Adder_8Module_1_io_A),
    .io_B(Adder_8Module_1_io_B),
    .io_Sum(Adder_8Module_1_io_Sum)
  );
  NOT NotModule ( // @[ALU.scala 72:27]
    .io_in_a(NotModule_io_in_a),
    .io_out_not_a(NotModule_io_out_not_a)
  );
  AND ANDModule ( // @[ALU.scala 89:27]
    .io_in_a(ANDModule_io_in_a),
    .io_in_b(ANDModule_io_in_b),
    .io_out_and(ANDModule_io_out_and)
  );
  OR ORModule ( // @[ALU.scala 107:26]
    .io_in_a(ORModule_io_in_a),
    .io_in_b(ORModule_io_in_b),
    .io_out_or(ORModule_io_out_or)
  );
  XOR XORModule ( // @[ALU.scala 125:27]
    .io_in_a(XORModule_io_in_a),
    .io_in_b(XORModule_io_in_b),
    .io_out_xor(XORModule_io_out_xor)
  );
  COMP COMPModule ( // @[ALU.scala 142:28]
    .io_in_a(COMPModule_io_in_a),
    .io_in_b(COMPModule_io_in_b),
    .io_out_comp(COMPModule_io_out_comp)
  );
  IsEqual IsEqualModule ( // @[ALU.scala 160:31]
    .io_in_a(IsEqualModule_io_in_a),
    .io_in_b(IsEqualModule_io_in_b),
    .io_out_equal(IsEqualModule_io_out_equal)
  );
  assign io_out_result = io_in_sel == 3'h1 ? $signed(Adder_8Module_io_Sum) : $signed(_GEN_34); // @[ALU.scala 29:24 35:19]
  assign io_out_overflow = io_in_sel == 3'h1 ? io_in_a[31] == io_in_b[31] & _io_out_overflow_T_5 : _GEN_35; // @[ALU.scala 29:24 36:21]
  assign io_out_zero = _GEN_46[0];
  assign io_out_xor = io_in_sel == 3'h1 ? 32'h0 : _GEN_37; // @[ALU.scala 29:24 40:20]
  assign io_out_and = io_in_sel == 3'h1 ? 32'h0 : _GEN_38; // @[ALU.scala 29:24 41:20]
  assign io_out_or = io_in_sel == 3'h1 ? 32'h0 : _GEN_39; // @[ALU.scala 29:24 42:20]
  assign io_out_not = io_in_sel == 3'h1 ? 32'h0 : _GEN_40; // @[ALU.scala 29:24 43:20]
  assign io_out_compare = io_in_sel == 3'h1 ? 1'h0 : _GEN_41; // @[ALU.scala 29:24 44:20]
  assign io_out_equal = io_in_sel == 3'h1 ? 1'h0 : _GEN_42; // @[ALU.scala 29:24 45:20]
  assign Adder_8Module_io_A = io_in_a; // @[ALU.scala 33:24]
  assign Adder_8Module_io_B = 32'sh0; // @[ALU.scala 23:20]
  assign Adder_8Module_1_io_A = io_in_a; // @[ALU.scala 52:24]
  assign Adder_8Module_1_io_B = io_in_b; // @[ALU.scala 53:24]
  assign NotModule_io_in_a = io_in_a; // @[ALU.scala 71:26]
  assign ANDModule_io_in_a = io_in_a; // @[ALU.scala 87:26]
  assign ANDModule_io_in_b = io_in_b; // @[ALU.scala 88:26]
  assign ORModule_io_in_a = io_in_a; // @[ALU.scala 105:26]
  assign ORModule_io_in_b = io_in_b; // @[ALU.scala 106:26]
  assign XORModule_io_in_a = io_in_a; // @[ALU.scala 123:26]
  assign XORModule_io_in_b = io_in_b; // @[ALU.scala 124:26]
  assign COMPModule_io_in_a = io_in_a; // @[ALU.scala 143:24]
  assign COMPModule_io_in_b = io_in_b; // @[ALU.scala 144:24]
  assign IsEqualModule_io_in_a = io_in_a; // @[ALU.scala 161:27]
  assign IsEqualModule_io_in_b = io_in_b; // @[ALU.scala 162:27]
endmodule
