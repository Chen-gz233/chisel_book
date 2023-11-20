circuit Mymodule :
  module Mymodule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_1 : UInt<4>, flip in_2 : UInt<4>, flip sel : UInt<1>, out_mux : UInt<4>, out_cat : UInt<8>}

    node _io_out_mux_T = mux(io.sel, io.in_1, io.in_2) @[main.scala 14:26]
    io.out_mux <= _io_out_mux_T @[main.scala 14:20]
    node _io_out_cat_T = cat(io.in_1, io.in_2) @[Cat.scala 31:58]
    io.out_cat <= _io_out_cat_T @[main.scala 15:20]

