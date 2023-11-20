circuit ALU :
  module Full_Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<1>
    input io_in_b : UInt<1>
    input io_in_c : UInt<1>
    output io_out_s : UInt<1>
    output io_out_c : UInt<1>

    node a_xor_b = xor(io_in_a, io_in_b) @[FA.scala 15:27]
    node a_and_b = and(io_in_a, io_in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io_in_c, a_xor_b) @[FA.scala 17:25]
    node c_and_axorb = and(io_in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io_out_s <= _io_out_s_T @[FA.scala 17:14]
    io_out_c <= _io_out_c_T @[FA.scala 21:14]

  module Adder_N :
    input clock : Clock
    input reset : UInt<1>
    input io_A : SInt<32>
    input io_B : SInt<32>
    input io_Cin : UInt<1>
    output io_Sum : SInt<32>
    output io_Cout : UInt<1>

    inst Full_Adder of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_1 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_2 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_3 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_4 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_5 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_6 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_7 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_8 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_9 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_10 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_11 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_12 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_13 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_14 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_15 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_16 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_17 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_18 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_19 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_20 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_21 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_22 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_23 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_24 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_25 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_26 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_27 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_28 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_29 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_30 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_31 of Full_Adder @[Adder_N.scala 15:35]
    node _T = bits(io_A, 0, 0) @[Adder_N.scala 24:28]
    node _T_1 = bits(io_B, 0, 0) @[Adder_N.scala 25:28]
    node _T_2 = bits(io_A, 1, 1) @[Adder_N.scala 24:28]
    node _T_3 = bits(io_B, 1, 1) @[Adder_N.scala 25:28]
    node _T_4 = bits(io_A, 2, 2) @[Adder_N.scala 24:28]
    node _T_5 = bits(io_B, 2, 2) @[Adder_N.scala 25:28]
    node _T_6 = bits(io_A, 3, 3) @[Adder_N.scala 24:28]
    node _T_7 = bits(io_B, 3, 3) @[Adder_N.scala 25:28]
    node _T_8 = bits(io_A, 4, 4) @[Adder_N.scala 24:28]
    node _T_9 = bits(io_B, 4, 4) @[Adder_N.scala 25:28]
    node _T_10 = bits(io_A, 5, 5) @[Adder_N.scala 24:28]
    node _T_11 = bits(io_B, 5, 5) @[Adder_N.scala 25:28]
    node _T_12 = bits(io_A, 6, 6) @[Adder_N.scala 24:28]
    node _T_13 = bits(io_B, 6, 6) @[Adder_N.scala 25:28]
    node _T_14 = bits(io_A, 7, 7) @[Adder_N.scala 24:28]
    node _T_15 = bits(io_B, 7, 7) @[Adder_N.scala 25:28]
    node _T_16 = bits(io_A, 8, 8) @[Adder_N.scala 24:28]
    node _T_17 = bits(io_B, 8, 8) @[Adder_N.scala 25:28]
    node _T_18 = bits(io_A, 9, 9) @[Adder_N.scala 24:28]
    node _T_19 = bits(io_B, 9, 9) @[Adder_N.scala 25:28]
    node _T_20 = bits(io_A, 10, 10) @[Adder_N.scala 24:28]
    node _T_21 = bits(io_B, 10, 10) @[Adder_N.scala 25:28]
    node _T_22 = bits(io_A, 11, 11) @[Adder_N.scala 24:28]
    node _T_23 = bits(io_B, 11, 11) @[Adder_N.scala 25:28]
    node _T_24 = bits(io_A, 12, 12) @[Adder_N.scala 24:28]
    node _T_25 = bits(io_B, 12, 12) @[Adder_N.scala 25:28]
    node _T_26 = bits(io_A, 13, 13) @[Adder_N.scala 24:28]
    node _T_27 = bits(io_B, 13, 13) @[Adder_N.scala 25:28]
    node _T_28 = bits(io_A, 14, 14) @[Adder_N.scala 24:28]
    node _T_29 = bits(io_B, 14, 14) @[Adder_N.scala 25:28]
    node _T_30 = bits(io_A, 15, 15) @[Adder_N.scala 24:28]
    node _T_31 = bits(io_B, 15, 15) @[Adder_N.scala 25:28]
    node _T_32 = bits(io_A, 16, 16) @[Adder_N.scala 24:28]
    node _T_33 = bits(io_B, 16, 16) @[Adder_N.scala 25:28]
    node _T_34 = bits(io_A, 17, 17) @[Adder_N.scala 24:28]
    node _T_35 = bits(io_B, 17, 17) @[Adder_N.scala 25:28]
    node _T_36 = bits(io_A, 18, 18) @[Adder_N.scala 24:28]
    node _T_37 = bits(io_B, 18, 18) @[Adder_N.scala 25:28]
    node _T_38 = bits(io_A, 19, 19) @[Adder_N.scala 24:28]
    node _T_39 = bits(io_B, 19, 19) @[Adder_N.scala 25:28]
    node _T_40 = bits(io_A, 20, 20) @[Adder_N.scala 24:28]
    node _T_41 = bits(io_B, 20, 20) @[Adder_N.scala 25:28]
    node _T_42 = bits(io_A, 21, 21) @[Adder_N.scala 24:28]
    node _T_43 = bits(io_B, 21, 21) @[Adder_N.scala 25:28]
    node _T_44 = bits(io_A, 22, 22) @[Adder_N.scala 24:28]
    node _T_45 = bits(io_B, 22, 22) @[Adder_N.scala 25:28]
    node _T_46 = bits(io_A, 23, 23) @[Adder_N.scala 24:28]
    node _T_47 = bits(io_B, 23, 23) @[Adder_N.scala 25:28]
    node _T_48 = bits(io_A, 24, 24) @[Adder_N.scala 24:28]
    node _T_49 = bits(io_B, 24, 24) @[Adder_N.scala 25:28]
    node _T_50 = bits(io_A, 25, 25) @[Adder_N.scala 24:28]
    node _T_51 = bits(io_B, 25, 25) @[Adder_N.scala 25:28]
    node _T_52 = bits(io_A, 26, 26) @[Adder_N.scala 24:28]
    node _T_53 = bits(io_B, 26, 26) @[Adder_N.scala 25:28]
    node _T_54 = bits(io_A, 27, 27) @[Adder_N.scala 24:28]
    node _T_55 = bits(io_B, 27, 27) @[Adder_N.scala 25:28]
    node _T_56 = bits(io_A, 28, 28) @[Adder_N.scala 24:28]
    node _T_57 = bits(io_B, 28, 28) @[Adder_N.scala 25:28]
    node _T_58 = bits(io_A, 29, 29) @[Adder_N.scala 24:28]
    node _T_59 = bits(io_B, 29, 29) @[Adder_N.scala 25:28]
    node _T_60 = bits(io_A, 30, 30) @[Adder_N.scala 24:28]
    node _T_61 = bits(io_B, 30, 30) @[Adder_N.scala 25:28]
    node _T_62 = bits(io_A, 31, 31) @[Adder_N.scala 24:28]
    node _T_63 = bits(io_B, 31, 31) @[Adder_N.scala 25:28]
    node sum_1 = Full_Adder_1.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_0 = Full_Adder.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_lo_lo_lo = cat(sum_1, sum_0) @[Adder_N.scala 31:19]
    node sum_3 = Full_Adder_3.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_2 = Full_Adder_2.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_lo_lo_hi = cat(sum_3, sum_2) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_lo = cat(io_Sum_lo_lo_lo_hi, io_Sum_lo_lo_lo_lo) @[Adder_N.scala 31:19]
    node sum_5 = Full_Adder_5.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_4 = Full_Adder_4.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_lo_hi_lo = cat(sum_5, sum_4) @[Adder_N.scala 31:19]
    node sum_7 = Full_Adder_7.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_6 = Full_Adder_6.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_lo_hi_hi = cat(sum_7, sum_6) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi = cat(io_Sum_lo_lo_hi_hi, io_Sum_lo_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo = cat(io_Sum_lo_lo_hi, io_Sum_lo_lo_lo) @[Adder_N.scala 31:19]
    node sum_9 = Full_Adder_9.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_8 = Full_Adder_8.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_hi_lo_lo = cat(sum_9, sum_8) @[Adder_N.scala 31:19]
    node sum_11 = Full_Adder_11.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_10 = Full_Adder_10.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_hi_lo_hi = cat(sum_11, sum_10) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo = cat(io_Sum_lo_hi_lo_hi, io_Sum_lo_hi_lo_lo) @[Adder_N.scala 31:19]
    node sum_13 = Full_Adder_13.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_12 = Full_Adder_12.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_hi_hi_lo = cat(sum_13, sum_12) @[Adder_N.scala 31:19]
    node sum_15 = Full_Adder_15.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_14 = Full_Adder_14.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_hi_hi_hi = cat(sum_15, sum_14) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi = cat(io_Sum_lo_hi_hi_hi, io_Sum_lo_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi = cat(io_Sum_lo_hi_hi, io_Sum_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo = cat(io_Sum_lo_hi, io_Sum_lo_lo) @[Adder_N.scala 31:19]
    node sum_17 = Full_Adder_17.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_16 = Full_Adder_16.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_lo_lo_lo = cat(sum_17, sum_16) @[Adder_N.scala 31:19]
    node sum_19 = Full_Adder_19.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_18 = Full_Adder_18.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_lo_lo_hi = cat(sum_19, sum_18) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo = cat(io_Sum_hi_lo_lo_hi, io_Sum_hi_lo_lo_lo) @[Adder_N.scala 31:19]
    node sum_21 = Full_Adder_21.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_20 = Full_Adder_20.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_lo_hi_lo = cat(sum_21, sum_20) @[Adder_N.scala 31:19]
    node sum_23 = Full_Adder_23.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_22 = Full_Adder_22.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_lo_hi_hi = cat(sum_23, sum_22) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi = cat(io_Sum_hi_lo_hi_hi, io_Sum_hi_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo = cat(io_Sum_hi_lo_hi, io_Sum_hi_lo_lo) @[Adder_N.scala 31:19]
    node sum_25 = Full_Adder_25.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_24 = Full_Adder_24.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_hi_lo_lo = cat(sum_25, sum_24) @[Adder_N.scala 31:19]
    node sum_27 = Full_Adder_27.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_26 = Full_Adder_26.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_hi_lo_hi = cat(sum_27, sum_26) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo = cat(io_Sum_hi_hi_lo_hi, io_Sum_hi_hi_lo_lo) @[Adder_N.scala 31:19]
    node sum_29 = Full_Adder_29.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_28 = Full_Adder_28.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_hi_hi_lo = cat(sum_29, sum_28) @[Adder_N.scala 31:19]
    node sum_31 = Full_Adder_31.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_30 = Full_Adder_30.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_hi_hi_hi = cat(sum_31, sum_30) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi = cat(io_Sum_hi_hi_hi_hi, io_Sum_hi_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi = cat(io_Sum_hi_hi_hi, io_Sum_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi = cat(io_Sum_hi_hi, io_Sum_hi_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T_1 = asSInt(_io_Sum_T) @[Adder_N.scala 31:26]
    node carry_0 = io_Cin @[Adder_N.scala 17:21 21:14]
    node carry_1 = Full_Adder.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_2 = Full_Adder_1.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_3 = Full_Adder_2.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_4 = Full_Adder_3.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_5 = Full_Adder_4.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_6 = Full_Adder_5.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_7 = Full_Adder_6.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_8 = Full_Adder_7.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_9 = Full_Adder_8.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_10 = Full_Adder_9.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_11 = Full_Adder_10.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_12 = Full_Adder_11.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_13 = Full_Adder_12.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_14 = Full_Adder_13.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_15 = Full_Adder_14.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_16 = Full_Adder_15.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_17 = Full_Adder_16.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_18 = Full_Adder_17.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_19 = Full_Adder_18.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_20 = Full_Adder_19.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_21 = Full_Adder_20.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_22 = Full_Adder_21.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_23 = Full_Adder_22.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_24 = Full_Adder_23.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_25 = Full_Adder_24.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_26 = Full_Adder_25.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_27 = Full_Adder_26.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_28 = Full_Adder_27.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_29 = Full_Adder_28.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_30 = Full_Adder_29.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_31 = Full_Adder_30.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_32 = Full_Adder_31.io_out_c @[Adder_N.scala 17:21 27:20]
    io_Sum <= _io_Sum_T_1 @[Adder_N.scala 31:12]
    io_Cout <= carry_32 @[Adder_N.scala 32:13]
    Full_Adder.clock <= clock
    Full_Adder.reset <= reset
    Full_Adder.io_in_a <= _T @[Adder_N.scala 24:21]
    Full_Adder.io_in_b <= _T_1 @[Adder_N.scala 25:21]
    Full_Adder.io_in_c <= carry_0 @[Adder_N.scala 26:21]
    Full_Adder_1.clock <= clock
    Full_Adder_1.reset <= reset
    Full_Adder_1.io_in_a <= _T_2 @[Adder_N.scala 24:21]
    Full_Adder_1.io_in_b <= _T_3 @[Adder_N.scala 25:21]
    Full_Adder_1.io_in_c <= carry_1 @[Adder_N.scala 26:21]
    Full_Adder_2.clock <= clock
    Full_Adder_2.reset <= reset
    Full_Adder_2.io_in_a <= _T_4 @[Adder_N.scala 24:21]
    Full_Adder_2.io_in_b <= _T_5 @[Adder_N.scala 25:21]
    Full_Adder_2.io_in_c <= carry_2 @[Adder_N.scala 26:21]
    Full_Adder_3.clock <= clock
    Full_Adder_3.reset <= reset
    Full_Adder_3.io_in_a <= _T_6 @[Adder_N.scala 24:21]
    Full_Adder_3.io_in_b <= _T_7 @[Adder_N.scala 25:21]
    Full_Adder_3.io_in_c <= carry_3 @[Adder_N.scala 26:21]
    Full_Adder_4.clock <= clock
    Full_Adder_4.reset <= reset
    Full_Adder_4.io_in_a <= _T_8 @[Adder_N.scala 24:21]
    Full_Adder_4.io_in_b <= _T_9 @[Adder_N.scala 25:21]
    Full_Adder_4.io_in_c <= carry_4 @[Adder_N.scala 26:21]
    Full_Adder_5.clock <= clock
    Full_Adder_5.reset <= reset
    Full_Adder_5.io_in_a <= _T_10 @[Adder_N.scala 24:21]
    Full_Adder_5.io_in_b <= _T_11 @[Adder_N.scala 25:21]
    Full_Adder_5.io_in_c <= carry_5 @[Adder_N.scala 26:21]
    Full_Adder_6.clock <= clock
    Full_Adder_6.reset <= reset
    Full_Adder_6.io_in_a <= _T_12 @[Adder_N.scala 24:21]
    Full_Adder_6.io_in_b <= _T_13 @[Adder_N.scala 25:21]
    Full_Adder_6.io_in_c <= carry_6 @[Adder_N.scala 26:21]
    Full_Adder_7.clock <= clock
    Full_Adder_7.reset <= reset
    Full_Adder_7.io_in_a <= _T_14 @[Adder_N.scala 24:21]
    Full_Adder_7.io_in_b <= _T_15 @[Adder_N.scala 25:21]
    Full_Adder_7.io_in_c <= carry_7 @[Adder_N.scala 26:21]
    Full_Adder_8.clock <= clock
    Full_Adder_8.reset <= reset
    Full_Adder_8.io_in_a <= _T_16 @[Adder_N.scala 24:21]
    Full_Adder_8.io_in_b <= _T_17 @[Adder_N.scala 25:21]
    Full_Adder_8.io_in_c <= carry_8 @[Adder_N.scala 26:21]
    Full_Adder_9.clock <= clock
    Full_Adder_9.reset <= reset
    Full_Adder_9.io_in_a <= _T_18 @[Adder_N.scala 24:21]
    Full_Adder_9.io_in_b <= _T_19 @[Adder_N.scala 25:21]
    Full_Adder_9.io_in_c <= carry_9 @[Adder_N.scala 26:21]
    Full_Adder_10.clock <= clock
    Full_Adder_10.reset <= reset
    Full_Adder_10.io_in_a <= _T_20 @[Adder_N.scala 24:21]
    Full_Adder_10.io_in_b <= _T_21 @[Adder_N.scala 25:21]
    Full_Adder_10.io_in_c <= carry_10 @[Adder_N.scala 26:21]
    Full_Adder_11.clock <= clock
    Full_Adder_11.reset <= reset
    Full_Adder_11.io_in_a <= _T_22 @[Adder_N.scala 24:21]
    Full_Adder_11.io_in_b <= _T_23 @[Adder_N.scala 25:21]
    Full_Adder_11.io_in_c <= carry_11 @[Adder_N.scala 26:21]
    Full_Adder_12.clock <= clock
    Full_Adder_12.reset <= reset
    Full_Adder_12.io_in_a <= _T_24 @[Adder_N.scala 24:21]
    Full_Adder_12.io_in_b <= _T_25 @[Adder_N.scala 25:21]
    Full_Adder_12.io_in_c <= carry_12 @[Adder_N.scala 26:21]
    Full_Adder_13.clock <= clock
    Full_Adder_13.reset <= reset
    Full_Adder_13.io_in_a <= _T_26 @[Adder_N.scala 24:21]
    Full_Adder_13.io_in_b <= _T_27 @[Adder_N.scala 25:21]
    Full_Adder_13.io_in_c <= carry_13 @[Adder_N.scala 26:21]
    Full_Adder_14.clock <= clock
    Full_Adder_14.reset <= reset
    Full_Adder_14.io_in_a <= _T_28 @[Adder_N.scala 24:21]
    Full_Adder_14.io_in_b <= _T_29 @[Adder_N.scala 25:21]
    Full_Adder_14.io_in_c <= carry_14 @[Adder_N.scala 26:21]
    Full_Adder_15.clock <= clock
    Full_Adder_15.reset <= reset
    Full_Adder_15.io_in_a <= _T_30 @[Adder_N.scala 24:21]
    Full_Adder_15.io_in_b <= _T_31 @[Adder_N.scala 25:21]
    Full_Adder_15.io_in_c <= carry_15 @[Adder_N.scala 26:21]
    Full_Adder_16.clock <= clock
    Full_Adder_16.reset <= reset
    Full_Adder_16.io_in_a <= _T_32 @[Adder_N.scala 24:21]
    Full_Adder_16.io_in_b <= _T_33 @[Adder_N.scala 25:21]
    Full_Adder_16.io_in_c <= carry_16 @[Adder_N.scala 26:21]
    Full_Adder_17.clock <= clock
    Full_Adder_17.reset <= reset
    Full_Adder_17.io_in_a <= _T_34 @[Adder_N.scala 24:21]
    Full_Adder_17.io_in_b <= _T_35 @[Adder_N.scala 25:21]
    Full_Adder_17.io_in_c <= carry_17 @[Adder_N.scala 26:21]
    Full_Adder_18.clock <= clock
    Full_Adder_18.reset <= reset
    Full_Adder_18.io_in_a <= _T_36 @[Adder_N.scala 24:21]
    Full_Adder_18.io_in_b <= _T_37 @[Adder_N.scala 25:21]
    Full_Adder_18.io_in_c <= carry_18 @[Adder_N.scala 26:21]
    Full_Adder_19.clock <= clock
    Full_Adder_19.reset <= reset
    Full_Adder_19.io_in_a <= _T_38 @[Adder_N.scala 24:21]
    Full_Adder_19.io_in_b <= _T_39 @[Adder_N.scala 25:21]
    Full_Adder_19.io_in_c <= carry_19 @[Adder_N.scala 26:21]
    Full_Adder_20.clock <= clock
    Full_Adder_20.reset <= reset
    Full_Adder_20.io_in_a <= _T_40 @[Adder_N.scala 24:21]
    Full_Adder_20.io_in_b <= _T_41 @[Adder_N.scala 25:21]
    Full_Adder_20.io_in_c <= carry_20 @[Adder_N.scala 26:21]
    Full_Adder_21.clock <= clock
    Full_Adder_21.reset <= reset
    Full_Adder_21.io_in_a <= _T_42 @[Adder_N.scala 24:21]
    Full_Adder_21.io_in_b <= _T_43 @[Adder_N.scala 25:21]
    Full_Adder_21.io_in_c <= carry_21 @[Adder_N.scala 26:21]
    Full_Adder_22.clock <= clock
    Full_Adder_22.reset <= reset
    Full_Adder_22.io_in_a <= _T_44 @[Adder_N.scala 24:21]
    Full_Adder_22.io_in_b <= _T_45 @[Adder_N.scala 25:21]
    Full_Adder_22.io_in_c <= carry_22 @[Adder_N.scala 26:21]
    Full_Adder_23.clock <= clock
    Full_Adder_23.reset <= reset
    Full_Adder_23.io_in_a <= _T_46 @[Adder_N.scala 24:21]
    Full_Adder_23.io_in_b <= _T_47 @[Adder_N.scala 25:21]
    Full_Adder_23.io_in_c <= carry_23 @[Adder_N.scala 26:21]
    Full_Adder_24.clock <= clock
    Full_Adder_24.reset <= reset
    Full_Adder_24.io_in_a <= _T_48 @[Adder_N.scala 24:21]
    Full_Adder_24.io_in_b <= _T_49 @[Adder_N.scala 25:21]
    Full_Adder_24.io_in_c <= carry_24 @[Adder_N.scala 26:21]
    Full_Adder_25.clock <= clock
    Full_Adder_25.reset <= reset
    Full_Adder_25.io_in_a <= _T_50 @[Adder_N.scala 24:21]
    Full_Adder_25.io_in_b <= _T_51 @[Adder_N.scala 25:21]
    Full_Adder_25.io_in_c <= carry_25 @[Adder_N.scala 26:21]
    Full_Adder_26.clock <= clock
    Full_Adder_26.reset <= reset
    Full_Adder_26.io_in_a <= _T_52 @[Adder_N.scala 24:21]
    Full_Adder_26.io_in_b <= _T_53 @[Adder_N.scala 25:21]
    Full_Adder_26.io_in_c <= carry_26 @[Adder_N.scala 26:21]
    Full_Adder_27.clock <= clock
    Full_Adder_27.reset <= reset
    Full_Adder_27.io_in_a <= _T_54 @[Adder_N.scala 24:21]
    Full_Adder_27.io_in_b <= _T_55 @[Adder_N.scala 25:21]
    Full_Adder_27.io_in_c <= carry_27 @[Adder_N.scala 26:21]
    Full_Adder_28.clock <= clock
    Full_Adder_28.reset <= reset
    Full_Adder_28.io_in_a <= _T_56 @[Adder_N.scala 24:21]
    Full_Adder_28.io_in_b <= _T_57 @[Adder_N.scala 25:21]
    Full_Adder_28.io_in_c <= carry_28 @[Adder_N.scala 26:21]
    Full_Adder_29.clock <= clock
    Full_Adder_29.reset <= reset
    Full_Adder_29.io_in_a <= _T_58 @[Adder_N.scala 24:21]
    Full_Adder_29.io_in_b <= _T_59 @[Adder_N.scala 25:21]
    Full_Adder_29.io_in_c <= carry_29 @[Adder_N.scala 26:21]
    Full_Adder_30.clock <= clock
    Full_Adder_30.reset <= reset
    Full_Adder_30.io_in_a <= _T_60 @[Adder_N.scala 24:21]
    Full_Adder_30.io_in_b <= _T_61 @[Adder_N.scala 25:21]
    Full_Adder_30.io_in_c <= carry_30 @[Adder_N.scala 26:21]
    Full_Adder_31.clock <= clock
    Full_Adder_31.reset <= reset
    Full_Adder_31.io_in_a <= _T_62 @[Adder_N.scala 24:21]
    Full_Adder_31.io_in_b <= _T_63 @[Adder_N.scala 25:21]
    Full_Adder_31.io_in_c <= carry_31 @[Adder_N.scala 26:21]

  module NOT :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<32>
    output io_out_not_a : UInt<32>

    node _io_out_not_a_T = not(io_in_a) @[NOT.scala 11:21]
    io_out_not_a <= _io_out_not_a_T @[NOT.scala 11:18]

  module AND :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<32>
    input io_in_b : UInt<32>
    output io_out_and : UInt<32>

    node _io_out_and_T = and(io_in_a, io_in_b) @[AND.scala 12:26]
    io_out_and <= _io_out_and_T @[AND.scala 12:15]

  module OR :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<32>
    input io_in_b : UInt<32>
    output io_out_or : UInt<32>

    node _io_out_or_T = or(io_in_a, io_in_b) @[OR.scala 12:25]
    io_out_or <= _io_out_or_T @[OR.scala 12:14]

  module XOR :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<32>
    input io_in_b : UInt<32>
    output io_out_xor : UInt<32>

    node _io_out_xor_T = xor(io_in_a, io_in_b) @[XOR.scala 12:26]
    io_out_xor <= _io_out_xor_T @[XOR.scala 12:15]

  module COMP :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : SInt<32>
    input io_in_b : SInt<32>
    output io_out_comp : UInt<1>

    node _T = lt(io_in_a, io_in_b) @[COMP.scala 11:18]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[COMP.scala 11:28 12:21 14:21]
    io_out_comp <= _GEN_0

  module IsEqual :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : SInt<32>
    input io_in_b : SInt<32>
    output io_out_equal : UInt<1>

    node _T = eq(io_in_a, io_in_b) @[IsEqual.scala 11:18]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[IsEqual.scala 11:30 12:17 14:21]
    io_out_equal <= _GEN_0

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : SInt<32>
    input io_in_b : SInt<32>
    input io_in_sel : UInt<3>
    output io_out_result : SInt<32>
    output io_out_overflow : UInt<1>
    output io_out_zero : UInt<1>
    output io_out_xor : UInt<32>
    output io_out_and : UInt<32>
    output io_out_or : UInt<32>
    output io_out_not : UInt<32>
    output io_out_compare : UInt<1>
    output io_out_equal : UInt<1>

    inst Adder_8Module of Adder_N @[ALU.scala 27:31]
    inst Adder_8Module_1 of Adder_N @[ALU.scala 46:31]
    inst NotModule of NOT @[ALU.scala 69:27]
    inst ANDModule of AND @[ALU.scala 86:27]
    inst ORModule of OR @[ALU.scala 104:26]
    inst XORModule of XOR @[ALU.scala 122:27]
    inst COMPModule of COMP @[ALU.scala 139:28]
    inst IsEqualModule of IsEqual @[ALU.scala 157:31]
    node _T = eq(io_in_sel, UInt<1>("h1")) @[ALU.scala 26:16]
    node _in_b_env_T = not(io_in_b) @[ALU.scala 28:17]
    node _in_b_env_T_1 = asSInt(_in_b_env_T) @[ALU.scala 28:17]
    node _in_b_env_T_2 = add(_in_b_env_T_1, asSInt(UInt<2>("h1"))) @[ALU.scala 28:27]
    node _in_b_env_T_3 = tail(_in_b_env_T_2, 1) @[ALU.scala 28:27]
    node _in_b_env_T_4 = asSInt(_in_b_env_T_3) @[ALU.scala 28:27]
    node _io_out_overflow_T = bits(io_in_a, 31, 31) @[ALU.scala 33:32]
    node _io_out_overflow_T_1 = bits(io_in_b, 31, 31) @[ALU.scala 33:47]
    node _io_out_overflow_T_2 = eq(_io_out_overflow_T, _io_out_overflow_T_1) @[ALU.scala 33:37]
    node _io_out_overflow_T_3 = bits(Adder_8Module.io_Sum, 31, 31) @[ALU.scala 34:46]
    node _io_out_overflow_T_4 = bits(io_in_a, 31, 31) @[ALU.scala 34:61]
    node _io_out_overflow_T_5 = neq(_io_out_overflow_T_3, _io_out_overflow_T_4) @[ALU.scala 34:51]
    node _io_out_overflow_T_6 = and(_io_out_overflow_T_2, _io_out_overflow_T_5) @[ALU.scala 33:53]
    node _io_out_zero_T = asUInt(io_out_result) @[ALU.scala 35:40]
    node _io_out_zero_T_1 = or(UInt<1>("h0"), _io_out_zero_T) @[ALU.scala 35:25]
    node _io_out_zero_T_2 = not(_io_out_zero_T_1) @[ALU.scala 35:20]
    node _T_1 = eq(io_in_sel, UInt<1>("h0")) @[ALU.scala 45:22]
    node _io_out_overflow_T_7 = bits(io_in_a, 31, 31) @[ALU.scala 52:32]
    node _io_out_overflow_T_8 = bits(io_in_b, 31, 31) @[ALU.scala 52:47]
    node _io_out_overflow_T_9 = eq(_io_out_overflow_T_7, _io_out_overflow_T_8) @[ALU.scala 52:37]
    node _io_out_overflow_T_10 = bits(Adder_8Module_1.io_Sum, 31, 31) @[ALU.scala 53:46]
    node _io_out_overflow_T_11 = bits(io_in_a, 31, 31) @[ALU.scala 53:61]
    node _io_out_overflow_T_12 = neq(_io_out_overflow_T_10, _io_out_overflow_T_11) @[ALU.scala 53:51]
    node _io_out_overflow_T_13 = and(_io_out_overflow_T_9, _io_out_overflow_T_12) @[ALU.scala 52:53]
    node _io_out_zero_T_3 = asUInt(io_out_result) @[ALU.scala 54:40]
    node _io_out_zero_T_4 = or(UInt<1>("h0"), _io_out_zero_T_3) @[ALU.scala 54:25]
    node _io_out_zero_T_5 = not(_io_out_zero_T_4) @[ALU.scala 54:20]
    node _T_2 = eq(io_in_sel, UInt<2>("h2")) @[ALU.scala 66:22]
    node U_in_a = asUInt(io_in_a) @[ALU.scala 68:26]
    node _T_3 = eq(io_in_sel, UInt<2>("h3")) @[ALU.scala 82:22]
    node U_in_a_1 = asUInt(io_in_a) @[ALU.scala 84:26]
    node U_in_b = asUInt(io_in_b) @[ALU.scala 85:26]
    node _T_4 = eq(io_in_sel, UInt<3>("h4")) @[ALU.scala 100:22]
    node U_in_a_2 = asUInt(io_in_a) @[ALU.scala 102:26]
    node U_in_b_1 = asUInt(io_in_b) @[ALU.scala 103:26]
    node _T_5 = eq(io_in_sel, UInt<3>("h5")) @[ALU.scala 118:22]
    node U_in_a_3 = asUInt(io_in_a) @[ALU.scala 120:26]
    node U_in_b_2 = asUInt(io_in_b) @[ALU.scala 121:26]
    node _T_6 = eq(io_in_sel, UInt<3>("h6")) @[ALU.scala 137:22]
    node _T_7 = eq(io_in_sel, UInt<3>("h7")) @[ALU.scala 155:22]
    node _GEN_0 = mux(_T_7, IsEqualModule.io_out_equal, UInt<1>("h0")) @[ALU.scala 155:30 160:18 180:20]
    node _GEN_1 = mux(_T_7, asSInt(UInt<1>("h0")), asSInt(UInt<1>("h0"))) @[ALU.scala 155:30 161:20 172:20]
    node _GEN_2 = mux(_T_7, UInt<1>("h0"), UInt<1>("h0")) @[ALU.scala 155:30 162:20 173:20]
    node _GEN_3 = mux(_T_6, COMPModule.io_out_comp, _GEN_2) @[ALU.scala 137:30 142:20]
    node _GEN_4 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_1) @[ALU.scala 137:30 143:20]
    node _GEN_5 = mux(_T_6, UInt<1>("h0"), _GEN_2) @[ALU.scala 137:30 144:20]
    node _GEN_6 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[ALU.scala 137:30 150:20]
    node _GEN_7 = mux(_T_5, XORModule.io_out_xor, _GEN_5) @[ALU.scala 118:30 125:16]
    node _GEN_8 = mux(_T_5, asSInt(UInt<1>("h0")), _GEN_4) @[ALU.scala 118:30 126:20]
    node _GEN_9 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[ALU.scala 118:30 127:20]
    node _GEN_10 = mux(_T_5, UInt<1>("h0"), _GEN_3) @[ALU.scala 118:30 132:20]
    node _GEN_11 = mux(_T_5, UInt<1>("h0"), _GEN_6) @[ALU.scala 118:30 133:20]
    node _GEN_12 = mux(_T_4, ORModule.io_out_or, _GEN_9) @[ALU.scala 100:30 107:15]
    node _GEN_13 = mux(_T_4, asSInt(UInt<1>("h0")), _GEN_8) @[ALU.scala 100:30 108:20]
    node _GEN_14 = mux(_T_4, UInt<1>("h0"), _GEN_9) @[ALU.scala 100:30 109:20]
    node _GEN_15 = mux(_T_4, UInt<1>("h0"), _GEN_7) @[ALU.scala 100:30 111:20]
    node _GEN_16 = mux(_T_4, UInt<1>("h0"), _GEN_10) @[ALU.scala 100:30 114:20]
    node _GEN_17 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[ALU.scala 100:30 115:20]
    node _GEN_18 = mux(_T_3, ANDModule.io_out_and, _GEN_14) @[ALU.scala 82:30 89:16]
    node _GEN_19 = mux(_T_3, asSInt(UInt<1>("h0")), _GEN_13) @[ALU.scala 82:30 90:20]
    node _GEN_20 = mux(_T_3, UInt<1>("h0"), _GEN_14) @[ALU.scala 82:30 91:20]
    node _GEN_21 = mux(_T_3, UInt<1>("h0"), _GEN_15) @[ALU.scala 82:30 93:20]
    node _GEN_22 = mux(_T_3, UInt<1>("h0"), _GEN_12) @[ALU.scala 82:30 94:20]
    node _GEN_23 = mux(_T_3, UInt<1>("h0"), _GEN_16) @[ALU.scala 82:30 96:20]
    node _GEN_24 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[ALU.scala 82:30 97:20]
    node _GEN_25 = mux(_T_2, NotModule.io_out_not_a, _GEN_20) @[ALU.scala 66:30 71:16]
    node _GEN_26 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_19) @[ALU.scala 66:30 72:20]
    node _GEN_27 = mux(_T_2, UInt<1>("h0"), _GEN_20) @[ALU.scala 66:30 73:20]
    node _GEN_28 = mux(_T_2, UInt<1>("h0"), _GEN_21) @[ALU.scala 66:30 75:20]
    node _GEN_29 = mux(_T_2, UInt<1>("h0"), _GEN_18) @[ALU.scala 66:30 76:20]
    node _GEN_30 = mux(_T_2, UInt<1>("h0"), _GEN_22) @[ALU.scala 66:30 77:20]
    node _GEN_31 = mux(_T_2, UInt<1>("h0"), _GEN_23) @[ALU.scala 66:30 78:20]
    node _GEN_32 = mux(_T_2, UInt<1>("h0"), _GEN_24) @[ALU.scala 66:30 79:20]
    node _GEN_33 = mux(_T_1, asSInt(UInt<1>("h0")), _GEN_26) @[ALU.scala 45:30 64:20]
    node _GEN_34 = mux(_T_1, Adder_8Module_1.io_Sum, _GEN_26) @[ALU.scala 45:30 51:19]
    node _GEN_35 = mux(_T_1, _io_out_overflow_T_13, _GEN_27) @[ALU.scala 45:30 52:21]
    node _GEN_36 = mux(_T_1, _io_out_zero_T_5, _GEN_27) @[ALU.scala 45:30 54:17]
    node _GEN_37 = mux(_T_1, UInt<1>("h0"), _GEN_28) @[ALU.scala 45:30 58:20]
    node _GEN_38 = mux(_T_1, UInt<1>("h0"), _GEN_29) @[ALU.scala 45:30 59:20]
    node _GEN_39 = mux(_T_1, UInt<1>("h0"), _GEN_30) @[ALU.scala 45:30 60:20]
    node _GEN_40 = mux(_T_1, UInt<1>("h0"), _GEN_25) @[ALU.scala 45:30 61:20]
    node _GEN_41 = mux(_T_1, UInt<1>("h0"), _GEN_31) @[ALU.scala 45:30 62:20]
    node _GEN_42 = mux(_T_1, UInt<1>("h0"), _GEN_32) @[ALU.scala 45:30 63:20]
    node _GEN_43 = mux(_T, asSInt(UInt<1>("h0")), _GEN_33) @[ALU.scala 26:24 43:20]
    node _GEN_44 = mux(_T, Adder_8Module.io_Sum, _GEN_34) @[ALU.scala 26:24 32:19]
    node _GEN_45 = mux(_T, _io_out_overflow_T_6, _GEN_35) @[ALU.scala 26:24 33:21]
    node _GEN_46 = mux(_T, _io_out_zero_T_2, _GEN_36) @[ALU.scala 26:24 35:17]
    node _GEN_47 = mux(_T, UInt<1>("h0"), _GEN_37) @[ALU.scala 26:24 37:20]
    node _GEN_48 = mux(_T, UInt<1>("h0"), _GEN_38) @[ALU.scala 26:24 38:20]
    node _GEN_49 = mux(_T, UInt<1>("h0"), _GEN_39) @[ALU.scala 26:24 39:20]
    node _GEN_50 = mux(_T, UInt<1>("h0"), _GEN_40) @[ALU.scala 26:24 40:20]
    node _GEN_51 = mux(_T, UInt<1>("h0"), _GEN_41) @[ALU.scala 26:24 41:20]
    node _GEN_52 = mux(_T, UInt<1>("h0"), _GEN_42) @[ALU.scala 26:24 42:20]
    node in_b_env = pad(_GEN_43, 32) @[ALU.scala 23:20]
    io_out_result <= _GEN_44
    io_out_overflow <= _GEN_45
    io_out_zero <= bits(_GEN_46, 0, 0)
    io_out_xor <= _GEN_47
    io_out_and <= _GEN_48
    io_out_or <= _GEN_49
    io_out_not <= _GEN_50
    io_out_compare <= _GEN_51
    io_out_equal <= _GEN_52
    Adder_8Module.clock <= clock
    Adder_8Module.reset <= reset
    Adder_8Module.io_A <= io_in_a @[ALU.scala 30:24]
    Adder_8Module.io_B <= in_b_env @[ALU.scala 31:24]
    Adder_8Module.io_Cin <= UInt<1>("h0") @[ALU.scala 29:26]
    Adder_8Module_1.clock <= clock
    Adder_8Module_1.reset <= reset
    Adder_8Module_1.io_A <= io_in_a @[ALU.scala 49:24]
    Adder_8Module_1.io_B <= io_in_b @[ALU.scala 50:24]
    Adder_8Module_1.io_Cin <= UInt<1>("h0") @[ALU.scala 48:26]
    NotModule.clock <= clock
    NotModule.reset <= reset
    NotModule.io_in_a <= U_in_a @[ALU.scala 70:23]
    ANDModule.clock <= clock
    ANDModule.reset <= reset
    ANDModule.io_in_a <= U_in_a_1 @[ALU.scala 87:23]
    ANDModule.io_in_b <= U_in_b @[ALU.scala 88:23]
    ORModule.clock <= clock
    ORModule.reset <= reset
    ORModule.io_in_a <= U_in_a_2 @[ALU.scala 105:22]
    ORModule.io_in_b <= U_in_b_1 @[ALU.scala 106:22]
    XORModule.clock <= clock
    XORModule.reset <= reset
    XORModule.io_in_a <= U_in_a_3 @[ALU.scala 123:23]
    XORModule.io_in_b <= U_in_b_2 @[ALU.scala 124:23]
    COMPModule.clock <= clock
    COMPModule.reset <= reset
    COMPModule.io_in_a <= io_in_a @[ALU.scala 140:24]
    COMPModule.io_in_b <= io_in_b @[ALU.scala 141:24]
    IsEqualModule.clock <= clock
    IsEqualModule.reset <= reset
    IsEqualModule.io_in_a <= io_in_a @[ALU.scala 158:27]
    IsEqualModule.io_in_b <= io_in_b @[ALU.scala 159:27]
