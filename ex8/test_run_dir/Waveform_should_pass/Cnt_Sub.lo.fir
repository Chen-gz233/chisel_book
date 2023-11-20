circuit Cnt_Sub :
  module Cnt_Sub :
    input clock : Clock
    input reset : UInt<1>
    input io_in_en : UInt<1>
    output io_out_en : UInt<1>
    output io_out_cnt : UInt<8>

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Cnt_Sub.scala 11:25]
    node _cntReg_T = eq(io_in_en, UInt<1>("h1")) @[Cnt_Sub.scala 12:27]
    node _cntReg_T_1 = eq(cntReg, UInt<1>("h0")) @[Cnt_Sub.scala 12:50]
    node _cntReg_T_2 = sub(cntReg, UInt<1>("h1")) @[Cnt_Sub.scala 12:72]
    node _cntReg_T_3 = tail(_cntReg_T_2, 1) @[Cnt_Sub.scala 12:72]
    node _cntReg_T_4 = mux(_cntReg_T_1, UInt<4>("h9"), _cntReg_T_3) @[Cnt_Sub.scala 12:41]
    node _cntReg_T_5 = mux(_cntReg_T, _cntReg_T_4, UInt<1>("h0")) @[Cnt_Sub.scala 12:18]
    node _T = eq(io_in_en, UInt<1>("h1")) @[Cnt_Sub.scala 13:18]
    node _GEN_0 = mux(_T, cntReg, cntReg) @[Cnt_Sub.scala 13:25 14:20 17:20]
    node _GEN_1 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Cnt_Sub.scala 13:25 15:19 18:19]
    io_out_en <= _GEN_1
    io_out_cnt <= _GEN_0
    cntReg <= mux(reset, UInt<8>("h9"), _cntReg_T_5) @[Cnt_Sub.scala 11:{25,25} 12:12]
