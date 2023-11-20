circuit Full_Adder :
  module Full_Adder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

