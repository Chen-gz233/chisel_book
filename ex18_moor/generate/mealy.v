module mealy(
  input   clock,
  input   reset,
  input   io_din,
  output  io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  StageReg; // @[mealy.scala 11:28]
  wire  _GEN_0 = io_din | StageReg; // @[mealy.scala 15:33 16:26 18:22]
  wire  _GEN_1 = io_din & StageReg; // @[mealy.scala 23:33 24:26 27:26]
  assign io_dout = StageReg; // @[mealy.scala 32:20]
  always @(posedge clock) begin
    if (reset) begin // @[mealy.scala 11:28]
      StageReg <= 1'h0; // @[mealy.scala 11:28]
    end else if (~StageReg) begin // @[mealy.scala 13:21]
      StageReg <= _GEN_0;
    end else if (StageReg) begin // @[mealy.scala 13:21]
      StageReg <= _GEN_1;
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
  StageReg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
