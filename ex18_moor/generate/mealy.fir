circuit mealy :
  module mealy :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<1>, dout : UInt<1>}

    reg StageReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[mealy.scala 11:28]
    node _T = eq(UInt<1>("h0"), StageReg) @[mealy.scala 13:21]
    when _T : @[mealy.scala 13:21]
      node _T_1 = eq(io.din, UInt<1>("h1")) @[mealy.scala 15:25]
      when _T_1 : @[mealy.scala 15:33]
        StageReg <= UInt<1>("h1") @[mealy.scala 16:26]
      else :
        StageReg <= StageReg @[mealy.scala 18:22]
    else :
      node _T_2 = eq(UInt<1>("h1"), StageReg) @[mealy.scala 13:21]
      when _T_2 : @[mealy.scala 13:21]
        node _T_3 = eq(io.din, UInt<1>("h1")) @[mealy.scala 23:25]
        when _T_3 : @[mealy.scala 23:33]
          StageReg <= StageReg @[mealy.scala 24:26]
        else :
          StageReg <= UInt<1>("h0") @[mealy.scala 27:26]
    node _io_dout_T = eq(StageReg, UInt<1>("h1")) @[mealy.scala 32:30]
    node _io_dout_T_1 = mux(_io_dout_T, UInt<1>("h1"), UInt<1>("h0")) @[mealy.scala 32:20]
    io.dout <= _io_dout_T_1 @[mealy.scala 32:14]

