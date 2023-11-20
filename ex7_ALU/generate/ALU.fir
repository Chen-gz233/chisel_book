circuit ALU :
  module Full_Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Adder_N :
    input clock : Clock
    input reset : Reset
    output io : { flip A : SInt<32>, flip B : SInt<32>, flip Cin : UInt<1>, Sum : SInt<32>, Cout : UInt<1>}

    inst Full_Adder of Full_Adder @[Adder_N.scala 15:35]
    Full_Adder.clock <= clock
    Full_Adder.reset <= reset
    inst Full_Adder_1 of Full_Adder_1 @[Adder_N.scala 15:35]
    Full_Adder_1.clock <= clock
    Full_Adder_1.reset <= reset
    inst Full_Adder_2 of Full_Adder_2 @[Adder_N.scala 15:35]
    Full_Adder_2.clock <= clock
    Full_Adder_2.reset <= reset
    inst Full_Adder_3 of Full_Adder_3 @[Adder_N.scala 15:35]
    Full_Adder_3.clock <= clock
    Full_Adder_3.reset <= reset
    inst Full_Adder_4 of Full_Adder_4 @[Adder_N.scala 15:35]
    Full_Adder_4.clock <= clock
    Full_Adder_4.reset <= reset
    inst Full_Adder_5 of Full_Adder_5 @[Adder_N.scala 15:35]
    Full_Adder_5.clock <= clock
    Full_Adder_5.reset <= reset
    inst Full_Adder_6 of Full_Adder_6 @[Adder_N.scala 15:35]
    Full_Adder_6.clock <= clock
    Full_Adder_6.reset <= reset
    inst Full_Adder_7 of Full_Adder_7 @[Adder_N.scala 15:35]
    Full_Adder_7.clock <= clock
    Full_Adder_7.reset <= reset
    inst Full_Adder_8 of Full_Adder_8 @[Adder_N.scala 15:35]
    Full_Adder_8.clock <= clock
    Full_Adder_8.reset <= reset
    inst Full_Adder_9 of Full_Adder_9 @[Adder_N.scala 15:35]
    Full_Adder_9.clock <= clock
    Full_Adder_9.reset <= reset
    inst Full_Adder_10 of Full_Adder_10 @[Adder_N.scala 15:35]
    Full_Adder_10.clock <= clock
    Full_Adder_10.reset <= reset
    inst Full_Adder_11 of Full_Adder_11 @[Adder_N.scala 15:35]
    Full_Adder_11.clock <= clock
    Full_Adder_11.reset <= reset
    inst Full_Adder_12 of Full_Adder_12 @[Adder_N.scala 15:35]
    Full_Adder_12.clock <= clock
    Full_Adder_12.reset <= reset
    inst Full_Adder_13 of Full_Adder_13 @[Adder_N.scala 15:35]
    Full_Adder_13.clock <= clock
    Full_Adder_13.reset <= reset
    inst Full_Adder_14 of Full_Adder_14 @[Adder_N.scala 15:35]
    Full_Adder_14.clock <= clock
    Full_Adder_14.reset <= reset
    inst Full_Adder_15 of Full_Adder_15 @[Adder_N.scala 15:35]
    Full_Adder_15.clock <= clock
    Full_Adder_15.reset <= reset
    inst Full_Adder_16 of Full_Adder_16 @[Adder_N.scala 15:35]
    Full_Adder_16.clock <= clock
    Full_Adder_16.reset <= reset
    inst Full_Adder_17 of Full_Adder_17 @[Adder_N.scala 15:35]
    Full_Adder_17.clock <= clock
    Full_Adder_17.reset <= reset
    inst Full_Adder_18 of Full_Adder_18 @[Adder_N.scala 15:35]
    Full_Adder_18.clock <= clock
    Full_Adder_18.reset <= reset
    inst Full_Adder_19 of Full_Adder_19 @[Adder_N.scala 15:35]
    Full_Adder_19.clock <= clock
    Full_Adder_19.reset <= reset
    inst Full_Adder_20 of Full_Adder_20 @[Adder_N.scala 15:35]
    Full_Adder_20.clock <= clock
    Full_Adder_20.reset <= reset
    inst Full_Adder_21 of Full_Adder_21 @[Adder_N.scala 15:35]
    Full_Adder_21.clock <= clock
    Full_Adder_21.reset <= reset
    inst Full_Adder_22 of Full_Adder_22 @[Adder_N.scala 15:35]
    Full_Adder_22.clock <= clock
    Full_Adder_22.reset <= reset
    inst Full_Adder_23 of Full_Adder_23 @[Adder_N.scala 15:35]
    Full_Adder_23.clock <= clock
    Full_Adder_23.reset <= reset
    inst Full_Adder_24 of Full_Adder_24 @[Adder_N.scala 15:35]
    Full_Adder_24.clock <= clock
    Full_Adder_24.reset <= reset
    inst Full_Adder_25 of Full_Adder_25 @[Adder_N.scala 15:35]
    Full_Adder_25.clock <= clock
    Full_Adder_25.reset <= reset
    inst Full_Adder_26 of Full_Adder_26 @[Adder_N.scala 15:35]
    Full_Adder_26.clock <= clock
    Full_Adder_26.reset <= reset
    inst Full_Adder_27 of Full_Adder_27 @[Adder_N.scala 15:35]
    Full_Adder_27.clock <= clock
    Full_Adder_27.reset <= reset
    inst Full_Adder_28 of Full_Adder_28 @[Adder_N.scala 15:35]
    Full_Adder_28.clock <= clock
    Full_Adder_28.reset <= reset
    inst Full_Adder_29 of Full_Adder_29 @[Adder_N.scala 15:35]
    Full_Adder_29.clock <= clock
    Full_Adder_29.reset <= reset
    inst Full_Adder_30 of Full_Adder_30 @[Adder_N.scala 15:35]
    Full_Adder_30.clock <= clock
    Full_Adder_30.reset <= reset
    inst Full_Adder_31 of Full_Adder_31 @[Adder_N.scala 15:35]
    Full_Adder_31.clock <= clock
    Full_Adder_31.reset <= reset
    wire carry : UInt<1>[33] @[Adder_N.scala 17:21]
    wire sum : UInt<1>[32] @[Adder_N.scala 18:19]
    carry[0] <= io.Cin @[Adder_N.scala 21:14]
    node _T = bits(io.A, 0, 0) @[Adder_N.scala 24:28]
    Full_Adder.io.in_a <= _T @[Adder_N.scala 24:21]
    node _T_1 = bits(io.B, 0, 0) @[Adder_N.scala 25:28]
    Full_Adder.io.in_b <= _T_1 @[Adder_N.scala 25:21]
    Full_Adder.io.in_c <= carry[0] @[Adder_N.scala 26:21]
    carry[1] <= Full_Adder.io.out_c @[Adder_N.scala 27:20]
    sum[0] <= Full_Adder.io.out_s @[Adder_N.scala 28:16]
    node _T_2 = bits(io.A, 1, 1) @[Adder_N.scala 24:28]
    Full_Adder_1.io.in_a <= _T_2 @[Adder_N.scala 24:21]
    node _T_3 = bits(io.B, 1, 1) @[Adder_N.scala 25:28]
    Full_Adder_1.io.in_b <= _T_3 @[Adder_N.scala 25:21]
    Full_Adder_1.io.in_c <= carry[1] @[Adder_N.scala 26:21]
    carry[2] <= Full_Adder_1.io.out_c @[Adder_N.scala 27:20]
    sum[1] <= Full_Adder_1.io.out_s @[Adder_N.scala 28:16]
    node _T_4 = bits(io.A, 2, 2) @[Adder_N.scala 24:28]
    Full_Adder_2.io.in_a <= _T_4 @[Adder_N.scala 24:21]
    node _T_5 = bits(io.B, 2, 2) @[Adder_N.scala 25:28]
    Full_Adder_2.io.in_b <= _T_5 @[Adder_N.scala 25:21]
    Full_Adder_2.io.in_c <= carry[2] @[Adder_N.scala 26:21]
    carry[3] <= Full_Adder_2.io.out_c @[Adder_N.scala 27:20]
    sum[2] <= Full_Adder_2.io.out_s @[Adder_N.scala 28:16]
    node _T_6 = bits(io.A, 3, 3) @[Adder_N.scala 24:28]
    Full_Adder_3.io.in_a <= _T_6 @[Adder_N.scala 24:21]
    node _T_7 = bits(io.B, 3, 3) @[Adder_N.scala 25:28]
    Full_Adder_3.io.in_b <= _T_7 @[Adder_N.scala 25:21]
    Full_Adder_3.io.in_c <= carry[3] @[Adder_N.scala 26:21]
    carry[4] <= Full_Adder_3.io.out_c @[Adder_N.scala 27:20]
    sum[3] <= Full_Adder_3.io.out_s @[Adder_N.scala 28:16]
    node _T_8 = bits(io.A, 4, 4) @[Adder_N.scala 24:28]
    Full_Adder_4.io.in_a <= _T_8 @[Adder_N.scala 24:21]
    node _T_9 = bits(io.B, 4, 4) @[Adder_N.scala 25:28]
    Full_Adder_4.io.in_b <= _T_9 @[Adder_N.scala 25:21]
    Full_Adder_4.io.in_c <= carry[4] @[Adder_N.scala 26:21]
    carry[5] <= Full_Adder_4.io.out_c @[Adder_N.scala 27:20]
    sum[4] <= Full_Adder_4.io.out_s @[Adder_N.scala 28:16]
    node _T_10 = bits(io.A, 5, 5) @[Adder_N.scala 24:28]
    Full_Adder_5.io.in_a <= _T_10 @[Adder_N.scala 24:21]
    node _T_11 = bits(io.B, 5, 5) @[Adder_N.scala 25:28]
    Full_Adder_5.io.in_b <= _T_11 @[Adder_N.scala 25:21]
    Full_Adder_5.io.in_c <= carry[5] @[Adder_N.scala 26:21]
    carry[6] <= Full_Adder_5.io.out_c @[Adder_N.scala 27:20]
    sum[5] <= Full_Adder_5.io.out_s @[Adder_N.scala 28:16]
    node _T_12 = bits(io.A, 6, 6) @[Adder_N.scala 24:28]
    Full_Adder_6.io.in_a <= _T_12 @[Adder_N.scala 24:21]
    node _T_13 = bits(io.B, 6, 6) @[Adder_N.scala 25:28]
    Full_Adder_6.io.in_b <= _T_13 @[Adder_N.scala 25:21]
    Full_Adder_6.io.in_c <= carry[6] @[Adder_N.scala 26:21]
    carry[7] <= Full_Adder_6.io.out_c @[Adder_N.scala 27:20]
    sum[6] <= Full_Adder_6.io.out_s @[Adder_N.scala 28:16]
    node _T_14 = bits(io.A, 7, 7) @[Adder_N.scala 24:28]
    Full_Adder_7.io.in_a <= _T_14 @[Adder_N.scala 24:21]
    node _T_15 = bits(io.B, 7, 7) @[Adder_N.scala 25:28]
    Full_Adder_7.io.in_b <= _T_15 @[Adder_N.scala 25:21]
    Full_Adder_7.io.in_c <= carry[7] @[Adder_N.scala 26:21]
    carry[8] <= Full_Adder_7.io.out_c @[Adder_N.scala 27:20]
    sum[7] <= Full_Adder_7.io.out_s @[Adder_N.scala 28:16]
    node _T_16 = bits(io.A, 8, 8) @[Adder_N.scala 24:28]
    Full_Adder_8.io.in_a <= _T_16 @[Adder_N.scala 24:21]
    node _T_17 = bits(io.B, 8, 8) @[Adder_N.scala 25:28]
    Full_Adder_8.io.in_b <= _T_17 @[Adder_N.scala 25:21]
    Full_Adder_8.io.in_c <= carry[8] @[Adder_N.scala 26:21]
    carry[9] <= Full_Adder_8.io.out_c @[Adder_N.scala 27:20]
    sum[8] <= Full_Adder_8.io.out_s @[Adder_N.scala 28:16]
    node _T_18 = bits(io.A, 9, 9) @[Adder_N.scala 24:28]
    Full_Adder_9.io.in_a <= _T_18 @[Adder_N.scala 24:21]
    node _T_19 = bits(io.B, 9, 9) @[Adder_N.scala 25:28]
    Full_Adder_9.io.in_b <= _T_19 @[Adder_N.scala 25:21]
    Full_Adder_9.io.in_c <= carry[9] @[Adder_N.scala 26:21]
    carry[10] <= Full_Adder_9.io.out_c @[Adder_N.scala 27:20]
    sum[9] <= Full_Adder_9.io.out_s @[Adder_N.scala 28:16]
    node _T_20 = bits(io.A, 10, 10) @[Adder_N.scala 24:28]
    Full_Adder_10.io.in_a <= _T_20 @[Adder_N.scala 24:21]
    node _T_21 = bits(io.B, 10, 10) @[Adder_N.scala 25:28]
    Full_Adder_10.io.in_b <= _T_21 @[Adder_N.scala 25:21]
    Full_Adder_10.io.in_c <= carry[10] @[Adder_N.scala 26:21]
    carry[11] <= Full_Adder_10.io.out_c @[Adder_N.scala 27:20]
    sum[10] <= Full_Adder_10.io.out_s @[Adder_N.scala 28:16]
    node _T_22 = bits(io.A, 11, 11) @[Adder_N.scala 24:28]
    Full_Adder_11.io.in_a <= _T_22 @[Adder_N.scala 24:21]
    node _T_23 = bits(io.B, 11, 11) @[Adder_N.scala 25:28]
    Full_Adder_11.io.in_b <= _T_23 @[Adder_N.scala 25:21]
    Full_Adder_11.io.in_c <= carry[11] @[Adder_N.scala 26:21]
    carry[12] <= Full_Adder_11.io.out_c @[Adder_N.scala 27:20]
    sum[11] <= Full_Adder_11.io.out_s @[Adder_N.scala 28:16]
    node _T_24 = bits(io.A, 12, 12) @[Adder_N.scala 24:28]
    Full_Adder_12.io.in_a <= _T_24 @[Adder_N.scala 24:21]
    node _T_25 = bits(io.B, 12, 12) @[Adder_N.scala 25:28]
    Full_Adder_12.io.in_b <= _T_25 @[Adder_N.scala 25:21]
    Full_Adder_12.io.in_c <= carry[12] @[Adder_N.scala 26:21]
    carry[13] <= Full_Adder_12.io.out_c @[Adder_N.scala 27:20]
    sum[12] <= Full_Adder_12.io.out_s @[Adder_N.scala 28:16]
    node _T_26 = bits(io.A, 13, 13) @[Adder_N.scala 24:28]
    Full_Adder_13.io.in_a <= _T_26 @[Adder_N.scala 24:21]
    node _T_27 = bits(io.B, 13, 13) @[Adder_N.scala 25:28]
    Full_Adder_13.io.in_b <= _T_27 @[Adder_N.scala 25:21]
    Full_Adder_13.io.in_c <= carry[13] @[Adder_N.scala 26:21]
    carry[14] <= Full_Adder_13.io.out_c @[Adder_N.scala 27:20]
    sum[13] <= Full_Adder_13.io.out_s @[Adder_N.scala 28:16]
    node _T_28 = bits(io.A, 14, 14) @[Adder_N.scala 24:28]
    Full_Adder_14.io.in_a <= _T_28 @[Adder_N.scala 24:21]
    node _T_29 = bits(io.B, 14, 14) @[Adder_N.scala 25:28]
    Full_Adder_14.io.in_b <= _T_29 @[Adder_N.scala 25:21]
    Full_Adder_14.io.in_c <= carry[14] @[Adder_N.scala 26:21]
    carry[15] <= Full_Adder_14.io.out_c @[Adder_N.scala 27:20]
    sum[14] <= Full_Adder_14.io.out_s @[Adder_N.scala 28:16]
    node _T_30 = bits(io.A, 15, 15) @[Adder_N.scala 24:28]
    Full_Adder_15.io.in_a <= _T_30 @[Adder_N.scala 24:21]
    node _T_31 = bits(io.B, 15, 15) @[Adder_N.scala 25:28]
    Full_Adder_15.io.in_b <= _T_31 @[Adder_N.scala 25:21]
    Full_Adder_15.io.in_c <= carry[15] @[Adder_N.scala 26:21]
    carry[16] <= Full_Adder_15.io.out_c @[Adder_N.scala 27:20]
    sum[15] <= Full_Adder_15.io.out_s @[Adder_N.scala 28:16]
    node _T_32 = bits(io.A, 16, 16) @[Adder_N.scala 24:28]
    Full_Adder_16.io.in_a <= _T_32 @[Adder_N.scala 24:21]
    node _T_33 = bits(io.B, 16, 16) @[Adder_N.scala 25:28]
    Full_Adder_16.io.in_b <= _T_33 @[Adder_N.scala 25:21]
    Full_Adder_16.io.in_c <= carry[16] @[Adder_N.scala 26:21]
    carry[17] <= Full_Adder_16.io.out_c @[Adder_N.scala 27:20]
    sum[16] <= Full_Adder_16.io.out_s @[Adder_N.scala 28:16]
    node _T_34 = bits(io.A, 17, 17) @[Adder_N.scala 24:28]
    Full_Adder_17.io.in_a <= _T_34 @[Adder_N.scala 24:21]
    node _T_35 = bits(io.B, 17, 17) @[Adder_N.scala 25:28]
    Full_Adder_17.io.in_b <= _T_35 @[Adder_N.scala 25:21]
    Full_Adder_17.io.in_c <= carry[17] @[Adder_N.scala 26:21]
    carry[18] <= Full_Adder_17.io.out_c @[Adder_N.scala 27:20]
    sum[17] <= Full_Adder_17.io.out_s @[Adder_N.scala 28:16]
    node _T_36 = bits(io.A, 18, 18) @[Adder_N.scala 24:28]
    Full_Adder_18.io.in_a <= _T_36 @[Adder_N.scala 24:21]
    node _T_37 = bits(io.B, 18, 18) @[Adder_N.scala 25:28]
    Full_Adder_18.io.in_b <= _T_37 @[Adder_N.scala 25:21]
    Full_Adder_18.io.in_c <= carry[18] @[Adder_N.scala 26:21]
    carry[19] <= Full_Adder_18.io.out_c @[Adder_N.scala 27:20]
    sum[18] <= Full_Adder_18.io.out_s @[Adder_N.scala 28:16]
    node _T_38 = bits(io.A, 19, 19) @[Adder_N.scala 24:28]
    Full_Adder_19.io.in_a <= _T_38 @[Adder_N.scala 24:21]
    node _T_39 = bits(io.B, 19, 19) @[Adder_N.scala 25:28]
    Full_Adder_19.io.in_b <= _T_39 @[Adder_N.scala 25:21]
    Full_Adder_19.io.in_c <= carry[19] @[Adder_N.scala 26:21]
    carry[20] <= Full_Adder_19.io.out_c @[Adder_N.scala 27:20]
    sum[19] <= Full_Adder_19.io.out_s @[Adder_N.scala 28:16]
    node _T_40 = bits(io.A, 20, 20) @[Adder_N.scala 24:28]
    Full_Adder_20.io.in_a <= _T_40 @[Adder_N.scala 24:21]
    node _T_41 = bits(io.B, 20, 20) @[Adder_N.scala 25:28]
    Full_Adder_20.io.in_b <= _T_41 @[Adder_N.scala 25:21]
    Full_Adder_20.io.in_c <= carry[20] @[Adder_N.scala 26:21]
    carry[21] <= Full_Adder_20.io.out_c @[Adder_N.scala 27:20]
    sum[20] <= Full_Adder_20.io.out_s @[Adder_N.scala 28:16]
    node _T_42 = bits(io.A, 21, 21) @[Adder_N.scala 24:28]
    Full_Adder_21.io.in_a <= _T_42 @[Adder_N.scala 24:21]
    node _T_43 = bits(io.B, 21, 21) @[Adder_N.scala 25:28]
    Full_Adder_21.io.in_b <= _T_43 @[Adder_N.scala 25:21]
    Full_Adder_21.io.in_c <= carry[21] @[Adder_N.scala 26:21]
    carry[22] <= Full_Adder_21.io.out_c @[Adder_N.scala 27:20]
    sum[21] <= Full_Adder_21.io.out_s @[Adder_N.scala 28:16]
    node _T_44 = bits(io.A, 22, 22) @[Adder_N.scala 24:28]
    Full_Adder_22.io.in_a <= _T_44 @[Adder_N.scala 24:21]
    node _T_45 = bits(io.B, 22, 22) @[Adder_N.scala 25:28]
    Full_Adder_22.io.in_b <= _T_45 @[Adder_N.scala 25:21]
    Full_Adder_22.io.in_c <= carry[22] @[Adder_N.scala 26:21]
    carry[23] <= Full_Adder_22.io.out_c @[Adder_N.scala 27:20]
    sum[22] <= Full_Adder_22.io.out_s @[Adder_N.scala 28:16]
    node _T_46 = bits(io.A, 23, 23) @[Adder_N.scala 24:28]
    Full_Adder_23.io.in_a <= _T_46 @[Adder_N.scala 24:21]
    node _T_47 = bits(io.B, 23, 23) @[Adder_N.scala 25:28]
    Full_Adder_23.io.in_b <= _T_47 @[Adder_N.scala 25:21]
    Full_Adder_23.io.in_c <= carry[23] @[Adder_N.scala 26:21]
    carry[24] <= Full_Adder_23.io.out_c @[Adder_N.scala 27:20]
    sum[23] <= Full_Adder_23.io.out_s @[Adder_N.scala 28:16]
    node _T_48 = bits(io.A, 24, 24) @[Adder_N.scala 24:28]
    Full_Adder_24.io.in_a <= _T_48 @[Adder_N.scala 24:21]
    node _T_49 = bits(io.B, 24, 24) @[Adder_N.scala 25:28]
    Full_Adder_24.io.in_b <= _T_49 @[Adder_N.scala 25:21]
    Full_Adder_24.io.in_c <= carry[24] @[Adder_N.scala 26:21]
    carry[25] <= Full_Adder_24.io.out_c @[Adder_N.scala 27:20]
    sum[24] <= Full_Adder_24.io.out_s @[Adder_N.scala 28:16]
    node _T_50 = bits(io.A, 25, 25) @[Adder_N.scala 24:28]
    Full_Adder_25.io.in_a <= _T_50 @[Adder_N.scala 24:21]
    node _T_51 = bits(io.B, 25, 25) @[Adder_N.scala 25:28]
    Full_Adder_25.io.in_b <= _T_51 @[Adder_N.scala 25:21]
    Full_Adder_25.io.in_c <= carry[25] @[Adder_N.scala 26:21]
    carry[26] <= Full_Adder_25.io.out_c @[Adder_N.scala 27:20]
    sum[25] <= Full_Adder_25.io.out_s @[Adder_N.scala 28:16]
    node _T_52 = bits(io.A, 26, 26) @[Adder_N.scala 24:28]
    Full_Adder_26.io.in_a <= _T_52 @[Adder_N.scala 24:21]
    node _T_53 = bits(io.B, 26, 26) @[Adder_N.scala 25:28]
    Full_Adder_26.io.in_b <= _T_53 @[Adder_N.scala 25:21]
    Full_Adder_26.io.in_c <= carry[26] @[Adder_N.scala 26:21]
    carry[27] <= Full_Adder_26.io.out_c @[Adder_N.scala 27:20]
    sum[26] <= Full_Adder_26.io.out_s @[Adder_N.scala 28:16]
    node _T_54 = bits(io.A, 27, 27) @[Adder_N.scala 24:28]
    Full_Adder_27.io.in_a <= _T_54 @[Adder_N.scala 24:21]
    node _T_55 = bits(io.B, 27, 27) @[Adder_N.scala 25:28]
    Full_Adder_27.io.in_b <= _T_55 @[Adder_N.scala 25:21]
    Full_Adder_27.io.in_c <= carry[27] @[Adder_N.scala 26:21]
    carry[28] <= Full_Adder_27.io.out_c @[Adder_N.scala 27:20]
    sum[27] <= Full_Adder_27.io.out_s @[Adder_N.scala 28:16]
    node _T_56 = bits(io.A, 28, 28) @[Adder_N.scala 24:28]
    Full_Adder_28.io.in_a <= _T_56 @[Adder_N.scala 24:21]
    node _T_57 = bits(io.B, 28, 28) @[Adder_N.scala 25:28]
    Full_Adder_28.io.in_b <= _T_57 @[Adder_N.scala 25:21]
    Full_Adder_28.io.in_c <= carry[28] @[Adder_N.scala 26:21]
    carry[29] <= Full_Adder_28.io.out_c @[Adder_N.scala 27:20]
    sum[28] <= Full_Adder_28.io.out_s @[Adder_N.scala 28:16]
    node _T_58 = bits(io.A, 29, 29) @[Adder_N.scala 24:28]
    Full_Adder_29.io.in_a <= _T_58 @[Adder_N.scala 24:21]
    node _T_59 = bits(io.B, 29, 29) @[Adder_N.scala 25:28]
    Full_Adder_29.io.in_b <= _T_59 @[Adder_N.scala 25:21]
    Full_Adder_29.io.in_c <= carry[29] @[Adder_N.scala 26:21]
    carry[30] <= Full_Adder_29.io.out_c @[Adder_N.scala 27:20]
    sum[29] <= Full_Adder_29.io.out_s @[Adder_N.scala 28:16]
    node _T_60 = bits(io.A, 30, 30) @[Adder_N.scala 24:28]
    Full_Adder_30.io.in_a <= _T_60 @[Adder_N.scala 24:21]
    node _T_61 = bits(io.B, 30, 30) @[Adder_N.scala 25:28]
    Full_Adder_30.io.in_b <= _T_61 @[Adder_N.scala 25:21]
    Full_Adder_30.io.in_c <= carry[30] @[Adder_N.scala 26:21]
    carry[31] <= Full_Adder_30.io.out_c @[Adder_N.scala 27:20]
    sum[30] <= Full_Adder_30.io.out_s @[Adder_N.scala 28:16]
    node _T_62 = bits(io.A, 31, 31) @[Adder_N.scala 24:28]
    Full_Adder_31.io.in_a <= _T_62 @[Adder_N.scala 24:21]
    node _T_63 = bits(io.B, 31, 31) @[Adder_N.scala 25:28]
    Full_Adder_31.io.in_b <= _T_63 @[Adder_N.scala 25:21]
    Full_Adder_31.io.in_c <= carry[31] @[Adder_N.scala 26:21]
    carry[32] <= Full_Adder_31.io.out_c @[Adder_N.scala 27:20]
    sum[31] <= Full_Adder_31.io.out_s @[Adder_N.scala 28:16]
    node io_Sum_lo_lo_lo_lo = cat(sum[1], sum[0]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_lo_hi = cat(sum[3], sum[2]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_lo = cat(io_Sum_lo_lo_lo_hi, io_Sum_lo_lo_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi_lo = cat(sum[5], sum[4]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi_hi = cat(sum[7], sum[6]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi = cat(io_Sum_lo_lo_hi_hi, io_Sum_lo_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo = cat(io_Sum_lo_lo_hi, io_Sum_lo_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo_lo = cat(sum[9], sum[8]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo_hi = cat(sum[11], sum[10]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo = cat(io_Sum_lo_hi_lo_hi, io_Sum_lo_hi_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi_lo = cat(sum[13], sum[12]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi_hi = cat(sum[15], sum[14]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi = cat(io_Sum_lo_hi_hi_hi, io_Sum_lo_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi = cat(io_Sum_lo_hi_hi, io_Sum_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo = cat(io_Sum_lo_hi, io_Sum_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo_lo = cat(sum[17], sum[16]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo_hi = cat(sum[19], sum[18]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo = cat(io_Sum_hi_lo_lo_hi, io_Sum_hi_lo_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi_lo = cat(sum[21], sum[20]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi_hi = cat(sum[23], sum[22]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi = cat(io_Sum_hi_lo_hi_hi, io_Sum_hi_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo = cat(io_Sum_hi_lo_hi, io_Sum_hi_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo_lo = cat(sum[25], sum[24]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo_hi = cat(sum[27], sum[26]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo = cat(io_Sum_hi_hi_lo_hi, io_Sum_hi_hi_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi_lo = cat(sum[29], sum[28]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi_hi = cat(sum[31], sum[30]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi = cat(io_Sum_hi_hi_hi_hi, io_Sum_hi_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi = cat(io_Sum_hi_hi_hi, io_Sum_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi = cat(io_Sum_hi_hi, io_Sum_hi_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T_1 = asSInt(_io_Sum_T) @[Adder_N.scala 31:26]
    io.Sum <= _io_Sum_T_1 @[Adder_N.scala 31:12]
    io.Cout <= carry[32] @[Adder_N.scala 32:13]

  module Full_Adder_32 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_33 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_34 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_35 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_36 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_37 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_38 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_39 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_40 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_41 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_42 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_43 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_44 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_45 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_46 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_47 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_48 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_49 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_50 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_51 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_52 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_53 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_54 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_55 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_56 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_57 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_58 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_59 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_60 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_61 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_62 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Full_Adder_63 :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<1>, flip in_b : UInt<1>, flip in_c : UInt<1>, out_s : UInt<1>, out_c : UInt<1>}

    node a_xor_b = xor(io.in_a, io.in_b) @[FA.scala 15:27]
    node a_and_b = and(io.in_a, io.in_b) @[FA.scala 16:27]
    node _io_out_s_T = xor(io.in_c, a_xor_b) @[FA.scala 17:25]
    io.out_s <= _io_out_s_T @[FA.scala 17:14]
    node c_and_axorb = and(io.in_c, a_xor_b) @[FA.scala 19:31]
    node _io_out_c_T = or(c_and_axorb, a_and_b) @[FA.scala 21:29]
    io.out_c <= _io_out_c_T @[FA.scala 21:14]

  module Adder_N_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip A : SInt<32>, flip B : SInt<32>, flip Cin : UInt<1>, Sum : SInt<32>, Cout : UInt<1>}

    inst Full_Adder of Full_Adder_32 @[Adder_N.scala 15:35]
    Full_Adder.clock <= clock
    Full_Adder.reset <= reset
    inst Full_Adder_1 of Full_Adder_33 @[Adder_N.scala 15:35]
    Full_Adder_1.clock <= clock
    Full_Adder_1.reset <= reset
    inst Full_Adder_2 of Full_Adder_34 @[Adder_N.scala 15:35]
    Full_Adder_2.clock <= clock
    Full_Adder_2.reset <= reset
    inst Full_Adder_3 of Full_Adder_35 @[Adder_N.scala 15:35]
    Full_Adder_3.clock <= clock
    Full_Adder_3.reset <= reset
    inst Full_Adder_4 of Full_Adder_36 @[Adder_N.scala 15:35]
    Full_Adder_4.clock <= clock
    Full_Adder_4.reset <= reset
    inst Full_Adder_5 of Full_Adder_37 @[Adder_N.scala 15:35]
    Full_Adder_5.clock <= clock
    Full_Adder_5.reset <= reset
    inst Full_Adder_6 of Full_Adder_38 @[Adder_N.scala 15:35]
    Full_Adder_6.clock <= clock
    Full_Adder_6.reset <= reset
    inst Full_Adder_7 of Full_Adder_39 @[Adder_N.scala 15:35]
    Full_Adder_7.clock <= clock
    Full_Adder_7.reset <= reset
    inst Full_Adder_8 of Full_Adder_40 @[Adder_N.scala 15:35]
    Full_Adder_8.clock <= clock
    Full_Adder_8.reset <= reset
    inst Full_Adder_9 of Full_Adder_41 @[Adder_N.scala 15:35]
    Full_Adder_9.clock <= clock
    Full_Adder_9.reset <= reset
    inst Full_Adder_10 of Full_Adder_42 @[Adder_N.scala 15:35]
    Full_Adder_10.clock <= clock
    Full_Adder_10.reset <= reset
    inst Full_Adder_11 of Full_Adder_43 @[Adder_N.scala 15:35]
    Full_Adder_11.clock <= clock
    Full_Adder_11.reset <= reset
    inst Full_Adder_12 of Full_Adder_44 @[Adder_N.scala 15:35]
    Full_Adder_12.clock <= clock
    Full_Adder_12.reset <= reset
    inst Full_Adder_13 of Full_Adder_45 @[Adder_N.scala 15:35]
    Full_Adder_13.clock <= clock
    Full_Adder_13.reset <= reset
    inst Full_Adder_14 of Full_Adder_46 @[Adder_N.scala 15:35]
    Full_Adder_14.clock <= clock
    Full_Adder_14.reset <= reset
    inst Full_Adder_15 of Full_Adder_47 @[Adder_N.scala 15:35]
    Full_Adder_15.clock <= clock
    Full_Adder_15.reset <= reset
    inst Full_Adder_16 of Full_Adder_48 @[Adder_N.scala 15:35]
    Full_Adder_16.clock <= clock
    Full_Adder_16.reset <= reset
    inst Full_Adder_17 of Full_Adder_49 @[Adder_N.scala 15:35]
    Full_Adder_17.clock <= clock
    Full_Adder_17.reset <= reset
    inst Full_Adder_18 of Full_Adder_50 @[Adder_N.scala 15:35]
    Full_Adder_18.clock <= clock
    Full_Adder_18.reset <= reset
    inst Full_Adder_19 of Full_Adder_51 @[Adder_N.scala 15:35]
    Full_Adder_19.clock <= clock
    Full_Adder_19.reset <= reset
    inst Full_Adder_20 of Full_Adder_52 @[Adder_N.scala 15:35]
    Full_Adder_20.clock <= clock
    Full_Adder_20.reset <= reset
    inst Full_Adder_21 of Full_Adder_53 @[Adder_N.scala 15:35]
    Full_Adder_21.clock <= clock
    Full_Adder_21.reset <= reset
    inst Full_Adder_22 of Full_Adder_54 @[Adder_N.scala 15:35]
    Full_Adder_22.clock <= clock
    Full_Adder_22.reset <= reset
    inst Full_Adder_23 of Full_Adder_55 @[Adder_N.scala 15:35]
    Full_Adder_23.clock <= clock
    Full_Adder_23.reset <= reset
    inst Full_Adder_24 of Full_Adder_56 @[Adder_N.scala 15:35]
    Full_Adder_24.clock <= clock
    Full_Adder_24.reset <= reset
    inst Full_Adder_25 of Full_Adder_57 @[Adder_N.scala 15:35]
    Full_Adder_25.clock <= clock
    Full_Adder_25.reset <= reset
    inst Full_Adder_26 of Full_Adder_58 @[Adder_N.scala 15:35]
    Full_Adder_26.clock <= clock
    Full_Adder_26.reset <= reset
    inst Full_Adder_27 of Full_Adder_59 @[Adder_N.scala 15:35]
    Full_Adder_27.clock <= clock
    Full_Adder_27.reset <= reset
    inst Full_Adder_28 of Full_Adder_60 @[Adder_N.scala 15:35]
    Full_Adder_28.clock <= clock
    Full_Adder_28.reset <= reset
    inst Full_Adder_29 of Full_Adder_61 @[Adder_N.scala 15:35]
    Full_Adder_29.clock <= clock
    Full_Adder_29.reset <= reset
    inst Full_Adder_30 of Full_Adder_62 @[Adder_N.scala 15:35]
    Full_Adder_30.clock <= clock
    Full_Adder_30.reset <= reset
    inst Full_Adder_31 of Full_Adder_63 @[Adder_N.scala 15:35]
    Full_Adder_31.clock <= clock
    Full_Adder_31.reset <= reset
    wire carry : UInt<1>[33] @[Adder_N.scala 17:21]
    wire sum : UInt<1>[32] @[Adder_N.scala 18:19]
    carry[0] <= io.Cin @[Adder_N.scala 21:14]
    node _T = bits(io.A, 0, 0) @[Adder_N.scala 24:28]
    Full_Adder.io.in_a <= _T @[Adder_N.scala 24:21]
    node _T_1 = bits(io.B, 0, 0) @[Adder_N.scala 25:28]
    Full_Adder.io.in_b <= _T_1 @[Adder_N.scala 25:21]
    Full_Adder.io.in_c <= carry[0] @[Adder_N.scala 26:21]
    carry[1] <= Full_Adder.io.out_c @[Adder_N.scala 27:20]
    sum[0] <= Full_Adder.io.out_s @[Adder_N.scala 28:16]
    node _T_2 = bits(io.A, 1, 1) @[Adder_N.scala 24:28]
    Full_Adder_1.io.in_a <= _T_2 @[Adder_N.scala 24:21]
    node _T_3 = bits(io.B, 1, 1) @[Adder_N.scala 25:28]
    Full_Adder_1.io.in_b <= _T_3 @[Adder_N.scala 25:21]
    Full_Adder_1.io.in_c <= carry[1] @[Adder_N.scala 26:21]
    carry[2] <= Full_Adder_1.io.out_c @[Adder_N.scala 27:20]
    sum[1] <= Full_Adder_1.io.out_s @[Adder_N.scala 28:16]
    node _T_4 = bits(io.A, 2, 2) @[Adder_N.scala 24:28]
    Full_Adder_2.io.in_a <= _T_4 @[Adder_N.scala 24:21]
    node _T_5 = bits(io.B, 2, 2) @[Adder_N.scala 25:28]
    Full_Adder_2.io.in_b <= _T_5 @[Adder_N.scala 25:21]
    Full_Adder_2.io.in_c <= carry[2] @[Adder_N.scala 26:21]
    carry[3] <= Full_Adder_2.io.out_c @[Adder_N.scala 27:20]
    sum[2] <= Full_Adder_2.io.out_s @[Adder_N.scala 28:16]
    node _T_6 = bits(io.A, 3, 3) @[Adder_N.scala 24:28]
    Full_Adder_3.io.in_a <= _T_6 @[Adder_N.scala 24:21]
    node _T_7 = bits(io.B, 3, 3) @[Adder_N.scala 25:28]
    Full_Adder_3.io.in_b <= _T_7 @[Adder_N.scala 25:21]
    Full_Adder_3.io.in_c <= carry[3] @[Adder_N.scala 26:21]
    carry[4] <= Full_Adder_3.io.out_c @[Adder_N.scala 27:20]
    sum[3] <= Full_Adder_3.io.out_s @[Adder_N.scala 28:16]
    node _T_8 = bits(io.A, 4, 4) @[Adder_N.scala 24:28]
    Full_Adder_4.io.in_a <= _T_8 @[Adder_N.scala 24:21]
    node _T_9 = bits(io.B, 4, 4) @[Adder_N.scala 25:28]
    Full_Adder_4.io.in_b <= _T_9 @[Adder_N.scala 25:21]
    Full_Adder_4.io.in_c <= carry[4] @[Adder_N.scala 26:21]
    carry[5] <= Full_Adder_4.io.out_c @[Adder_N.scala 27:20]
    sum[4] <= Full_Adder_4.io.out_s @[Adder_N.scala 28:16]
    node _T_10 = bits(io.A, 5, 5) @[Adder_N.scala 24:28]
    Full_Adder_5.io.in_a <= _T_10 @[Adder_N.scala 24:21]
    node _T_11 = bits(io.B, 5, 5) @[Adder_N.scala 25:28]
    Full_Adder_5.io.in_b <= _T_11 @[Adder_N.scala 25:21]
    Full_Adder_5.io.in_c <= carry[5] @[Adder_N.scala 26:21]
    carry[6] <= Full_Adder_5.io.out_c @[Adder_N.scala 27:20]
    sum[5] <= Full_Adder_5.io.out_s @[Adder_N.scala 28:16]
    node _T_12 = bits(io.A, 6, 6) @[Adder_N.scala 24:28]
    Full_Adder_6.io.in_a <= _T_12 @[Adder_N.scala 24:21]
    node _T_13 = bits(io.B, 6, 6) @[Adder_N.scala 25:28]
    Full_Adder_6.io.in_b <= _T_13 @[Adder_N.scala 25:21]
    Full_Adder_6.io.in_c <= carry[6] @[Adder_N.scala 26:21]
    carry[7] <= Full_Adder_6.io.out_c @[Adder_N.scala 27:20]
    sum[6] <= Full_Adder_6.io.out_s @[Adder_N.scala 28:16]
    node _T_14 = bits(io.A, 7, 7) @[Adder_N.scala 24:28]
    Full_Adder_7.io.in_a <= _T_14 @[Adder_N.scala 24:21]
    node _T_15 = bits(io.B, 7, 7) @[Adder_N.scala 25:28]
    Full_Adder_7.io.in_b <= _T_15 @[Adder_N.scala 25:21]
    Full_Adder_7.io.in_c <= carry[7] @[Adder_N.scala 26:21]
    carry[8] <= Full_Adder_7.io.out_c @[Adder_N.scala 27:20]
    sum[7] <= Full_Adder_7.io.out_s @[Adder_N.scala 28:16]
    node _T_16 = bits(io.A, 8, 8) @[Adder_N.scala 24:28]
    Full_Adder_8.io.in_a <= _T_16 @[Adder_N.scala 24:21]
    node _T_17 = bits(io.B, 8, 8) @[Adder_N.scala 25:28]
    Full_Adder_8.io.in_b <= _T_17 @[Adder_N.scala 25:21]
    Full_Adder_8.io.in_c <= carry[8] @[Adder_N.scala 26:21]
    carry[9] <= Full_Adder_8.io.out_c @[Adder_N.scala 27:20]
    sum[8] <= Full_Adder_8.io.out_s @[Adder_N.scala 28:16]
    node _T_18 = bits(io.A, 9, 9) @[Adder_N.scala 24:28]
    Full_Adder_9.io.in_a <= _T_18 @[Adder_N.scala 24:21]
    node _T_19 = bits(io.B, 9, 9) @[Adder_N.scala 25:28]
    Full_Adder_9.io.in_b <= _T_19 @[Adder_N.scala 25:21]
    Full_Adder_9.io.in_c <= carry[9] @[Adder_N.scala 26:21]
    carry[10] <= Full_Adder_9.io.out_c @[Adder_N.scala 27:20]
    sum[9] <= Full_Adder_9.io.out_s @[Adder_N.scala 28:16]
    node _T_20 = bits(io.A, 10, 10) @[Adder_N.scala 24:28]
    Full_Adder_10.io.in_a <= _T_20 @[Adder_N.scala 24:21]
    node _T_21 = bits(io.B, 10, 10) @[Adder_N.scala 25:28]
    Full_Adder_10.io.in_b <= _T_21 @[Adder_N.scala 25:21]
    Full_Adder_10.io.in_c <= carry[10] @[Adder_N.scala 26:21]
    carry[11] <= Full_Adder_10.io.out_c @[Adder_N.scala 27:20]
    sum[10] <= Full_Adder_10.io.out_s @[Adder_N.scala 28:16]
    node _T_22 = bits(io.A, 11, 11) @[Adder_N.scala 24:28]
    Full_Adder_11.io.in_a <= _T_22 @[Adder_N.scala 24:21]
    node _T_23 = bits(io.B, 11, 11) @[Adder_N.scala 25:28]
    Full_Adder_11.io.in_b <= _T_23 @[Adder_N.scala 25:21]
    Full_Adder_11.io.in_c <= carry[11] @[Adder_N.scala 26:21]
    carry[12] <= Full_Adder_11.io.out_c @[Adder_N.scala 27:20]
    sum[11] <= Full_Adder_11.io.out_s @[Adder_N.scala 28:16]
    node _T_24 = bits(io.A, 12, 12) @[Adder_N.scala 24:28]
    Full_Adder_12.io.in_a <= _T_24 @[Adder_N.scala 24:21]
    node _T_25 = bits(io.B, 12, 12) @[Adder_N.scala 25:28]
    Full_Adder_12.io.in_b <= _T_25 @[Adder_N.scala 25:21]
    Full_Adder_12.io.in_c <= carry[12] @[Adder_N.scala 26:21]
    carry[13] <= Full_Adder_12.io.out_c @[Adder_N.scala 27:20]
    sum[12] <= Full_Adder_12.io.out_s @[Adder_N.scala 28:16]
    node _T_26 = bits(io.A, 13, 13) @[Adder_N.scala 24:28]
    Full_Adder_13.io.in_a <= _T_26 @[Adder_N.scala 24:21]
    node _T_27 = bits(io.B, 13, 13) @[Adder_N.scala 25:28]
    Full_Adder_13.io.in_b <= _T_27 @[Adder_N.scala 25:21]
    Full_Adder_13.io.in_c <= carry[13] @[Adder_N.scala 26:21]
    carry[14] <= Full_Adder_13.io.out_c @[Adder_N.scala 27:20]
    sum[13] <= Full_Adder_13.io.out_s @[Adder_N.scala 28:16]
    node _T_28 = bits(io.A, 14, 14) @[Adder_N.scala 24:28]
    Full_Adder_14.io.in_a <= _T_28 @[Adder_N.scala 24:21]
    node _T_29 = bits(io.B, 14, 14) @[Adder_N.scala 25:28]
    Full_Adder_14.io.in_b <= _T_29 @[Adder_N.scala 25:21]
    Full_Adder_14.io.in_c <= carry[14] @[Adder_N.scala 26:21]
    carry[15] <= Full_Adder_14.io.out_c @[Adder_N.scala 27:20]
    sum[14] <= Full_Adder_14.io.out_s @[Adder_N.scala 28:16]
    node _T_30 = bits(io.A, 15, 15) @[Adder_N.scala 24:28]
    Full_Adder_15.io.in_a <= _T_30 @[Adder_N.scala 24:21]
    node _T_31 = bits(io.B, 15, 15) @[Adder_N.scala 25:28]
    Full_Adder_15.io.in_b <= _T_31 @[Adder_N.scala 25:21]
    Full_Adder_15.io.in_c <= carry[15] @[Adder_N.scala 26:21]
    carry[16] <= Full_Adder_15.io.out_c @[Adder_N.scala 27:20]
    sum[15] <= Full_Adder_15.io.out_s @[Adder_N.scala 28:16]
    node _T_32 = bits(io.A, 16, 16) @[Adder_N.scala 24:28]
    Full_Adder_16.io.in_a <= _T_32 @[Adder_N.scala 24:21]
    node _T_33 = bits(io.B, 16, 16) @[Adder_N.scala 25:28]
    Full_Adder_16.io.in_b <= _T_33 @[Adder_N.scala 25:21]
    Full_Adder_16.io.in_c <= carry[16] @[Adder_N.scala 26:21]
    carry[17] <= Full_Adder_16.io.out_c @[Adder_N.scala 27:20]
    sum[16] <= Full_Adder_16.io.out_s @[Adder_N.scala 28:16]
    node _T_34 = bits(io.A, 17, 17) @[Adder_N.scala 24:28]
    Full_Adder_17.io.in_a <= _T_34 @[Adder_N.scala 24:21]
    node _T_35 = bits(io.B, 17, 17) @[Adder_N.scala 25:28]
    Full_Adder_17.io.in_b <= _T_35 @[Adder_N.scala 25:21]
    Full_Adder_17.io.in_c <= carry[17] @[Adder_N.scala 26:21]
    carry[18] <= Full_Adder_17.io.out_c @[Adder_N.scala 27:20]
    sum[17] <= Full_Adder_17.io.out_s @[Adder_N.scala 28:16]
    node _T_36 = bits(io.A, 18, 18) @[Adder_N.scala 24:28]
    Full_Adder_18.io.in_a <= _T_36 @[Adder_N.scala 24:21]
    node _T_37 = bits(io.B, 18, 18) @[Adder_N.scala 25:28]
    Full_Adder_18.io.in_b <= _T_37 @[Adder_N.scala 25:21]
    Full_Adder_18.io.in_c <= carry[18] @[Adder_N.scala 26:21]
    carry[19] <= Full_Adder_18.io.out_c @[Adder_N.scala 27:20]
    sum[18] <= Full_Adder_18.io.out_s @[Adder_N.scala 28:16]
    node _T_38 = bits(io.A, 19, 19) @[Adder_N.scala 24:28]
    Full_Adder_19.io.in_a <= _T_38 @[Adder_N.scala 24:21]
    node _T_39 = bits(io.B, 19, 19) @[Adder_N.scala 25:28]
    Full_Adder_19.io.in_b <= _T_39 @[Adder_N.scala 25:21]
    Full_Adder_19.io.in_c <= carry[19] @[Adder_N.scala 26:21]
    carry[20] <= Full_Adder_19.io.out_c @[Adder_N.scala 27:20]
    sum[19] <= Full_Adder_19.io.out_s @[Adder_N.scala 28:16]
    node _T_40 = bits(io.A, 20, 20) @[Adder_N.scala 24:28]
    Full_Adder_20.io.in_a <= _T_40 @[Adder_N.scala 24:21]
    node _T_41 = bits(io.B, 20, 20) @[Adder_N.scala 25:28]
    Full_Adder_20.io.in_b <= _T_41 @[Adder_N.scala 25:21]
    Full_Adder_20.io.in_c <= carry[20] @[Adder_N.scala 26:21]
    carry[21] <= Full_Adder_20.io.out_c @[Adder_N.scala 27:20]
    sum[20] <= Full_Adder_20.io.out_s @[Adder_N.scala 28:16]
    node _T_42 = bits(io.A, 21, 21) @[Adder_N.scala 24:28]
    Full_Adder_21.io.in_a <= _T_42 @[Adder_N.scala 24:21]
    node _T_43 = bits(io.B, 21, 21) @[Adder_N.scala 25:28]
    Full_Adder_21.io.in_b <= _T_43 @[Adder_N.scala 25:21]
    Full_Adder_21.io.in_c <= carry[21] @[Adder_N.scala 26:21]
    carry[22] <= Full_Adder_21.io.out_c @[Adder_N.scala 27:20]
    sum[21] <= Full_Adder_21.io.out_s @[Adder_N.scala 28:16]
    node _T_44 = bits(io.A, 22, 22) @[Adder_N.scala 24:28]
    Full_Adder_22.io.in_a <= _T_44 @[Adder_N.scala 24:21]
    node _T_45 = bits(io.B, 22, 22) @[Adder_N.scala 25:28]
    Full_Adder_22.io.in_b <= _T_45 @[Adder_N.scala 25:21]
    Full_Adder_22.io.in_c <= carry[22] @[Adder_N.scala 26:21]
    carry[23] <= Full_Adder_22.io.out_c @[Adder_N.scala 27:20]
    sum[22] <= Full_Adder_22.io.out_s @[Adder_N.scala 28:16]
    node _T_46 = bits(io.A, 23, 23) @[Adder_N.scala 24:28]
    Full_Adder_23.io.in_a <= _T_46 @[Adder_N.scala 24:21]
    node _T_47 = bits(io.B, 23, 23) @[Adder_N.scala 25:28]
    Full_Adder_23.io.in_b <= _T_47 @[Adder_N.scala 25:21]
    Full_Adder_23.io.in_c <= carry[23] @[Adder_N.scala 26:21]
    carry[24] <= Full_Adder_23.io.out_c @[Adder_N.scala 27:20]
    sum[23] <= Full_Adder_23.io.out_s @[Adder_N.scala 28:16]
    node _T_48 = bits(io.A, 24, 24) @[Adder_N.scala 24:28]
    Full_Adder_24.io.in_a <= _T_48 @[Adder_N.scala 24:21]
    node _T_49 = bits(io.B, 24, 24) @[Adder_N.scala 25:28]
    Full_Adder_24.io.in_b <= _T_49 @[Adder_N.scala 25:21]
    Full_Adder_24.io.in_c <= carry[24] @[Adder_N.scala 26:21]
    carry[25] <= Full_Adder_24.io.out_c @[Adder_N.scala 27:20]
    sum[24] <= Full_Adder_24.io.out_s @[Adder_N.scala 28:16]
    node _T_50 = bits(io.A, 25, 25) @[Adder_N.scala 24:28]
    Full_Adder_25.io.in_a <= _T_50 @[Adder_N.scala 24:21]
    node _T_51 = bits(io.B, 25, 25) @[Adder_N.scala 25:28]
    Full_Adder_25.io.in_b <= _T_51 @[Adder_N.scala 25:21]
    Full_Adder_25.io.in_c <= carry[25] @[Adder_N.scala 26:21]
    carry[26] <= Full_Adder_25.io.out_c @[Adder_N.scala 27:20]
    sum[25] <= Full_Adder_25.io.out_s @[Adder_N.scala 28:16]
    node _T_52 = bits(io.A, 26, 26) @[Adder_N.scala 24:28]
    Full_Adder_26.io.in_a <= _T_52 @[Adder_N.scala 24:21]
    node _T_53 = bits(io.B, 26, 26) @[Adder_N.scala 25:28]
    Full_Adder_26.io.in_b <= _T_53 @[Adder_N.scala 25:21]
    Full_Adder_26.io.in_c <= carry[26] @[Adder_N.scala 26:21]
    carry[27] <= Full_Adder_26.io.out_c @[Adder_N.scala 27:20]
    sum[26] <= Full_Adder_26.io.out_s @[Adder_N.scala 28:16]
    node _T_54 = bits(io.A, 27, 27) @[Adder_N.scala 24:28]
    Full_Adder_27.io.in_a <= _T_54 @[Adder_N.scala 24:21]
    node _T_55 = bits(io.B, 27, 27) @[Adder_N.scala 25:28]
    Full_Adder_27.io.in_b <= _T_55 @[Adder_N.scala 25:21]
    Full_Adder_27.io.in_c <= carry[27] @[Adder_N.scala 26:21]
    carry[28] <= Full_Adder_27.io.out_c @[Adder_N.scala 27:20]
    sum[27] <= Full_Adder_27.io.out_s @[Adder_N.scala 28:16]
    node _T_56 = bits(io.A, 28, 28) @[Adder_N.scala 24:28]
    Full_Adder_28.io.in_a <= _T_56 @[Adder_N.scala 24:21]
    node _T_57 = bits(io.B, 28, 28) @[Adder_N.scala 25:28]
    Full_Adder_28.io.in_b <= _T_57 @[Adder_N.scala 25:21]
    Full_Adder_28.io.in_c <= carry[28] @[Adder_N.scala 26:21]
    carry[29] <= Full_Adder_28.io.out_c @[Adder_N.scala 27:20]
    sum[28] <= Full_Adder_28.io.out_s @[Adder_N.scala 28:16]
    node _T_58 = bits(io.A, 29, 29) @[Adder_N.scala 24:28]
    Full_Adder_29.io.in_a <= _T_58 @[Adder_N.scala 24:21]
    node _T_59 = bits(io.B, 29, 29) @[Adder_N.scala 25:28]
    Full_Adder_29.io.in_b <= _T_59 @[Adder_N.scala 25:21]
    Full_Adder_29.io.in_c <= carry[29] @[Adder_N.scala 26:21]
    carry[30] <= Full_Adder_29.io.out_c @[Adder_N.scala 27:20]
    sum[29] <= Full_Adder_29.io.out_s @[Adder_N.scala 28:16]
    node _T_60 = bits(io.A, 30, 30) @[Adder_N.scala 24:28]
    Full_Adder_30.io.in_a <= _T_60 @[Adder_N.scala 24:21]
    node _T_61 = bits(io.B, 30, 30) @[Adder_N.scala 25:28]
    Full_Adder_30.io.in_b <= _T_61 @[Adder_N.scala 25:21]
    Full_Adder_30.io.in_c <= carry[30] @[Adder_N.scala 26:21]
    carry[31] <= Full_Adder_30.io.out_c @[Adder_N.scala 27:20]
    sum[30] <= Full_Adder_30.io.out_s @[Adder_N.scala 28:16]
    node _T_62 = bits(io.A, 31, 31) @[Adder_N.scala 24:28]
    Full_Adder_31.io.in_a <= _T_62 @[Adder_N.scala 24:21]
    node _T_63 = bits(io.B, 31, 31) @[Adder_N.scala 25:28]
    Full_Adder_31.io.in_b <= _T_63 @[Adder_N.scala 25:21]
    Full_Adder_31.io.in_c <= carry[31] @[Adder_N.scala 26:21]
    carry[32] <= Full_Adder_31.io.out_c @[Adder_N.scala 27:20]
    sum[31] <= Full_Adder_31.io.out_s @[Adder_N.scala 28:16]
    node io_Sum_lo_lo_lo_lo = cat(sum[1], sum[0]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_lo_hi = cat(sum[3], sum[2]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_lo = cat(io_Sum_lo_lo_lo_hi, io_Sum_lo_lo_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi_lo = cat(sum[5], sum[4]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi_hi = cat(sum[7], sum[6]) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo_hi = cat(io_Sum_lo_lo_hi_hi, io_Sum_lo_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_lo = cat(io_Sum_lo_lo_hi, io_Sum_lo_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo_lo = cat(sum[9], sum[8]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo_hi = cat(sum[11], sum[10]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_lo = cat(io_Sum_lo_hi_lo_hi, io_Sum_lo_hi_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi_lo = cat(sum[13], sum[12]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi_hi = cat(sum[15], sum[14]) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi_hi = cat(io_Sum_lo_hi_hi_hi, io_Sum_lo_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo_hi = cat(io_Sum_lo_hi_hi, io_Sum_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_lo = cat(io_Sum_lo_hi, io_Sum_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo_lo = cat(sum[17], sum[16]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo_hi = cat(sum[19], sum[18]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_lo = cat(io_Sum_hi_lo_lo_hi, io_Sum_hi_lo_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi_lo = cat(sum[21], sum[20]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi_hi = cat(sum[23], sum[22]) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo_hi = cat(io_Sum_hi_lo_hi_hi, io_Sum_hi_lo_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_lo = cat(io_Sum_hi_lo_hi, io_Sum_hi_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo_lo = cat(sum[25], sum[24]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo_hi = cat(sum[27], sum[26]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_lo = cat(io_Sum_hi_hi_lo_hi, io_Sum_hi_hi_lo_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi_lo = cat(sum[29], sum[28]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi_hi = cat(sum[31], sum[30]) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi_hi = cat(io_Sum_hi_hi_hi_hi, io_Sum_hi_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi_hi = cat(io_Sum_hi_hi_hi, io_Sum_hi_hi_lo) @[Adder_N.scala 31:19]
    node io_Sum_hi = cat(io_Sum_hi_hi, io_Sum_hi_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T = cat(io_Sum_hi, io_Sum_lo) @[Adder_N.scala 31:19]
    node _io_Sum_T_1 = asSInt(_io_Sum_T) @[Adder_N.scala 31:26]
    io.Sum <= _io_Sum_T_1 @[Adder_N.scala 31:12]
    io.Cout <= carry[32] @[Adder_N.scala 32:13]

  module NOT :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<32>, out_not_a : UInt<32>}

    node _io_out_not_a_T = not(io.in_a) @[NOT.scala 11:21]
    io.out_not_a <= _io_out_not_a_T @[NOT.scala 11:18]

  module AND :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<32>, flip in_b : UInt<32>, out_and : UInt<32>}

    node _io_out_and_T = and(io.in_a, io.in_b) @[AND.scala 12:26]
    io.out_and <= _io_out_and_T @[AND.scala 12:15]

  module OR :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<32>, flip in_b : UInt<32>, out_or : UInt<32>}

    node _io_out_or_T = or(io.in_a, io.in_b) @[OR.scala 12:25]
    io.out_or <= _io_out_or_T @[OR.scala 12:14]

  module XOR :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : UInt<32>, flip in_b : UInt<32>, out_xor : UInt<32>}

    node _io_out_xor_T = xor(io.in_a, io.in_b) @[XOR.scala 12:26]
    io.out_xor <= _io_out_xor_T @[XOR.scala 12:15]

  module COMP :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : SInt<32>, flip in_b : SInt<32>, out_comp : UInt<1>}

    node _T = lt(io.in_a, io.in_b) @[COMP.scala 11:18]
    when _T : @[COMP.scala 11:28]
      io.out_comp <= UInt<1>("h1") @[COMP.scala 12:21]
    else :
      io.out_comp <= UInt<1>("h0") @[COMP.scala 14:21]

  module IsEqual :
    input clock : Clock
    input reset : Reset
    output io : { flip in_a : SInt<32>, flip in_b : SInt<32>, out_equal : UInt<1>}

    node _T = eq(io.in_a, io.in_b) @[IsEqual.scala 11:18]
    when _T : @[IsEqual.scala 11:30]
      io.out_equal <= UInt<1>("h1") @[IsEqual.scala 12:17]
    else :
      io.out_equal <= UInt<1>("h0") @[IsEqual.scala 14:21]

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : SInt<32>, flip in_b : SInt<32>, flip in_sel : UInt<3>, out_result : SInt<32>, out_overflow : UInt<1>, out_zero : UInt<1>, out_xor : UInt<32>, out_and : UInt<32>, out_or : UInt<32>, out_not : UInt<32>, out_compare : UInt<1>, out_equal : UInt<1>}

    wire in_b_env : SInt<32> @[ALU.scala 23:20]
    node _T = eq(io.in_sel, UInt<1>("h1")) @[ALU.scala 29:16]
    when _T : @[ALU.scala 29:24]
      inst Adder_8Module of Adder_N @[ALU.scala 30:31]
      Adder_8Module.clock <= clock
      Adder_8Module.reset <= reset
      node _in_b_env_T = not(io.in_b) @[ALU.scala 31:17]
      node _in_b_env_T_1 = asSInt(_in_b_env_T) @[ALU.scala 31:17]
      node _in_b_env_T_2 = add(_in_b_env_T_1, asSInt(UInt<2>("h1"))) @[ALU.scala 31:27]
      node _in_b_env_T_3 = tail(_in_b_env_T_2, 1) @[ALU.scala 31:27]
      node _in_b_env_T_4 = asSInt(_in_b_env_T_3) @[ALU.scala 31:27]
      in_b_env <= _in_b_env_T_4 @[ALU.scala 31:14]
      Adder_8Module.io.Cin <= UInt<1>("h0") @[ALU.scala 32:26]
      Adder_8Module.io.A <= io.in_a @[ALU.scala 33:24]
      Adder_8Module.io.B <= in_b_env @[ALU.scala 34:24]
      io.out_result <= Adder_8Module.io.Sum @[ALU.scala 35:19]
      node _io_out_overflow_T = bits(io.in_a, 31, 31) @[ALU.scala 36:32]
      node _io_out_overflow_T_1 = bits(io.in_b, 31, 31) @[ALU.scala 36:47]
      node _io_out_overflow_T_2 = eq(_io_out_overflow_T, _io_out_overflow_T_1) @[ALU.scala 36:37]
      node _io_out_overflow_T_3 = bits(Adder_8Module.io.Sum, 31, 31) @[ALU.scala 37:46]
      node _io_out_overflow_T_4 = bits(io.in_a, 31, 31) @[ALU.scala 37:61]
      node _io_out_overflow_T_5 = neq(_io_out_overflow_T_3, _io_out_overflow_T_4) @[ALU.scala 37:51]
      node _io_out_overflow_T_6 = and(_io_out_overflow_T_2, _io_out_overflow_T_5) @[ALU.scala 36:53]
      io.out_overflow <= _io_out_overflow_T_6 @[ALU.scala 36:21]
      node _io_out_zero_T = asUInt(io.out_result) @[ALU.scala 38:40]
      node _io_out_zero_T_1 = or(UInt<1>("h0"), _io_out_zero_T) @[ALU.scala 38:25]
      node _io_out_zero_T_2 = not(_io_out_zero_T_1) @[ALU.scala 38:20]
      io.out_zero <= _io_out_zero_T_2 @[ALU.scala 38:17]
      io.out_xor <= UInt<1>("h0") @[ALU.scala 40:20]
      io.out_and <= UInt<1>("h0") @[ALU.scala 41:20]
      io.out_or <= UInt<1>("h0") @[ALU.scala 42:20]
      io.out_not <= UInt<1>("h0") @[ALU.scala 43:20]
      io.out_compare <= UInt<1>("h0") @[ALU.scala 44:20]
      io.out_equal <= UInt<1>("h0") @[ALU.scala 45:20]
      in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 46:20]
    else :
      node _T_1 = eq(io.in_sel, UInt<1>("h0")) @[ALU.scala 48:22]
      when _T_1 : @[ALU.scala 48:30]
        inst Adder_8Module_1 of Adder_N_1 @[ALU.scala 49:31]
        Adder_8Module_1.clock <= clock
        Adder_8Module_1.reset <= reset
        in_b_env <= io.in_b @[ALU.scala 50:14]
        Adder_8Module_1.io.Cin <= UInt<1>("h0") @[ALU.scala 51:26]
        Adder_8Module_1.io.A <= io.in_a @[ALU.scala 52:24]
        Adder_8Module_1.io.B <= io.in_b @[ALU.scala 53:24]
        io.out_result <= Adder_8Module_1.io.Sum @[ALU.scala 54:19]
        node _io_out_overflow_T_7 = bits(io.in_a, 31, 31) @[ALU.scala 55:32]
        node _io_out_overflow_T_8 = bits(io.in_b, 31, 31) @[ALU.scala 55:47]
        node _io_out_overflow_T_9 = eq(_io_out_overflow_T_7, _io_out_overflow_T_8) @[ALU.scala 55:37]
        node _io_out_overflow_T_10 = bits(Adder_8Module_1.io.Sum, 31, 31) @[ALU.scala 56:46]
        node _io_out_overflow_T_11 = bits(io.in_a, 31, 31) @[ALU.scala 56:61]
        node _io_out_overflow_T_12 = neq(_io_out_overflow_T_10, _io_out_overflow_T_11) @[ALU.scala 56:51]
        node _io_out_overflow_T_13 = and(_io_out_overflow_T_9, _io_out_overflow_T_12) @[ALU.scala 55:53]
        io.out_overflow <= _io_out_overflow_T_13 @[ALU.scala 55:21]
        node _io_out_zero_T_3 = asUInt(io.out_result) @[ALU.scala 57:40]
        node _io_out_zero_T_4 = or(UInt<1>("h0"), _io_out_zero_T_3) @[ALU.scala 57:25]
        node _io_out_zero_T_5 = not(_io_out_zero_T_4) @[ALU.scala 57:20]
        io.out_zero <= _io_out_zero_T_5 @[ALU.scala 57:17]
        io.out_xor <= UInt<1>("h0") @[ALU.scala 61:20]
        io.out_and <= UInt<1>("h0") @[ALU.scala 62:20]
        io.out_or <= UInt<1>("h0") @[ALU.scala 63:20]
        io.out_not <= UInt<1>("h0") @[ALU.scala 64:20]
        io.out_compare <= UInt<1>("h0") @[ALU.scala 65:20]
        io.out_equal <= UInt<1>("h0") @[ALU.scala 66:20]
        in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 67:20]
      else :
        node _T_2 = eq(io.in_sel, UInt<2>("h2")) @[ALU.scala 69:22]
        when _T_2 : @[ALU.scala 69:30]
          node U_in_a = asUInt(io.in_a) @[ALU.scala 71:26]
          inst NotModule of NOT @[ALU.scala 72:27]
          NotModule.clock <= clock
          NotModule.reset <= reset
          NotModule.io.in_a <= U_in_a @[ALU.scala 73:23]
          io.out_not <= NotModule.io.out_not_a @[ALU.scala 74:16]
          io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 75:20]
          io.out_overflow <= UInt<1>("h0") @[ALU.scala 76:20]
          io.out_zero <= UInt<1>("h0") @[ALU.scala 77:20]
          io.out_xor <= UInt<1>("h0") @[ALU.scala 78:20]
          io.out_and <= UInt<1>("h0") @[ALU.scala 79:20]
          io.out_or <= UInt<1>("h0") @[ALU.scala 80:20]
          io.out_compare <= UInt<1>("h0") @[ALU.scala 81:20]
          io.out_equal <= UInt<1>("h0") @[ALU.scala 82:20]
          in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 83:20]
        else :
          node _T_3 = eq(io.in_sel, UInt<2>("h3")) @[ALU.scala 85:22]
          when _T_3 : @[ALU.scala 85:30]
            node U_in_a_1 = asUInt(io.in_a) @[ALU.scala 87:26]
            node U_in_b = asUInt(io.in_b) @[ALU.scala 88:26]
            inst ANDModule of AND @[ALU.scala 89:27]
            ANDModule.clock <= clock
            ANDModule.reset <= reset
            ANDModule.io.in_a <= U_in_a_1 @[ALU.scala 90:23]
            ANDModule.io.in_b <= U_in_b @[ALU.scala 91:23]
            io.out_and <= ANDModule.io.out_and @[ALU.scala 92:16]
            io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 93:20]
            io.out_overflow <= UInt<1>("h0") @[ALU.scala 94:20]
            io.out_zero <= UInt<1>("h0") @[ALU.scala 95:20]
            io.out_xor <= UInt<1>("h0") @[ALU.scala 96:20]
            io.out_or <= UInt<1>("h0") @[ALU.scala 97:20]
            io.out_not <= UInt<1>("h0") @[ALU.scala 98:20]
            io.out_compare <= UInt<1>("h0") @[ALU.scala 99:20]
            io.out_equal <= UInt<1>("h0") @[ALU.scala 100:20]
            in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 101:20]
          else :
            node _T_4 = eq(io.in_sel, UInt<3>("h4")) @[ALU.scala 103:22]
            when _T_4 : @[ALU.scala 103:30]
              node U_in_a_2 = asUInt(io.in_a) @[ALU.scala 105:26]
              node U_in_b_1 = asUInt(io.in_b) @[ALU.scala 106:26]
              inst ORModule of OR @[ALU.scala 107:26]
              ORModule.clock <= clock
              ORModule.reset <= reset
              ORModule.io.in_a <= U_in_a_2 @[ALU.scala 108:22]
              ORModule.io.in_b <= U_in_b_1 @[ALU.scala 109:22]
              io.out_or <= ORModule.io.out_or @[ALU.scala 110:15]
              io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 111:20]
              io.out_overflow <= UInt<1>("h0") @[ALU.scala 112:20]
              io.out_zero <= UInt<1>("h0") @[ALU.scala 113:20]
              io.out_xor <= UInt<1>("h0") @[ALU.scala 114:20]
              io.out_and <= UInt<1>("h0") @[ALU.scala 115:20]
              io.out_not <= UInt<1>("h0") @[ALU.scala 116:20]
              io.out_compare <= UInt<1>("h0") @[ALU.scala 117:20]
              io.out_equal <= UInt<1>("h0") @[ALU.scala 118:20]
              in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 119:20]
            else :
              node _T_5 = eq(io.in_sel, UInt<3>("h5")) @[ALU.scala 121:22]
              when _T_5 : @[ALU.scala 121:30]
                node U_in_a_3 = asUInt(io.in_a) @[ALU.scala 123:26]
                node U_in_b_2 = asUInt(io.in_b) @[ALU.scala 124:26]
                inst XORModule of XOR @[ALU.scala 125:27]
                XORModule.clock <= clock
                XORModule.reset <= reset
                XORModule.io.in_a <= U_in_a_3 @[ALU.scala 126:23]
                XORModule.io.in_b <= U_in_b_2 @[ALU.scala 127:23]
                io.out_xor <= XORModule.io.out_xor @[ALU.scala 128:16]
                io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 129:20]
                io.out_overflow <= UInt<1>("h0") @[ALU.scala 130:20]
                io.out_zero <= UInt<1>("h0") @[ALU.scala 131:20]
                io.out_and <= UInt<1>("h0") @[ALU.scala 132:20]
                io.out_or <= UInt<1>("h0") @[ALU.scala 133:20]
                io.out_not <= UInt<1>("h0") @[ALU.scala 134:20]
                io.out_compare <= UInt<1>("h0") @[ALU.scala 135:20]
                io.out_equal <= UInt<1>("h0") @[ALU.scala 136:20]
                in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 137:20]
              else :
                node _T_6 = eq(io.in_sel, UInt<3>("h6")) @[ALU.scala 140:22]
                when _T_6 : @[ALU.scala 140:30]
                  inst COMPModule of COMP @[ALU.scala 142:28]
                  COMPModule.clock <= clock
                  COMPModule.reset <= reset
                  COMPModule.io.in_a <= io.in_a @[ALU.scala 143:24]
                  COMPModule.io.in_b <= io.in_b @[ALU.scala 144:24]
                  io.out_compare <= COMPModule.io.out_comp @[ALU.scala 145:20]
                  io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 146:20]
                  io.out_overflow <= UInt<1>("h0") @[ALU.scala 147:20]
                  io.out_zero <= UInt<1>("h0") @[ALU.scala 148:20]
                  io.out_xor <= UInt<1>("h0") @[ALU.scala 149:20]
                  io.out_and <= UInt<1>("h0") @[ALU.scala 150:20]
                  io.out_or <= UInt<1>("h0") @[ALU.scala 151:20]
                  io.out_not <= UInt<1>("h0") @[ALU.scala 152:20]
                  io.out_equal <= UInt<1>("h0") @[ALU.scala 153:20]
                  in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 154:20]
                else :
                  node _T_7 = eq(io.in_sel, UInt<3>("h7")) @[ALU.scala 158:22]
                  when _T_7 : @[ALU.scala 158:30]
                    inst IsEqualModule of IsEqual @[ALU.scala 160:31]
                    IsEqualModule.clock <= clock
                    IsEqualModule.reset <= reset
                    IsEqualModule.io.in_a <= io.in_a @[ALU.scala 161:27]
                    IsEqualModule.io.in_b <= io.in_b @[ALU.scala 162:27]
                    io.out_equal <= IsEqualModule.io.out_equal @[ALU.scala 163:18]
                    io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 164:20]
                    io.out_overflow <= UInt<1>("h0") @[ALU.scala 165:20]
                    io.out_zero <= UInt<1>("h0") @[ALU.scala 166:20]
                    io.out_xor <= UInt<1>("h0") @[ALU.scala 167:20]
                    io.out_and <= UInt<1>("h0") @[ALU.scala 168:20]
                    io.out_or <= UInt<1>("h0") @[ALU.scala 169:20]
                    io.out_not <= UInt<1>("h0") @[ALU.scala 170:20]
                    io.out_compare <= UInt<1>("h0") @[ALU.scala 171:20]
                    in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 172:20]
                  else :
                    io.out_result <= asSInt(UInt<1>("h0")) @[ALU.scala 175:20]
                    io.out_overflow <= UInt<1>("h0") @[ALU.scala 176:20]
                    io.out_zero <= UInt<1>("h0") @[ALU.scala 177:20]
                    io.out_xor <= UInt<1>("h0") @[ALU.scala 178:20]
                    io.out_and <= UInt<1>("h0") @[ALU.scala 179:20]
                    io.out_or <= UInt<1>("h0") @[ALU.scala 180:20]
                    io.out_not <= UInt<1>("h0") @[ALU.scala 181:20]
                    io.out_compare <= UInt<1>("h0") @[ALU.scala 182:20]
                    io.out_equal <= UInt<1>("h0") @[ALU.scala 183:20]
                    in_b_env <= asSInt(UInt<1>("h0")) @[ALU.scala 184:20]

