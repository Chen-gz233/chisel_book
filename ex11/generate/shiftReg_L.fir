circuit shiftReg_L :
  module shiftReg_L :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>, out : UInt<8>}

    reg shiftReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[shiftReg_L.scala 18:23]
    reg Q1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), Q1) @[shiftReg_L.scala 20:17]
    reg Q2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), Q2) @[shiftReg_L.scala 21:17]
    reg Q3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), Q3) @[shiftReg_L.scala 22:17]
    reg Q4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), Q4) @[shiftReg_L.scala 23:17]
    node _shiftReg_T = bits(shiftReg, 23, 0) @[shiftReg_L.scala 25:29]
    node _shiftReg_T_1 = cat(_shiftReg_T, io.in) @[Cat.scala 31:58]
    shiftReg <= _shiftReg_T_1 @[shiftReg_L.scala 25:14]
    node _Q1_T = bits(shiftReg, 7, 0) @[shiftReg_L.scala 27:19]
    Q1 <= _Q1_T @[shiftReg_L.scala 27:8]
    node _Q2_T = bits(shiftReg, 15, 8) @[shiftReg_L.scala 28:19]
    Q2 <= _Q2_T @[shiftReg_L.scala 28:8]
    node _Q3_T = bits(shiftReg, 23, 16) @[shiftReg_L.scala 29:19]
    Q3 <= _Q3_T @[shiftReg_L.scala 29:8]
    node _Q4_T = bits(shiftReg, 31, 24) @[shiftReg_L.scala 30:19]
    Q4 <= _Q4_T @[shiftReg_L.scala 30:8]
    node _io_out_T = bits(shiftReg, 31, 24) @[shiftReg_L.scala 32:23]
    io.out <= _io_out_T @[shiftReg_L.scala 32:12]

