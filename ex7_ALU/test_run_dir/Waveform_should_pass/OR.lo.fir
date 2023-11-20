circuit OR :
  module OR :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<8>
    input io_in_b : UInt<8>
    output io_out_or : UInt<8>

    node _io_out_or_T = or(io_in_a, io_in_b) @[OR.scala 12:25]
    io_out_or <= _io_out_or_T @[OR.scala 12:14]
