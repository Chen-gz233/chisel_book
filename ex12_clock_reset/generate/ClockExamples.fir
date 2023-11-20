circuit ClockExamples :
  module ClockExamples :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<10>, flip alternateReset : UInt<1>, flip alternateClock : Clock, outImplicit : UInt, outAlternateReset : UInt, outAlternateClock : UInt, outAlternateBoth : UInt}

    reg imp : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[main.scala 15:22]
    imp <= io.in @[main.scala 16:9]
    io.outImplicit <= imp @[main.scala 17:20]
    reg altRst : UInt<10>, clock with :
      reset => (io.alternateReset, UInt<10>("h0")) @[main.scala 21:29]
    altRst <= io.in @[main.scala 22:16]
    io.outAlternateReset <= altRst @[main.scala 23:30]
    reg altClk : UInt<10>, io.alternateClock with :
      reset => (reset, UInt<10>("h0")) @[main.scala 27:29]
    altClk <= io.in @[main.scala 28:16]
    io.outAlternateClock <= altClk @[main.scala 29:30]
    reg alt : UInt<10>, io.alternateClock with :
      reset => (io.alternateReset, UInt<10>("h0")) @[main.scala 33:26]
    alt <= io.in @[main.scala 34:13]
    io.outAlternateBoth <= alt @[main.scala 35:29]

