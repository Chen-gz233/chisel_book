circuit Mymodule :
  module Mymodule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_1 : UInt<4>, flip in_2 : UInt<4>, out_add : UInt<4>, out_sub : UInt<4>, out_mul : UInt<4>}

    node _io_out_add_T = add(io.in_1, io.in_2) @[main.scala 13:31]
    node _io_out_add_T_1 = tail(_io_out_add_T, 1) @[main.scala 13:31]
    io.out_add <= _io_out_add_T_1 @[main.scala 13:20]
    node _io_out_sub_T = sub(io.in_1, io.in_2) @[main.scala 14:31]
    node _io_out_sub_T_1 = tail(_io_out_sub_T, 1) @[main.scala 14:31]
    io.out_sub <= _io_out_sub_T_1 @[main.scala 14:20]
    node _io_out_mul_T = mul(io.in_1, io.in_2) @[main.scala 15:31]
    io.out_mul <= _io_out_mul_T @[main.scala 15:20]

