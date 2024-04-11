circuit moor :
  module moor :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<1>, dout : UInt<1>}

    reg StageReg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[moor.scala 11:27]
    node _T = eq(UInt<2>("h0"), StageReg) @[moor.scala 14:21]
    when _T : @[moor.scala 14:21]
      node _T_1 = eq(io.din, UInt<1>("h1")) @[moor.scala 16:25]
      when _T_1 : @[moor.scala 16:33]
        StageReg <= UInt<2>("h1") @[moor.scala 17:26]
      else :
        StageReg <= StageReg @[moor.scala 19:25]
    else :
      node _T_2 = eq(UInt<2>("h1"), StageReg) @[moor.scala 14:21]
      when _T_2 : @[moor.scala 14:21]
        node _T_3 = eq(io.din, UInt<1>("h1")) @[moor.scala 24:24]
        when _T_3 : @[moor.scala 24:31]
          StageReg <= UInt<2>("h2") @[moor.scala 25:26]
        else :
          StageReg <= UInt<2>("h0") @[moor.scala 27:26]
      else :
        node _T_4 = eq(UInt<2>("h2"), StageReg) @[moor.scala 14:21]
        when _T_4 : @[moor.scala 14:21]
          node _T_5 = eq(io.din, UInt<1>("h0")) @[moor.scala 31:25]
          when _T_5 : @[moor.scala 31:33]
            StageReg <= UInt<2>("h0") @[moor.scala 32:26]
          else :
            StageReg <= StageReg @[moor.scala 34:26]
    node _io_dout_T = eq(StageReg, UInt<2>("h2")) @[moor.scala 38:29]
    node _io_dout_T_1 = mux(_io_dout_T, UInt<1>("h1"), UInt<1>("h0")) @[moor.scala 38:19]
    io.dout <= _io_dout_T_1 @[moor.scala 38:13]

