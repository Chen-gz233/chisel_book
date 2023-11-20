module FSM(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stage; // @[main.scala 17:24]
  wire  _T_1 = ~io_in; // @[main.scala 28:24]
  wire [3:0] _GEN_3 = _T_1 ? 4'h3 : 4'h5; // @[main.scala 45:32 46:23 48:23]
  wire [3:0] _GEN_4 = _T_1 ? 4'h4 : 4'h5; // @[main.scala 52:32 53:23 55:23]
  wire [3:0] _GEN_7 = _T_1 ? 4'h1 : 4'h6; // @[main.scala 68:32 69:23 72:23]
  wire [3:0] _GEN_9 = _T_1 ? 4'h1 : 4'h7; // @[main.scala 77:32 78:23 80:23]
  wire [3:0] _GEN_10 = _T_1 ? 4'h1 : 4'h8; // @[main.scala 85:32 86:23 88:23]
  wire  _GEN_12 = _T_1 ? 1'h0 : 1'h1; // @[main.scala 21:12 93:36 97:28]
  wire [3:0] _GEN_13 = 4'h8 == stage ? _GEN_10 : stage; // @[main.scala 26:18 17:24]
  wire [3:0] _GEN_15 = 4'h7 == stage ? _GEN_10 : _GEN_13; // @[main.scala 26:18]
  wire  _GEN_16 = 4'h7 == stage ? 1'h0 : 4'h8 == stage & _GEN_12; // @[main.scala 21:12 26:18]
  wire [3:0] _GEN_17 = 4'h6 == stage ? _GEN_9 : _GEN_15; // @[main.scala 26:18]
  wire  _GEN_18 = 4'h6 == stage ? 1'h0 : _GEN_16; // @[main.scala 21:12 26:18]
  wire [3:0] _GEN_19 = 4'h5 == stage ? _GEN_7 : _GEN_17; // @[main.scala 26:18]
  wire  _GEN_20 = 4'h5 == stage ? 1'h0 : _GEN_18; // @[main.scala 26:18]
  wire [3:0] _GEN_21 = 4'h4 == stage ? _GEN_4 : _GEN_19; // @[main.scala 26:18]
  wire  _GEN_22 = 4'h4 == stage ? _T_1 : _GEN_20; // @[main.scala 26:18]
  wire [3:0] _GEN_23 = 4'h3 == stage ? _GEN_4 : _GEN_21; // @[main.scala 26:18]
  wire  _GEN_24 = 4'h3 == stage ? 1'h0 : _GEN_22; // @[main.scala 21:12 26:18]
  wire  _GEN_26 = 4'h2 == stage ? 1'h0 : _GEN_24; // @[main.scala 21:12 26:18]
  wire  _GEN_28 = 4'h1 == stage ? 1'h0 : _GEN_26; // @[main.scala 26:18]
  assign io_out = 4'h0 == stage ? 1'h0 : _GEN_28; // @[main.scala 21:12 26:18]
  always @(posedge clock) begin
    if (reset) begin // @[main.scala 17:24]
      stage <= 4'h0; // @[main.scala 17:24]
    end else if (4'h0 == stage) begin // @[main.scala 26:18]
      if (~io_in) begin // @[main.scala 28:32]
        stage <= 4'h1; // @[main.scala 29:23]
      end else begin
        stage <= 4'h5; // @[main.scala 31:23]
      end
    end else if (4'h1 == stage) begin // @[main.scala 26:18]
      if (_T_1) begin // @[main.scala 35:32]
        stage <= 4'h2; // @[main.scala 36:23]
      end else begin
        stage <= 4'h5; // @[main.scala 39:23]
      end
    end else if (4'h2 == stage) begin // @[main.scala 26:18]
      stage <= _GEN_3;
    end else begin
      stage <= _GEN_23;
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
  stage = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
