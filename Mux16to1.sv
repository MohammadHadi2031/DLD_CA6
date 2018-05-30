`timescale 1ns/1ns

module Mux16to1 (output[ 15:0] out, input[15:0] X, tab, input Selx, Seltab);
  assign out = Selx ? X :(Seltab ? tab : 16'bx);
endmodule 
