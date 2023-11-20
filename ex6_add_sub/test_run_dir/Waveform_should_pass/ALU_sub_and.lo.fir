circuit ALU_sub_and :
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
    input io_A : UInt<8>
    input io_B : UInt<8>
    input io_Cin : UInt<1>
    output io_Sum : UInt<8>
    output io_Cout : UInt<1>

    inst Full_Adder of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_1 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_2 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_3 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_4 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_5 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_6 of Full_Adder @[Adder_N.scala 15:35]
    inst Full_Adder_7 of Full_Adder @[Adder_N.scala 15:35]
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
    node sum_1 = Full_Adder_1.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_0 = Full_Adder.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_lo = cat(sum_1, sum_0) @[Adder_N.scala 31:19]
    node sum_3 = Full_Adder_3.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_2 = Full_Adder_2.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_lo_hi = cat(sum_3, sum_2) @[Adder_N.scala 31:19]
    node io_Sum_lo = cat(io_Sum_lo_hi, io_Sum_lo_lo) @[Adder_N.scala 31:19]
    node sum_5 = Full_Adder_5.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_4 = Full_Adder_4.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_lo = cat(sum_5, sum_4) @[Adder_N.scala 31:19]
    node sum_7 = Full_Adder_7.io_out_s @[Adder_N.scala 18:19 28:16]
    node sum_6 = Full_Adder_6.io_out_s @[Adder_N.scala 18:19 28:16]
    node io_Sum_hi_hi = cat(sum_7, sum_6) @[Adder_N.scala 31:19]
    node io_Sum_hi = cat(io_Sum_hi_hi, io_Sum_hi_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Adder_N.scala 31:19]
    node carry_0 = io_Cin @[Adder_N.scala 17:21 21:14]
    node carry_1 = Full_Adder.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_2 = Full_Adder_1.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_3 = Full_Adder_2.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_4 = Full_Adder_3.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_5 = Full_Adder_4.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_6 = Full_Adder_5.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_7 = Full_Adder_6.io_out_c @[Adder_N.scala 17:21 27:20]
    node carry_8 = Full_Adder_7.io_out_c @[Adder_N.scala 17:21 27:20]
    io_Sum <= _io_Sum_T @[Adder_N.scala 31:12]
    io_Cout <= carry_8 @[Adder_N.scala 32:13]
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

  module ALU_sub_and :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<8>
    input io_in_b : UInt<8>
    input io_in_sel : UInt<1>
    output io_out_result : UInt<8>
    output io_out_overflow : UInt<1>
    output io_out_zero : UInt<1>

    inst Adder_8Module of Adder_N @[main.scala 16:27]
    node _T = eq(io_in_sel, UInt<1>("h1")) @[main.scala 18:16]
    node _in_b_env_T = not(io_in_b) @[main.scala 19:17]
    node _in_b_env_T_1 = add(_in_b_env_T, UInt<1>("h1")) @[main.scala 19:27]
    node _in_b_env_T_2 = tail(_in_b_env_T_1, 1) @[main.scala 19:27]
    node _io_out_overflow_T = bits(io_in_a, 7, 7) @[main.scala 24:32]
    node _io_out_overflow_T_1 = bits(io_in_b, 7, 7) @[main.scala 24:47]
    node _io_out_overflow_T_2 = eq(_io_out_overflow_T, _io_out_overflow_T_1) @[main.scala 24:37]
    node _io_out_overflow_T_3 = bits(Adder_8Module.io_Sum, 7, 7) @[main.scala 25:46]
    node _io_out_overflow_T_4 = bits(io_in_a, 7, 7) @[main.scala 25:61]
    node _io_out_overflow_T_5 = neq(_io_out_overflow_T_3, _io_out_overflow_T_4) @[main.scala 25:51]
    node _io_out_overflow_T_6 = and(_io_out_overflow_T_2, _io_out_overflow_T_5) @[main.scala 24:53]
    node _io_out_zero_T = or(UInt<1>("h0"), io_out_result) @[main.scala 26:25]
    node _io_out_zero_T_1 = not(_io_out_zero_T) @[main.scala 26:20]
    node _io_out_zero_T_2 = or(UInt<1>("h0"), io_out_result) @[main.scala 35:25]
    node _io_out_zero_T_3 = not(_io_out_zero_T_2) @[main.scala 35:20]
    node _GEN_0 = mux(_T, _in_b_env_T_2, io_in_b) @[main.scala 18:24 19:14 29:14]
    node _GEN_1 = mux(_T, UInt<1>("h0"), UInt<1>("h0")) @[main.scala 18:24 20:26 30:26]
    node _GEN_2 = mux(_T, io_in_a, io_in_a) @[main.scala 18:24 21:24 31:24]
    node in_b_env = _GEN_0 @[main.scala 15:20]
    node _GEN_3 = mux(_T, in_b_env, io_in_b) @[main.scala 18:24 22:24 32:24]
    node _GEN_4 = mux(_T, Adder_8Module.io_Sum, Adder_8Module.io_Sum) @[main.scala 18:24 23:19 33:19]
    node _GEN_5 = mux(_T, _io_out_overflow_T_6, Adder_8Module.io_Cout) @[main.scala 18:24 24:21 34:21]
    node _GEN_6 = mux(_T, _io_out_zero_T_1, _io_out_zero_T_3) @[main.scala 18:24 26:17 35:17]
    io_out_result <= _GEN_4
    io_out_overflow <= _GEN_5
    io_out_zero <= bits(_GEN_6, 0, 0)
    Adder_8Module.clock <= clock
    Adder_8Module.reset <= reset
    Adder_8Module.io_A <= _GEN_2
    Adder_8Module.io_B <= _GEN_3
    Adder_8Module.io_Cin <= _GEN_1
