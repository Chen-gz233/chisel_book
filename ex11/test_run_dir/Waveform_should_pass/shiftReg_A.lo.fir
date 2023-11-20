circuit shiftReg_A :
  module shiftReg_A :
    input clock : Clock
    input reset : UInt<1>
    input io_in_d : UInt<8>
    output io_out_d : UInt<8>

    reg shiftReg_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg_0) @[shiftReg_A.scala 19:39]
    reg shiftReg_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg_1) @[shiftReg_A.scala 19:39]
    reg shiftReg_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg_2) @[shiftReg_A.scala 19:39]
    reg shiftReg_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg_3) @[shiftReg_A.scala 19:39]
    node _shiftReg_0_T = bits(io_in_d, 7, 7) @[shiftReg_A.scala 23:43]
    node _shiftReg_0_T_1 = cat(_shiftReg_0_T, _shiftReg_0_T) @[Cat.scala 31:58]
    node _shiftReg_0_T_2 = cat(_shiftReg_0_T, _shiftReg_0_T_1) @[Cat.scala 31:58]
    node _shiftReg_0_T_3 = cat(_shiftReg_0_T, _shiftReg_0_T_2) @[Cat.scala 31:58]
    node _shiftReg_0_T_4 = bits(io_in_d, 7, 4) @[shiftReg_A.scala 23:62]
    node _shiftReg_0_T_5 = cat(_shiftReg_0_T_3, _shiftReg_0_T_4) @[Cat.scala 31:58]
    io_out_d <= shiftReg_3 @[shiftReg_A.scala 27:14]
    shiftReg_0 <= mux(reset, UInt<8>("h0"), _shiftReg_0_T_5) @[shiftReg_A.scala 19:{39,39} 23:17]
    shiftReg_1 <= mux(reset, UInt<8>("h0"), shiftReg_0) @[shiftReg_A.scala 19:{39,39} 25:21]
    shiftReg_2 <= mux(reset, UInt<8>("h0"), shiftReg_1) @[shiftReg_A.scala 19:{39,39} 25:21]
    shiftReg_3 <= mux(reset, UInt<8>("h0"), shiftReg_2) @[shiftReg_A.scala 19:{39,39} 25:21]
