circuit Mymodule :
  module Mymodule :
    input clock : Clock
    input reset : UInt<1>
    input io_in_1 : UInt<4>
    input io_in_2 : UInt<4>
    input io_sel : UInt<1>
    output io_out_mux : UInt<4>
    output io_out_cat : UInt<8>

    node _io_out_mux_T = mux(io_sel, io_in_1, io_in_2) @[main.scala 14:26]
    node _io_out_cat_T = cat(io_in_1, io_in_2) @[Cat.scala 31:58]
    io_out_mux <= _io_out_mux_T @[main.scala 14:20]
    io_out_cat <= _io_out_cat_T @[main.scala 15:20]
