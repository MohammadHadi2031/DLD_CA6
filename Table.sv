
module Table(output logic[15:0] div, input[2:0] sel);
	always @(sel)  begin
		case(sel)
			3'b000: div <= {8'b00000000, 8'b00101010};// 1/6
			3'b001: div <= {8'b00000000, 8'b00001100};// 1/20
			3'b010: div <= {8'b00000000, 8'b00000110}; // 1/42
			3'b011: div <= {8'b00000000, 8'b00000011}; //1/72
			3'b100: div <= {8'b00000000, 8'b00000010}; // 1/110
			3'b101: div <= {8'b00000000, 8'bx};
			3'b110: div <= {8'b00000000, 8'bx};
			3'b111: div <= {8'b00000000, 8'bx};
			
		endcase
	end

endmodule
