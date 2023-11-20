circuit Adder_8 :
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

  module Adder_8 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<8>, flip in_b : UInt<8>, out : UInt<9>}

    inst FA0 of Full_Adder @[Adder_8.scala 13:21]
    FA0.clock <= clock
    FA0.reset <= reset
    inst FA1 of Full_Adder_1 @[Adder_8.scala 14:21]
    FA1.clock <= clock
    FA1.reset <= reset
    inst FA2 of Full_Adder_2 @[Adder_8.scala 15:21]
    FA2.clock <= clock
    FA2.reset <= reset
    inst FA3 of Full_Adder_3 @[Adder_8.scala 16:21]
    FA3.clock <= clock
    FA3.reset <= reset
    inst FA4 of Full_Adder_4 @[Adder_8.scala 17:21]
    FA4.clock <= clock
    FA4.reset <= reset
    inst FA5 of Full_Adder_5 @[Adder_8.scala 18:21]
    FA5.clock <= clock
    FA5.reset <= reset
    inst FA6 of Full_Adder_6 @[Adder_8.scala 19:21]
    FA6.clock <= clock
    FA6.reset <= reset
    inst FA7 of Full_Adder_7 @[Adder_8.scala 20:21]
    FA7.clock <= clock
    FA7.reset <= reset
    reg out_temp : UInt<9>, clock with :
      reset => (reset, UInt<9>("h0")) @[Adder_8.scala 21:27]
    wire out_temp2 : UInt<1>[9] @[Adder_8.scala 23:25]
    node _FA0_io_in_a_T = bits(io.in_a, 0, 0) @[Adder_8.scala 27:27]
    FA0.io.in_a <= _FA0_io_in_a_T @[Adder_8.scala 27:17]
    node _FA0_io_in_b_T = bits(io.in_b, 0, 0) @[Adder_8.scala 28:27]
    FA0.io.in_b <= _FA0_io_in_b_T @[Adder_8.scala 28:17]
    FA0.io.in_c <= UInt<1>("h0") @[Adder_8.scala 29:17]
    FA1.io.in_c <= FA0.io.out_c @[Adder_8.scala 30:17]
    out_temp2[0] <= FA0.io.out_s @[Adder_8.scala 31:18]
    node _FA1_io_in_a_T = bits(io.in_a, 1, 1) @[Adder_8.scala 34:27]
    FA1.io.in_a <= _FA1_io_in_a_T @[Adder_8.scala 34:17]
    node _FA1_io_in_b_T = bits(io.in_b, 1, 1) @[Adder_8.scala 35:27]
    FA1.io.in_b <= _FA1_io_in_b_T @[Adder_8.scala 35:17]
    FA2.io.in_c <= FA1.io.out_c @[Adder_8.scala 36:17]
    out_temp2[1] <= FA1.io.out_s @[Adder_8.scala 37:20]
    node _FA2_io_in_a_T = bits(io.in_a, 2, 2) @[Adder_8.scala 39:27]
    FA2.io.in_a <= _FA2_io_in_a_T @[Adder_8.scala 39:17]
    node _FA2_io_in_b_T = bits(io.in_b, 2, 2) @[Adder_8.scala 40:27]
    FA2.io.in_b <= _FA2_io_in_b_T @[Adder_8.scala 40:17]
    FA3.io.in_c <= FA2.io.out_c @[Adder_8.scala 41:17]
    out_temp2[2] <= FA2.io.out_s @[Adder_8.scala 42:20]
    node _FA3_io_in_a_T = bits(io.in_a, 3, 3) @[Adder_8.scala 44:27]
    FA3.io.in_a <= _FA3_io_in_a_T @[Adder_8.scala 44:17]
    node _FA3_io_in_b_T = bits(io.in_b, 3, 3) @[Adder_8.scala 45:27]
    FA3.io.in_b <= _FA3_io_in_b_T @[Adder_8.scala 45:17]
    FA4.io.in_c <= FA3.io.out_c @[Adder_8.scala 46:17]
    out_temp2[3] <= FA3.io.out_s @[Adder_8.scala 47:20]
    node _FA4_io_in_a_T = bits(io.in_a, 4, 4) @[Adder_8.scala 49:27]
    FA4.io.in_a <= _FA4_io_in_a_T @[Adder_8.scala 49:17]
    node _FA4_io_in_b_T = bits(io.in_b, 4, 4) @[Adder_8.scala 50:27]
    FA4.io.in_b <= _FA4_io_in_b_T @[Adder_8.scala 50:17]
    FA5.io.in_c <= FA4.io.out_c @[Adder_8.scala 51:17]
    out_temp2[4] <= FA4.io.out_s @[Adder_8.scala 52:20]
    node _FA5_io_in_a_T = bits(io.in_a, 5, 5) @[Adder_8.scala 54:27]
    FA5.io.in_a <= _FA5_io_in_a_T @[Adder_8.scala 54:17]
    node _FA5_io_in_b_T = bits(io.in_b, 5, 5) @[Adder_8.scala 55:27]
    FA5.io.in_b <= _FA5_io_in_b_T @[Adder_8.scala 55:17]
    FA6.io.in_c <= FA5.io.out_c @[Adder_8.scala 56:17]
    out_temp2[5] <= FA5.io.out_s @[Adder_8.scala 57:20]
    node _FA6_io_in_a_T = bits(io.in_a, 6, 6) @[Adder_8.scala 59:27]
    FA6.io.in_a <= _FA6_io_in_a_T @[Adder_8.scala 59:17]
    node _FA6_io_in_b_T = bits(io.in_b, 6, 6) @[Adder_8.scala 60:27]
    FA6.io.in_b <= _FA6_io_in_b_T @[Adder_8.scala 60:17]
    FA7.io.in_c <= FA6.io.out_c @[Adder_8.scala 61:17]
    out_temp2[6] <= FA6.io.out_s @[Adder_8.scala 62:20]
    node _FA7_io_in_a_T = bits(io.in_a, 7, 7) @[Adder_8.scala 64:27]
    FA7.io.in_a <= _FA7_io_in_a_T @[Adder_8.scala 64:17]
    node _FA7_io_in_b_T = bits(io.in_b, 7, 7) @[Adder_8.scala 65:27]
    FA7.io.in_b <= _FA7_io_in_b_T @[Adder_8.scala 65:17]
    out_temp2[7] <= FA7.io.out_s @[Adder_8.scala 67:20]
    out_temp2[8] <= FA7.io.out_c @[Adder_8.scala 68:20]
    node io_out_lo_lo = cat(out_temp2[1], out_temp2[0]) @[Adder_8.scala 70:25]
    node io_out_lo_hi = cat(out_temp2[3], out_temp2[2]) @[Adder_8.scala 70:25]
    node io_out_lo = cat(io_out_lo_hi, io_out_lo_lo) @[Adder_8.scala 70:25]
    node io_out_hi_lo = cat(out_temp2[5], out_temp2[4]) @[Adder_8.scala 70:25]
    node io_out_hi_hi_hi = cat(out_temp2[8], out_temp2[7]) @[Adder_8.scala 70:25]
    node io_out_hi_hi = cat(io_out_hi_hi_hi, out_temp2[6]) @[Adder_8.scala 70:25]
    node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Adder_8.scala 70:25]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Adder_8.scala 70:25]
    io.out <= _io_out_T @[Adder_8.scala 70:12]

