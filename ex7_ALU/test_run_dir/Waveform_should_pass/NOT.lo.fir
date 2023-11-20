circuit NOT :
  module NOT :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<8>
    output io_out_not_a : UInt<8>

    node _io_out_not_a_T = not(io_in_a) @[NOT.scala 11:21]
    io_out_not_a <= _io_out_not_a_T @[NOT.scala 11:18]
