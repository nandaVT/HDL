module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y
);

always@*
begin
case (Op_code)  
1'b000 : Y = A;
1'b001 : Y = A+B;
1'b010 : Y = A-B;
1'b011 : Y = A & B;
1'b100 : Y = A | B;
1'b101 : Y = A + 32'h0001;
1'b110 : Y = A - 32'h0001;
1'b111 : Y = 1'bX;
default : Y = 1'bX;
endcase
end


endmodule
