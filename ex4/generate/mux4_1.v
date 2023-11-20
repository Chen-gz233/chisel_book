module mux4_1(
  input        clock,
  input        reset,
  input  [3:0] io_in_a,
  input  [1:0] io_in_sel,
  output       io_out
);
  wire  _GEN_0 = io_in_sel == 2'h3 ? io_in_a[3] : io_in_a[0]; // @[main.scala 18:33 19:16 21:15]
  wire  _GEN_1 = io_in_sel == 2'h2 ? io_in_a[2] : _GEN_0; // @[main.scala 16:33 17:16]
  wire  _GEN_2 = io_in_sel == 2'h1 ? io_in_a[1] : _GEN_1; // @[main.scala 14:33 15:16]
  assign io_out = io_in_sel == 2'h0 ? io_in_a[0] : _GEN_2; // @[main.scala 12:28 13:16]
endmodule
