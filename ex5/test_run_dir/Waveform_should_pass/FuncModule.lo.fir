circuit FuncModule :
  module FuncModule :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<4>
    input io_b : UInt<4>
    output io_out : UInt<8>

    node add_out = add(io_a, io_b) @[main.scala 6:15]
    io_out <= pad(add_out, 8) @[main.scala 15:12]
