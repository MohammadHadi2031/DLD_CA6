`timescale 1ns/1ns 

module Adder (output [15:0]res, input[15:0] Sinout, Trm, input sign);
assign res = sign ? Sinout - Trm : Sinout + Trm;
endmodule
