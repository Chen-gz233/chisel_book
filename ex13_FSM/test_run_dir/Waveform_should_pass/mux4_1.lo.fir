circuit mux4_1 :
  module mux4_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<4>
    input io_in_sel : UInt<2>
    output io_out : UInt<1>

    node _T = eq(io_in_sel, UInt<1>("h0")) @[main.scala 12:21]
    node _io_out_T = bits(io_in_a, 0, 0) @[main.scala 13:26]
    node _T_1 = eq(io_in_sel, UInt<1>("h1")) @[main.scala 14:26]
    node _io_out_T_1 = bits(io_in_a, 1, 1) @[main.scala 15:26]
    node _T_2 = eq(io_in_sel, UInt<2>("h2")) @[main.scala 16:26]
    node _io_out_T_2 = bits(io_in_a, 2, 2) @[main.scala 17:26]
    node _T_3 = eq(io_in_sel, UInt<2>("h3")) @[main.scala 18:26]
    node _io_out_T_3 = bits(io_in_a, 3, 3) @[main.scala 19:26]
    node _io_out_T_4 = bits(io_in_a, 0, 0) @[main.scala 21:25]
    node _GEN_0 = mux(_T_3, _io_out_T_3, _io_out_T_4) @[main.scala 18:33 19:16 21:15]
    node _GEN_1 = mux(_T_2, _io_out_T_2, _GEN_0) @[main.scala 16:33 17:16]
    node _GEN_2 = mux(_T_1, _io_out_T_1, _GEN_1) @[main.scala 14:33 15:16]
    node _GEN_3 = mux(_T, _io_out_T, _GEN_2) @[main.scala 12:28 13:16]
    io_out <= _GEN_3
