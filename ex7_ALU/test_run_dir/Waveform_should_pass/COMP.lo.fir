circuit COMP :
  module COMP :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : SInt<8>
    input io_in_b : SInt<8>
    output io_out_comp : UInt<1>

    node _T = lt(io_in_a, io_in_b) @[COMP.scala 11:18]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[COMP.scala 11:28 12:21 14:21]
    io_out_comp <= _GEN_0
