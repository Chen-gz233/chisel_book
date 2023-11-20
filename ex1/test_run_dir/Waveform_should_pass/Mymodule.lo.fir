circuit Mymodule :
  module Mymodule :
    input clock : Clock
    input reset : UInt<1>
    input io_in_1 : UInt<4>
    input io_in_2 : UInt<4>
    output io_out_add : UInt<4>
    output io_out_sub : UInt<4>
    output io_out_mul : UInt<4>

    node _io_out_add_T = add(io_in_1, io_in_2) @[main.scala 13:31]
    node _io_out_add_T_1 = tail(_io_out_add_T, 1) @[main.scala 13:31]
    node _io_out_sub_T = sub(io_in_1, io_in_2) @[main.scala 14:31]
    node _io_out_sub_T_1 = tail(_io_out_sub_T, 1) @[main.scala 14:31]
    node _io_out_mul_T = mul(io_in_1, io_in_2) @[main.scala 15:31]
    io_out_add <= _io_out_add_T_1 @[main.scala 13:20]
    io_out_sub <= _io_out_sub_T_1 @[main.scala 14:20]
    io_out_mul <= bits(_io_out_mul_T, 3, 0) @[main.scala 15:20]
