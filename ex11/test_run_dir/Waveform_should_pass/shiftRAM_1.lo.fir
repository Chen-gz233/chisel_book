circuit shiftRAM_1 :
  module shiftRAM_1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    output io_out : UInt<1>

    reg shiftReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[main.scala 17:23]
    reg Q1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Q1) @[main.scala 19:17]
    reg Q2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Q2) @[main.scala 20:17]
    reg Q3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Q3) @[main.scala 21:17]
    reg Q4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Q4) @[main.scala 22:17]
    node _shiftReg_T = bits(shiftReg, 2, 0) @[main.scala 24:29]
    node _shiftReg_T_1 = cat(_shiftReg_T, io_in) @[Cat.scala 31:58]
    node _Q1_T = bits(shiftReg, 0, 0) @[main.scala 26:19]
    node _Q2_T = bits(shiftReg, 1, 1) @[main.scala 27:19]
    node _Q3_T = bits(shiftReg, 2, 2) @[main.scala 28:19]
    node _Q4_T = bits(shiftReg, 3, 3) @[main.scala 29:19]
    node _io_out_T = bits(shiftReg, 3, 3) @[main.scala 31:23]
    io_out <= _io_out_T @[main.scala 31:12]
    shiftReg <= _shiftReg_T_1 @[main.scala 24:14]
    Q1 <= _Q1_T @[main.scala 26:8]
    Q2 <= _Q2_T @[main.scala 27:8]
    Q3 <= _Q3_T @[main.scala 28:8]
    Q4 <= _Q4_T @[main.scala 29:8]
