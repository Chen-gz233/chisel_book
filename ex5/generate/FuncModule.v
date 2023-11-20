module FuncModule(
  input        clock,
  input        reset,
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [7:0] io_out
);
  wire [4:0] add_out = io_a + io_b; // @[main.scala 6:15]
  assign io_out = {{3'd0}, add_out}; // @[main.scala 15:12]
endmodule
