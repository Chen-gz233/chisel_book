circuit AND :
  module AND :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<8>
    input io_in_b : UInt<8>
    output io_out_and : UInt<8>

    node _io_out_and_T = and(io_in_a, io_in_b) @[AND.scala 12:26]
    io_out_and <= _io_out_and_T @[AND.scala 12:15]
