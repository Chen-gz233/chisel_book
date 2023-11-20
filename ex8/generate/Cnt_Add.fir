circuit Cnt_Add :
  module Cnt_Add :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_en : UInt<1>, out_en : UInt<1>, out_cnt : UInt<8>}

    reg cntReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[main.scala 11:25]
    node _cntReg_T = eq(cntReg, UInt<4>("h9")) @[main.scala 12:27]
    node _cntReg_T_1 = eq(io.in_en, UInt<1>("h1")) @[main.scala 12:46]
    node _cntReg_T_2 = and(_cntReg_T, _cntReg_T_1) @[main.scala 12:35]
    node _cntReg_T_3 = add(cntReg, UInt<1>("h1")) @[main.scala 12:67]
    node _cntReg_T_4 = tail(_cntReg_T_3, 1) @[main.scala 12:67]
    node _cntReg_T_5 = mux(_cntReg_T_2, UInt<1>("h0"), _cntReg_T_4) @[main.scala 12:18]
    cntReg <= _cntReg_T_5 @[main.scala 12:12]
    node _T = eq(io.in_en, UInt<1>("h1")) @[main.scala 13:18]
    when _T : @[main.scala 13:25]
      io.out_cnt <= cntReg @[main.scala 14:20]
      io.out_en <= UInt<1>("h1") @[main.scala 15:19]
    else :
      io.out_cnt <= cntReg @[main.scala 17:20]
      io.out_en <= UInt<1>("h0") @[main.scala 18:19]

