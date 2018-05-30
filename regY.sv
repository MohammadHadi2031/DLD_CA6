`timescale 1ns/1ns

module regY (output logic[7:0] Yout, input [7:0] Yin, input Ld , clk, rst);

always @(posedge clk, posedge rst)
if(rst) Yout<= 8'b0;
else if(Ld) Yout<=Yin;

endmodule