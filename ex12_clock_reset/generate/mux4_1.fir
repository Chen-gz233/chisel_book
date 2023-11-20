circuit mux4_1 :
  module mux4_1 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<4>, flip in_sel : UInt<2>, out : UInt<1>}

    node _T = eq(io.in_sel, UInt<1>("h0")) @[main.scala 12:21]
    when _T : @[main.scala 12:28]
      node _io_out_T = bits(io.in_a, 0, 0) @[main.scala 13:26]
      io.out <= _io_out_T @[main.scala 13:16]
    else :
      node _T_1 = eq(io.in_sel, UInt<1>("h1")) @[main.scala 14:26]
      when _T_1 : @[main.scala 14:33]
        node _io_out_T_1 = bits(io.in_a, 1, 1) @[main.scala 15:26]
        io.out <= _io_out_T_1 @[main.scala 15:16]
      else :
        node _T_2 = eq(io.in_sel, UInt<2>("h2")) @[main.scala 16:26]
        when _T_2 : @[main.scala 16:33]
          node _io_out_T_2 = bits(io.in_a, 2, 2) @[main.scala 17:26]
          io.out <= _io_out_T_2 @[main.scala 17:16]
        else :
          node _T_3 = eq(io.in_sel, UInt<2>("h3")) @[main.scala 18:26]
          when _T_3 : @[main.scala 18:33]
            node _io_out_T_3 = bits(io.in_a, 3, 3) @[main.scala 19:26]
            io.out <= _io_out_T_3 @[main.scala 19:16]
          else :
            node _io_out_T_4 = bits(io.in_a, 0, 0) @[main.scala 21:25]
            io.out <= _io_out_T_4 @[main.scala 21:15]

