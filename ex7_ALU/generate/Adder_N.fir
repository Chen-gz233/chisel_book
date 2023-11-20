circuit Adder_N :
  module Full_Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Adder_N :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip A : SInt<8>, flip B : SInt<8>, flip Cin : UInt<1>, Sum : SInt<8>, Cout : UInt<1>}

    inst Full_Adder of Full_Adder @[Adder_N.scala 15:35]
    Full_Adder.clock <= clock
    Full_Adder.reset <= reset
    inst Full_Adder_1 of Full_Adder_1 @[Adder_N.scala 15:35]
    Full_Adder_1.clock <= clock
    Full_Adder_1.reset <= reset
    inst Full_Adder_2 of Full_Adder_2 @[Adder_N.scala 15:35]
    Full_Adder_2.clock <= clock
    Full_Adder_2.reset <= reset
    inst Full_Adder_3 of Full_Adder_3 @[Adder_N.scala 15:35]
    Full_Adder_3.clock <= clock
    Full_Adder_3.reset <= reset
    inst Full_Adder_4 of Full_Adder_4 @[Adder_N.scala 15:35]
    Full_Adder_4.clock <= clock
    Full_Adder_4.reset <= reset
    inst Full_Adder_5 of Full_Adder_5 @[Adder_N.scala 15:35]
    Full_Adder_5.clock <= clock
    Full_Adder_5.reset <= reset
    inst Full_Adder_6 of Full_Adder_6 @[Adder_N.scala 15:35]
    Full_Adder_6.clock <= clock
    Full_Adder_6.reset <= reset
    inst Full_Adder_7 of Full_Adder_7 @[Adder_N.scala 15:35]
    Full_Adder_7.clock <= clock
    Full_Adder_7.reset <= reset
    wire carry : UInt<1>[9] @[Adder_N.scala 17:21]
    wire sum : UInt<1>[8] @[Adder_N.scala 18:19]
    carry[0] <= io.Cin @[Adder_N.scala 21:14]
    node _T = bits(io.A, 0, 0) @[Adder_N.scala 24:28]
    Full_Adder.io.in_a <= _T @[Adder_N.scala 24:21]
    node _T_1 = bits(io.B, 0, 0) @[Adder_N.scala 25:28]
    Full_Adder.io.in_b <= _T_1 @[Adder_N.scala 25:21]
    Full_Adder.io.in_c <= carry[0] @[Adder_N.scala 26:21]
    carry[1] <= Full_Adder.io.out_c @[Adder_N.scala 27:20]
    sum[0] <= Full_Adder.io.out_s @[Adder_N.scala 28:16]
    node _T_2 = bits(io.A, 1, 1) @[Adder_N.scala 24:28]
    Full_Adder_1.io.in_a <= _T_2 @[Adder_N.scala 24:21]
    node _T_3 = bits(io.B, 1, 1) @[Adder_N.scala 25:28]
    Full_Adder_1.io.in_b <= _T_3 @[Adder_N.scala 25:21]
    Full_Adder_1.io.in_c <= carry[1] @[Adder_N.scala 26:21]
    carry[2] <= Full_Adder_1.io.out_c @[Adder_N.scala 27:20]
    sum[1] <= Full_Adder_1.io.out_s @[Adder_N.scala 28:16]
    node _T_4 = bits(io.A, 2, 2) @[Adder_N.scala 24:28]
    Full_Adder_2.io.in_a <= _T_4 @[Adder_N.scala 24:21]
    node _T_5 = bits(io.B, 2, 2) @[Adder_N.scala 25:28]
    Full_Adder_2.io.in_b <= _T_5 @[Adder_N.scala 25:21]
    Full_Adder_2.io.in_c <= carry[2] @[Adder_N.scala 26:21]
    carry[3] <= Full_Adder_2.io.out_c @[Adder_N.scala 27:20]
    sum[2] <= Full_Adder_2.io.out_s @[Adder_N.scala 28:16]
    node _T_6 = bits(io.A, 3, 3) @[Adder_N.scala 24:28]
    Full_Adder_3.io.in_a <= _T_6 @[Adder_N.scala 24:21]
    node _T_7 = bits(io.B, 3, 3) @[Adder_N.scala 25:28]
    Full_Adder_3.io.in_b <= _T_7 @[Adder_N.scala 25:21]
    Full_Adder_3.io.in_c <= carry[3] @[Adder_N.scala 26:21]
    carry[4] <= Full_Adder_3.io.out_c @[Adder_N.scala 27:20]
    sum[3] <= Full_Adder_3.io.out_s @[Adder_N.scala 28:16]
    node _T_8 = bits(io.A, 4, 4) @[Adder_N.scala 24:28]
    Full_Adder_4.io.in_a <= _T_8 @[Adder_N.scala 24:21]
    node _T_9 = bits(io.B, 4, 4) @[Adder_N.scala 25:28]
    Full_Adder_4.io.in_b <= _T_9 @[Adder_N.scala 25:21]
    Full_Adder_4.io.in_c <= carry[4] @[Adder_N.scala 26:21]
    carry[5] <= Full_Adder_4.io.out_c @[Adder_N.scala 27:20]
    sum[4] <= Full_Adder_4.io.out_s @[Adder_N.scala 28:16]
    node _T_10 = bits(io.A, 5, 5) @[Adder_N.scala 24:28]
    Full_Adder_5.io.in_a <= _T_10 @[Adder_N.scala 24:21]
    node _T_11 = bits(io.B, 5, 5) @[Adder_N.scala 25:28]
    Full_Adder_5.io.in_b <= _T_11 @[Adder_N.scala 25:21]
    Full_Adder_5.io.in_c <= carry[5] @[Adder_N.scala 26:21]
    carry[6] <= Full_Adder_5.io.out_c @[Adder_N.scala 27:20]
    sum[5] <= Full_Adder_5.io.out_s @[Adder_N.scala 28:16]
    node _T_12 = bits(io.A, 6, 6) @[Adder_N.scala 24:28]
    Full_Adder_6.io.in_a <= _T_12 @[Adder_N.scala 24:21]
    node _T_13 = bits(io.B, 6, 6) @[Adder_N.scala 25:28]
    Full_Adder_6.io.in_b <= _T_13 @[Adder_N.scala 25:21]
    Full_Adder_6.io.in_c <= carry[6] @[Adder_N.scala 26:21]
    carry[7] <= Full_Adder_6.io.out_c @[Adder_N.scala 27:20]
    sum[6] <= Full_Adder_6.io.out_s @[Adder_N.scala 28:16]
    node _T_14 = bits(io.A, 7, 7) @[Adder_N.scala 24:28]
    Full_Adder_7.io.in_a <= _T_14 @[Adder_N.scala 24:21]
    node _T_15 = bits(io.B, 7, 7) @[Adder_N.scala 25:28]
    Full_Adder_7.io.in_b <= _T_15 @[Adder_N.scala 25:21]
    Full_Adder_7.io.in_c <= carry[7] @[Adder_N.scala 26:21]
    carry[8] <= Full_Adder_7.io.out_c @[Adder_N.scala 27:20]
    sum[7] <= Full_Adder_7.io.out_s @[Adder_N.scala 28:16]
    node io_Sum_lo_lo = cat(sum[1], sum[0]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi = cat(sum[3], sum[2]) @[Adder_N.scala 31:19]
    node io_Sum_lo = cat(io_Sum_lo_hi, io_Sum_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo = cat(sum[5], sum[4]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi = cat(sum[7], sum[6]) @[Adder_N.scala 31:19]
    node io_Sum_hi = cat(io_Sum_hi_hi, io_Sum_hi_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T_1 = asSInt(_io_Sum_T) @[Adder_N.scala 31:26]
    io.Sum <= _io_Sum_T_1 @[Adder_N.scala 31:12]
    io.Cout <= carry[8] @[Adder_N.scala 32:13]

