circuit XOR :
  module XOR :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<8>
    input io_in_b : UInt<8>
    output io_out_xor : UInt<8>

    node _io_out_xor_T = xor(io_in_a, io_in_b) @[XOR.scala 12:26]
    io_out_xor <= _io_out_xor_T @[XOR.scala 12:15]
