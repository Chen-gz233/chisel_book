circuit Register_2 :
  module Register_2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<4>
    input io_in_en : UInt<1>
    input io_in_clr : UInt<1>
    output io_out : UInt<4>

    reg shiftReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[reg_2.scala 12:23]
    node _T = eq(io_in_clr, UInt<1>("h0")) @[reg_2.scala 19:16]
    node _T_1 = and(_T, io_in_en) @[reg_2.scala 19:27]
    node _shiftReg_T = add(shiftReg, UInt<1>("h1")) @[reg_2.scala 20:30]
    node _shiftReg_T_1 = tail(_shiftReg_T, 1) @[reg_2.scala 20:30]
    node _GEN_0 = mux(_T_1, _shiftReg_T_1, shiftReg) @[reg_2.scala 19:38 20:18 22:18]
    node _GEN_1 = mux(io_in_clr, io_in_a, _GEN_0) @[reg_2.scala 17:20 18:18]
    io_out <= shiftReg @[reg_2.scala 24:12]
    shiftReg <= _GEN_1
