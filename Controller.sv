`timescale 1ns/1ns

module Controller(output logic Ldx, LdTrm, LdSinout, LdY, iniSinout, iniTrm,  Selx, SelTab, Sign, ready,
                    output logic[2:0] tabCnt,
                   input less, start, clk, rst);
  localparam[2:0] idle=1, starting =2, init=3, CalSin =4, Mul1=5, Mul2=6, Div=7;
  logic[2:0] ns, ps;
  //logic less=0;
  initial Sign = 0;
  initial tabCnt = 3'b0;
  always @(ps, start, less, clk) begin
     ns <=idle;
    case(ps)
      idle: ns<= start? starting: idle;
      starting: ns<= start? starting: init;
      init: ns<= ~less? CalSin:idle;
      CalSin: ns<= clk? Mul1:CalSin;
      Mul1: ns<= clk? Mul2: Mul1;
      Mul2: ns<= clk ? Div: Mul2;
      Div : ns<= ~less? CalSin: idle;
      default: ns<=idle;
    endcase
  end
  
  always@(ps) begin
    {Ldx, LdTrm, LdSinout, LdY, iniSinout, iniTrm,  Selx, SelTab, ready} = 9'b0;
   
     case(ps)
      idle: begin ready=1; end
      starting: begin iniSinout= 1; iniTrm=1; end
      init: begin Ldx= 1; LdTrm =1; LdY =1; Selx=1; end
      CalSin: begin LdSinout=1; end
      Mul1: begin LdTrm=1; Selx =1; end
      Mul2: begin LdTrm=1; Selx =1; end
      Div : begin LdTrm=1; SelTab=1; Sign++; tabCnt++; end
    endcase
    
  end
  
  always @(posedge clk, posedge rst) begin
    if(rst)
     ps <= idle;
    else
     ps <= ns;
    
  end
    
  


endmodule

