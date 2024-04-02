circuit fir :
  module fir :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<8>
    output io_out : UInt<8>

    reg x_n1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), x_n1) @[fir.scala 10:23]
    reg x_n2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), x_n2) @[fir.scala 11:23]
    reg x_n3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), x_n3) @[fir.scala 12:23]
    node _io_out_T = mul(io_in, UInt<1>("h1")) @[fir.scala 14:21]
    node _io_out_T_1 = mul(x_n1, UInt<2>("h2")) @[fir.scala 14:35]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[fir.scala 14:28]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[fir.scala 14:28]
    node _io_out_T_4 = mul(x_n2, UInt<2>("h3")) @[fir.scala 14:49]
    node _io_out_T_5 = add(_io_out_T_3, _io_out_T_4) @[fir.scala 14:42]
    node _io_out_T_6 = tail(_io_out_T_5, 1) @[fir.scala 14:42]
    node _io_out_T_7 = mul(x_n3, UInt<3>("h4")) @[fir.scala 14:63]
    node _io_out_T_8 = add(_io_out_T_6, _io_out_T_7) @[fir.scala 14:56]
    node _io_out_T_9 = tail(_io_out_T_8, 1) @[fir.scala 14:56]
    io_out <= bits(_io_out_T_9, 7, 0) @[fir.scala 14:12]
    x_n1 <= mux(reset, UInt<1>("h0"), io_in) @[fir.scala 10:{23,23,23}]
    x_n2 <= mux(reset, UInt<1>("h0"), x_n1) @[fir.scala 11:{23,23,23}]
    x_n3 <= mux(reset, UInt<1>("h0"), x_n2) @[fir.scala 12:{23,23,23}]
