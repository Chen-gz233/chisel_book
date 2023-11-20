circuit Full_Adder :
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
