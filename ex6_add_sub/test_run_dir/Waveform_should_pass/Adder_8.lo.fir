circuit Adder_8 :
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

  module Adder_8 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<8>
    input io_in_b : UInt<8>
    output io_out : UInt<9>

    inst FA0 of Full_Adder @[Adder_8.scala 13:21]
    inst FA1 of Full_Adder @[Adder_8.scala 14:21]
    inst FA2 of Full_Adder @[Adder_8.scala 15:21]
    inst FA3 of Full_Adder @[Adder_8.scala 16:21]
    inst FA4 of Full_Adder @[Adder_8.scala 17:21]
    inst FA5 of Full_Adder @[Adder_8.scala 18:21]
    inst FA6 of Full_Adder @[Adder_8.scala 19:21]
    inst FA7 of Full_Adder @[Adder_8.scala 20:21]
    reg out_temp : UInt<9>, clock with :
      reset => (UInt<1>("h0"), out_temp) @[Adder_8.scala 21:27]
    node _FA0_io_in_a_T = bits(io_in_a, 0, 0) @[Adder_8.scala 27:27]
    node _FA0_io_in_b_T = bits(io_in_b, 0, 0) @[Adder_8.scala 28:27]
    node _FA1_io_in_a_T = bits(io_in_a, 1, 1) @[Adder_8.scala 34:27]
    node _FA1_io_in_b_T = bits(io_in_b, 1, 1) @[Adder_8.scala 35:27]
    node _FA2_io_in_a_T = bits(io_in_a, 2, 2) @[Adder_8.scala 39:27]
    node _FA2_io_in_b_T = bits(io_in_b, 2, 2) @[Adder_8.scala 40:27]
    node _FA3_io_in_a_T = bits(io_in_a, 3, 3) @[Adder_8.scala 44:27]
    node _FA3_io_in_b_T = bits(io_in_b, 3, 3) @[Adder_8.scala 45:27]
    node _FA4_io_in_a_T = bits(io_in_a, 4, 4) @[Adder_8.scala 49:27]
    node _FA4_io_in_b_T = bits(io_in_b, 4, 4) @[Adder_8.scala 50:27]
    node _FA5_io_in_a_T = bits(io_in_a, 5, 5) @[Adder_8.scala 54:27]
    node _FA5_io_in_b_T = bits(io_in_b, 5, 5) @[Adder_8.scala 55:27]
    node _FA6_io_in_a_T = bits(io_in_a, 6, 6) @[Adder_8.scala 59:27]
    node _FA6_io_in_b_T = bits(io_in_b, 6, 6) @[Adder_8.scala 60:27]
    node _FA7_io_in_a_T = bits(io_in_a, 7, 7) @[Adder_8.scala 64:27]
    node _FA7_io_in_b_T = bits(io_in_b, 7, 7) @[Adder_8.scala 65:27]
    node out_temp2_1 = FA1.io_out_s @[Adder_8.scala 23:25 37:20]
    node out_temp2_0 = FA0.io_out_s @[Adder_8.scala 23:25 31:18]
    node io_out_lo_lo = cat(out_temp2_1, out_temp2_0) @[Adder_8.scala 70:25]
    node out_temp2_3 = FA3.io_out_s @[Adder_8.scala 23:25 47:20]
    node out_temp2_2 = FA2.io_out_s @[Adder_8.scala 23:25 42:20]
    node io_out_lo_hi = cat(out_temp2_3, out_temp2_2) @[Adder_8.scala 70:25]
    node io_out_lo = cat(io_out_lo_hi, io_out_lo_lo) @[Adder_8.scala 70:25]
    node out_temp2_5 = FA5.io_out_s @[Adder_8.scala 23:25 57:20]
    node out_temp2_4 = FA4.io_out_s @[Adder_8.scala 23:25 52:20]
    node io_out_hi_lo = cat(out_temp2_5, out_temp2_4) @[Adder_8.scala 70:25]
    node out_temp2_8 = FA7.io_out_c @[Adder_8.scala 23:25 68:20]
    node out_temp2_7 = FA7.io_out_s @[Adder_8.scala 23:25 67:20]
    node io_out_hi_hi_hi = cat(out_temp2_8, out_temp2_7) @[Adder_8.scala 70:25]
    node out_temp2_6 = FA6.io_out_s @[Adder_8.scala 23:25 62:20]
    node io_out_hi_hi = cat(io_out_hi_hi_hi, out_temp2_6) @[Adder_8.scala 70:25]
    node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Adder_8.scala 70:25]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Adder_8.scala 70:25]
    io_out <= _io_out_T @[Adder_8.scala 70:12]
    FA0.clock <= clock
    FA0.reset <= reset
    FA0.io_in_a <= _FA0_io_in_a_T @[Adder_8.scala 27:17]
    FA0.io_in_b <= _FA0_io_in_b_T @[Adder_8.scala 28:17]
    FA0.io_in_c <= UInt<1>("h0") @[Adder_8.scala 29:17]
    FA1.clock <= clock
    FA1.reset <= reset
    FA1.io_in_a <= _FA1_io_in_a_T @[Adder_8.scala 34:17]
    FA1.io_in_b <= _FA1_io_in_b_T @[Adder_8.scala 35:17]
    FA1.io_in_c <= FA0.io_out_c @[Adder_8.scala 30:17]
    FA2.clock <= clock
    FA2.reset <= reset
    FA2.io_in_a <= _FA2_io_in_a_T @[Adder_8.scala 39:17]
    FA2.io_in_b <= _FA2_io_in_b_T @[Adder_8.scala 40:17]
    FA2.io_in_c <= FA1.io_out_c @[Adder_8.scala 36:17]
    FA3.clock <= clock
    FA3.reset <= reset
    FA3.io_in_a <= _FA3_io_in_a_T @[Adder_8.scala 44:17]
    FA3.io_in_b <= _FA3_io_in_b_T @[Adder_8.scala 45:17]
    FA3.io_in_c <= FA2.io_out_c @[Adder_8.scala 41:17]
    FA4.clock <= clock
    FA4.reset <= reset
    FA4.io_in_a <= _FA4_io_in_a_T @[Adder_8.scala 49:17]
    FA4.io_in_b <= _FA4_io_in_b_T @[Adder_8.scala 50:17]
    FA4.io_in_c <= FA3.io_out_c @[Adder_8.scala 46:17]
    FA5.clock <= clock
    FA5.reset <= reset
    FA5.io_in_a <= _FA5_io_in_a_T @[Adder_8.scala 54:17]
    FA5.io_in_b <= _FA5_io_in_b_T @[Adder_8.scala 55:17]
    FA5.io_in_c <= FA4.io_out_c @[Adder_8.scala 51:17]
    FA6.clock <= clock
    FA6.reset <= reset
    FA6.io_in_a <= _FA6_io_in_a_T @[Adder_8.scala 59:17]
    FA6.io_in_b <= _FA6_io_in_b_T @[Adder_8.scala 60:17]
    FA6.io_in_c <= FA5.io_out_c @[Adder_8.scala 56:17]
    FA7.clock <= clock
    FA7.reset <= reset
    FA7.io_in_a <= _FA7_io_in_a_T @[Adder_8.scala 64:17]
    FA7.io_in_b <= _FA7_io_in_b_T @[Adder_8.scala 65:17]
    FA7.io_in_c <= FA6.io_out_c @[Adder_8.scala 61:17]
    out_temp <= mux(reset, UInt<9>("h0"), out_temp) @[Adder_8.scala 21:{27,27,27}]
