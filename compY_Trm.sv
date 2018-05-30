`timescale 1ns/1ns

module compY_Trm (output less, input[7:0] Y, input[15:0] Trm);
  assign less = Trm < {8'b0 , Y};
endmodule 


