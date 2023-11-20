circuit FuncModule :
  module FuncModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<4>, flip b : UInt<4>, out : UInt<8>}

    node add_out = add(io.a, io.b) @[main.scala 6:15]
    io.out <= add_out @[main.scala 15:12]

