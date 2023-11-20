module Mymodule(
  input        clock,
  input        reset,
  input  [3:0] io_in_1,
  input  [3:0] io_in_2,
  input        io_sel,
  output [3:0] io_out_mux,
  output [7:0] io_out_cat
);
  assign io_out_mux = io_sel ? io_in_1 : io_in_2; // @[main.scala 14:26]
  assign io_out_cat = {io_in_1,io_in_2}; // @[Cat.scala 31:58]
endmodule
