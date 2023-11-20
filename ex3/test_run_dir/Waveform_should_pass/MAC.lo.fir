circuit MAC :
  module MAC :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<4>
    input io_in_b : UInt<4>
    input io_in_c : UInt<4>
    output io_out : UInt<8>

    node _io_out_T = mul(io_in_a, io_in_b) @[main.scala 11:23]
    node _io_out_T_1 = add(_io_out_T, io_in_c) @[main.scala 11:33]
    node _io_out_T_2 = tail(_io_out_T_1, 1) @[main.scala 11:33]
    io_out <= _io_out_T_2 @[main.scala 11:12]
