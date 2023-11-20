circuit FSM :
  module FSM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<1>, out : UInt<1>}

    reg stage : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[main.scala 17:24]
    wire outReg : UInt<1> @[main.scala 19:22]
    outReg <= UInt<1>("h0") @[main.scala 21:12]
    node _T = eq(UInt<4>("h0"), stage) @[main.scala 26:18]
    when _T : @[main.scala 26:18]
      node _T_1 = eq(io.in, UInt<1>("h0")) @[main.scala 28:24]
      when _T_1 : @[main.scala 28:32]
        stage <= UInt<4>("h1") @[main.scala 29:23]
      else :
        stage <= UInt<4>("h5") @[main.scala 31:23]
    else :
      node _T_2 = eq(UInt<4>("h1"), stage) @[main.scala 26:18]
      when _T_2 : @[main.scala 26:18]
        node _T_3 = eq(io.in, UInt<1>("h0")) @[main.scala 35:24]
        when _T_3 : @[main.scala 35:32]
          stage <= UInt<4>("h2") @[main.scala 36:23]
          outReg <= UInt<1>("h0") @[main.scala 37:24]
        else :
          stage <= UInt<4>("h5") @[main.scala 39:23]
          outReg <= UInt<1>("h0") @[main.scala 40:24]
      else :
        node _T_4 = eq(UInt<4>("h2"), stage) @[main.scala 26:18]
        when _T_4 : @[main.scala 26:18]
          node _T_5 = eq(io.in, UInt<1>("h0")) @[main.scala 45:24]
          when _T_5 : @[main.scala 45:32]
            stage <= UInt<4>("h3") @[main.scala 46:23]
          else :
            stage <= UInt<4>("h5") @[main.scala 48:23]
        else :
          node _T_6 = eq(UInt<4>("h3"), stage) @[main.scala 26:18]
          when _T_6 : @[main.scala 26:18]
            node _T_7 = eq(io.in, UInt<1>("h0")) @[main.scala 52:24]
            when _T_7 : @[main.scala 52:32]
              stage <= UInt<4>("h4") @[main.scala 53:23]
            else :
              stage <= UInt<4>("h5") @[main.scala 55:23]
          else :
            node _T_8 = eq(UInt<4>("h4"), stage) @[main.scala 26:18]
            when _T_8 : @[main.scala 26:18]
              node _T_9 = eq(io.in, UInt<1>("h0")) @[main.scala 59:24]
              when _T_9 : @[main.scala 59:32]
                stage <= UInt<4>("h4") @[main.scala 60:23]
                outReg <= UInt<1>("h1") @[main.scala 61:24]
              else :
                stage <= UInt<4>("h5") @[main.scala 63:23]
            else :
              node _T_10 = eq(UInt<4>("h5"), stage) @[main.scala 26:18]
              when _T_10 : @[main.scala 26:18]
                node _T_11 = eq(io.in, UInt<1>("h0")) @[main.scala 68:24]
                when _T_11 : @[main.scala 68:32]
                  stage <= UInt<4>("h1") @[main.scala 69:23]
                  outReg <= UInt<1>("h0") @[main.scala 70:24]
                else :
                  stage <= UInt<4>("h6") @[main.scala 72:23]
                  outReg <= UInt<1>("h0") @[main.scala 73:24]
              else :
                node _T_12 = eq(UInt<4>("h6"), stage) @[main.scala 26:18]
                when _T_12 : @[main.scala 26:18]
                  node _T_13 = eq(io.in, UInt<1>("h0")) @[main.scala 77:24]
                  when _T_13 : @[main.scala 77:32]
                    stage <= UInt<4>("h1") @[main.scala 78:23]
                  else :
                    stage <= UInt<4>("h7") @[main.scala 80:23]
                else :
                  node _T_14 = eq(UInt<4>("h7"), stage) @[main.scala 26:18]
                  when _T_14 : @[main.scala 26:18]
                    node _T_15 = eq(io.in, UInt<1>("h0")) @[main.scala 85:24]
                    when _T_15 : @[main.scala 85:32]
                      stage <= UInt<4>("h1") @[main.scala 86:23]
                    else :
                      stage <= UInt<4>("h8") @[main.scala 88:23]
                  else :
                    node _T_16 = eq(UInt<4>("h8"), stage) @[main.scala 26:18]
                    when _T_16 : @[main.scala 26:18]
                      node _T_17 = eq(io.in, UInt<1>("h0")) @[main.scala 93:28]
                      when _T_17 : @[main.scala 93:36]
                        stage <= UInt<4>("h1") @[main.scala 94:27]
                      else :
                        stage <= UInt<4>("h8") @[main.scala 96:27]
                        outReg <= UInt<1>("h1") @[main.scala 97:28]
    io.out <= outReg @[main.scala 102:8]

