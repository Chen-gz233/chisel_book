module Array_2D(
  input        clock,
  input        reset,
  input  [7:0] io_in_a,
  input        io_in_en,
  output       io_out_en,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stage; // @[main.scala 15:24]
  reg [7:0] out_reg; // @[main.scala 18:26]
  reg  in_en_r; // @[main.scala 21:27]
  reg [7:0] twoDVecT_2_2; // @[main.scala 25:27]
  assign io_out_en = stage == 2'h0; // @[main.scala 45:16]
  assign io_out = out_reg; // @[main.scala 56:12]
  always @(posedge clock) begin
    if (reset) begin // @[main.scala 15:24]
      stage <= 2'h2; // @[main.scala 15:24]
    end else if (in_en_r & ~io_in_en) begin // @[main.scala 40:30]
      stage <= 2'h0; // @[main.scala 41:15]
    end else if (io_in_en) begin // @[main.scala 29:19]
      stage <= 2'h1; // @[main.scala 30:15]
    end
    if (reset) begin // @[main.scala 18:26]
      out_reg <= 8'h0; // @[main.scala 18:26]
    end else if (stage == 2'h0) begin // @[main.scala 45:25]
      out_reg <= twoDVecT_2_2; // @[main.scala 49:29]
    end else begin
      out_reg <= 8'h0; // @[main.scala 53:17]
    end
    if (reset) begin // @[main.scala 21:27]
      in_en_r <= 1'h0; // @[main.scala 21:27]
    end else begin
      in_en_r <= io_in_en; // @[main.scala 22:13]
    end
    if (reset) begin // @[main.scala 25:27]
      twoDVecT_2_2 <= 8'h0; // @[main.scala 25:27]
    end else if (io_in_en) begin // @[main.scala 29:19]
      twoDVecT_2_2 <= io_in_a; // @[main.scala 34:31]
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
  stage = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  out_reg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  in_en_r = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  twoDVecT_2_2 = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
