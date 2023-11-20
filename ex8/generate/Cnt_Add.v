module Cnt_Add(
  input        clock,
  input        reset,
  input        io_in_en,
  output       io_out_en,
  output [7:0] io_out_cnt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] cntReg; // @[main.scala 11:25]
  wire [7:0] _cntReg_T_4 = cntReg + 8'h1; // @[main.scala 12:67]
  assign io_out_en = io_in_en; // @[main.scala 13:25 15:19 18:19]
  assign io_out_cnt = cntReg; // @[main.scala 13:25 14:20 17:20]
  always @(posedge clock) begin
    if (reset) begin // @[main.scala 11:25]
      cntReg <= 8'h0; // @[main.scala 11:25]
    end else if (cntReg == 8'h9 & io_in_en) begin // @[main.scala 12:18]
      cntReg <= 8'h0;
    end else begin
      cntReg <= _cntReg_T_4;
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
  cntReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
