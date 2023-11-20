module Mymodule(
  input        clock,
  input        reset,
  input  [3:0] io_in_1,
  input  [3:0] io_in_2,
  output [3:0] io_out_add,
  output [3:0] io_out_sub,
  output [3:0] io_out_mul
);
  wire [7:0] _io_out_mul_T = io_in_1 * io_in_2; // @[main.scala 15:31]
  assign io_out_add = io_in_1 + io_in_2; // @[main.scala 13:31]
  assign io_out_sub = io_in_1 - io_in_2; // @[main.scala 14:31]
  assign io_out_mul = _io_out_mul_T[3:0]; // @[main.scala 15:20]
endmodule
