circuit Array_2D :
  module Array_2D :
    input clock : Clock
    input reset : UInt<1>
    input io_inMatrix_0_0 : UInt<8>
    input io_inMatrix_0_1 : UInt<8>
    input io_inMatrix_0_2 : UInt<8>
    input io_inMatrix_1_0 : UInt<8>
    input io_inMatrix_1_1 : UInt<8>
    input io_inMatrix_1_2 : UInt<8>
    input io_inMatrix_2_0 : UInt<8>
    input io_inMatrix_2_1 : UInt<8>
    input io_inMatrix_2_2 : UInt<8>
    output io_outMatrix_0_0 : UInt<8>
    output io_outMatrix_0_1 : UInt<8>
    output io_outMatrix_0_2 : UInt<8>
    output io_outMatrix_1_0 : UInt<8>
    output io_outMatrix_1_1 : UInt<8>
    output io_outMatrix_1_2 : UInt<8>
    output io_outMatrix_2_0 : UInt<8>
    output io_outMatrix_2_1 : UInt<8>
    output io_outMatrix_2_2 : UInt<8>

    io_outMatrix_0_0 <= io_inMatrix_0_0 @[main.scala 13:32]
    io_outMatrix_0_1 <= io_inMatrix_1_0 @[main.scala 13:32]
    io_outMatrix_0_2 <= io_inMatrix_2_0 @[main.scala 13:32]
    io_outMatrix_1_0 <= io_inMatrix_0_1 @[main.scala 13:32]
    io_outMatrix_1_1 <= io_inMatrix_1_1 @[main.scala 13:32]
    io_outMatrix_1_2 <= io_inMatrix_2_1 @[main.scala 13:32]
    io_outMatrix_2_0 <= io_inMatrix_0_2 @[main.scala 13:32]
    io_outMatrix_2_1 <= io_inMatrix_1_2 @[main.scala 13:32]
    io_outMatrix_2_2 <= io_inMatrix_2_2 @[main.scala 13:32]
