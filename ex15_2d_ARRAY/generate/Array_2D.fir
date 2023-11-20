circuit Array_2D :
  module Array_2D :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<8>, flip in_en : UInt<1>, out_en : UInt<1>, out : UInt<8>}

    reg stage : UInt<2>, clock with :
      reset => (reset, UInt<2>("h2")) @[main.scala 15:24]
    reg out_reg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[main.scala 18:26]
    reg in_en_r : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[main.scala 21:27]
    in_en_r <= io.in_en @[main.scala 22:13]
    wire _twoDVecT_WIRE : UInt<8>[3][3] @[main.scala 25:45]
    _twoDVecT_WIRE[0][0] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[0][1] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[0][2] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[1][0] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[1][1] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[1][2] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[2][0] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[2][1] <= UInt<8>("h0") @[main.scala 25:45]
    _twoDVecT_WIRE[2][2] <= UInt<8>("h0") @[main.scala 25:45]
    reg twoDVecT : UInt<8>[3][3], clock with :
      reset => (reset, _twoDVecT_WIRE) @[main.scala 25:27]
    when io.in_en : @[main.scala 29:19]
      stage <= UInt<2>("h1") @[main.scala 30:15]
      twoDVecT[0][0] <= io.in_a @[main.scala 34:31]
      twoDVecT[1][0] <= io.in_a @[main.scala 34:31]
      twoDVecT[2][0] <= io.in_a @[main.scala 34:31]
      twoDVecT[0][1] <= io.in_a @[main.scala 34:31]
      twoDVecT[1][1] <= io.in_a @[main.scala 34:31]
      twoDVecT[2][1] <= io.in_a @[main.scala 34:31]
      twoDVecT[0][2] <= io.in_a @[main.scala 34:31]
      twoDVecT[1][2] <= io.in_a @[main.scala 34:31]
      twoDVecT[2][2] <= io.in_a @[main.scala 34:31]
    node _T = eq(io.in_en, UInt<1>("h0")) @[main.scala 40:20]
    node _T_1 = and(in_en_r, _T) @[main.scala 40:18]
    when _T_1 : @[main.scala 40:30]
      stage <= UInt<2>("h0") @[main.scala 41:15]
    node _T_2 = eq(stage, UInt<2>("h0")) @[main.scala 45:16]
    when _T_2 : @[main.scala 45:25]
      io.out_en <= UInt<1>("h1") @[main.scala 46:18]
      out_reg <= twoDVecT[0][0] @[main.scala 49:29]
      out_reg <= twoDVecT[0][1] @[main.scala 49:29]
      out_reg <= twoDVecT[0][2] @[main.scala 49:29]
      out_reg <= twoDVecT[1][0] @[main.scala 49:29]
      out_reg <= twoDVecT[1][1] @[main.scala 49:29]
      out_reg <= twoDVecT[1][2] @[main.scala 49:29]
      out_reg <= twoDVecT[2][0] @[main.scala 49:29]
      out_reg <= twoDVecT[2][1] @[main.scala 49:29]
      out_reg <= twoDVecT[2][2] @[main.scala 49:29]
    else :
      out_reg <= UInt<1>("h0") @[main.scala 53:17]
      io.out_en <= UInt<1>("h0") @[main.scala 54:18]
    io.out <= out_reg @[main.scala 56:12]

