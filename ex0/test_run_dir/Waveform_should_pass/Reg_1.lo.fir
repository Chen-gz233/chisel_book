circuit Reg_1 :
  module Reg_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<12>
    output io_out : UInt<12>

    reg myReg_1 : UInt<12>, clock with :
      reset => (UInt<1>("h0"), myReg_1) @[main.scala 11:22]
    io_out <= myReg_1 @[main.scala 18:12]
    myReg_1 <= io_in @[main.scala 16:13]
