circuit Register :
  module Register :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<1>, flip in_en : UInt<1>, out : UInt<1>}

    reg shiftReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[main.scala 10:27]
    node _shiftReg_T = bits(io.in_en, 0, 0) @[main.scala 11:30]
    node _shiftReg_T_1 = mux(_shiftReg_T, io.in_a, shiftReg) @[main.scala 11:20]
    shiftReg <= _shiftReg_T_1 @[main.scala 11:14]
    io.out <= shiftReg @[main.scala 12:12]

