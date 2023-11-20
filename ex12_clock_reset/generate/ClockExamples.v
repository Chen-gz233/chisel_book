module ClockExamples(
  input        clock,
  input        reset,
  input  [9:0] io_in,
  input        io_alternateReset,
  input        io_alternateClock,
  output [9:0] io_outImplicit,
  output [9:0] io_outAlternateReset,
  output [9:0] io_outAlternateClock,
  output [9:0] io_outAlternateBoth
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] imp; // @[main.scala 15:22]
  reg [9:0] altRst; // @[main.scala 21:29]
  reg [9:0] altClk; // @[main.scala 27:29]
  reg [9:0] alt; // @[main.scala 33:26]
  assign io_outImplicit = imp; // @[main.scala 17:20]
  assign io_outAlternateReset = altRst; // @[main.scala 23:30]
  assign io_outAlternateClock = altClk; // @[main.scala 29:30]
  assign io_outAlternateBoth = alt; // @[main.scala 35:29]
  always @(posedge clock) begin
    if (reset) begin // @[main.scala 15:22]
      imp <= 10'h0; // @[main.scala 15:22]
    end else begin
      imp <= io_in; // @[main.scala 16:9]
    end
    if (io_alternateReset) begin // @[main.scala 21:29]
      altRst <= 10'h0; // @[main.scala 21:29]
    end else begin
      altRst <= io_in; // @[main.scala 22:16]
    end
  end
  always @(posedge io_alternateClock) begin
    if (reset) begin // @[main.scala 27:29]
      altClk <= 10'h0; // @[main.scala 27:29]
    end else begin
      altClk <= io_in; // @[main.scala 28:16]
    end
    if (io_alternateReset) begin // @[main.scala 33:26]
      alt <= 10'h0; // @[main.scala 33:26]
    end else begin
      alt <= io_in; // @[main.scala 34:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  imp = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  altRst = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  altClk = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  alt = _RAND_3[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
