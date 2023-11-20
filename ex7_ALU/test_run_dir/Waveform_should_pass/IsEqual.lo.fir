circuit IsEqual :
  module IsEqual :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : SInt<8>
    input io_in_b : SInt<8>
    output io_out_equal : UInt<1>

    node _T = eq(io_in_a, io_in_b) @[IsEqual.scala 11:18]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[IsEqual.scala 11:30 12:17 14:21]
    io_out_equal <= _GEN_0
