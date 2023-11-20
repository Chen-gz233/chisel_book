module MAC(
  input        clock,
  input        reset,
  input  [3:0] io_in_a,
  input  [3:0] io_in_b,
  input  [3:0] io_in_c,
  output [7:0] io_out
);
  wire [7:0] _io_out_T = io_in_a * io_in_b; // @[main.scala 11:23]
  wire [7:0] _GEN_0 = {{4'd0}, io_in_c}; // @[main.scala 11:33]
  assign io_out = _io_out_T + _GEN_0; // @[main.scala 11:33]
endmodule
