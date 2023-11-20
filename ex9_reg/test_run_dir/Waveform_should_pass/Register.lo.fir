circuit Register :
  module Register :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<1>
    input io_in_en : UInt<1>
    output io_out : UInt<1>

    reg shiftReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[reg_1.scala 15:27]
    node _shiftReg_T = bits(io_in_en, 0, 0) @[reg_1.scala 17:30]
    node _shiftReg_T_1 = mux(_shiftReg_T, io_in_a, shiftReg) @[reg_1.scala 17:20]
    io_out <= shiftReg @[reg_1.scala 18:12]
    shiftReg <= mux(reset, UInt<1>("h0"), _shiftReg_T_1) @[reg_1.scala 15:{27,27} 17:14]
