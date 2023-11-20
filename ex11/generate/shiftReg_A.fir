circuit shiftReg_A :
  module shiftReg_A :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_d : UInt<8>, out_d : UInt<8>}

    reg shiftReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[shiftReg_A.scala 17:23]
    node _shiftReg_T = bits(io.in_d, 7, 7) @[shiftReg_A.scala 18:28]
    node _shiftReg_T_1 = bits(io.in_d, 7, 1) @[shiftReg_A.scala 18:41]
    node _shiftReg_T_2 = cat(_shiftReg_T, _shiftReg_T_1) @[Cat.scala 31:58]
    shiftReg <= _shiftReg_T_2 @[shiftReg_A.scala 18:14]
    io.out_d <= shiftReg @[shiftReg_A.scala 19:14]

