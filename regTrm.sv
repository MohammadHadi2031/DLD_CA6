`timescale 1ns/1ns

module regTrm (output logic[15:0] data, input [15:0] Din, input init, LdB , clk, rst);

always @(posedge clk, posedge rst)
if(rst) data<= 16'b0;
else if(init)data<=1;
else if(LdB) data<=Din;

endmodule