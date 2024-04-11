module moor(
  input   clock,
  input   reset,
  input   io_din,
  output  io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] StageReg; // @[moor.scala 11:27]
  wire [1:0] _GEN_2 = ~io_din ? 2'h0 : StageReg; // @[moor.scala 31:33 32:26 34:26]
  assign io_dout = StageReg == 2'h2; // @[moor.scala 38:29]
  always @(posedge clock) begin
    if (reset) begin // @[moor.scala 11:27]
      StageReg <= 2'h0; // @[moor.scala 11:27]
    end else if (2'h0 == StageReg) begin // @[moor.scala 14:21]
      if (io_din) begin // @[moor.scala 16:33]
        StageReg <= 2'h1; // @[moor.scala 17:26]
      end
    end else if (2'h1 == StageReg) begin // @[moor.scala 14:21]
      if (io_din) begin // @[moor.scala 24:31]
        StageReg <= 2'h2; // @[moor.scala 25:26]
      end else begin
        StageReg <= 2'h0; // @[moor.scala 27:26]
      end
    end else if (2'h2 == StageReg) begin // @[moor.scala 14:21]
      StageReg <= _GEN_2;
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
  StageReg = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
