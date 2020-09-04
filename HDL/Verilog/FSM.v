module FSM#(parameter a = 3'b000, b = 3'b001, c = 3'b010)
(
  input wire In1,
  input wire RST,
  input wire CLK, 
  output reg Out1  
);
/* reg [3:0]PS;
 reg [3:0]NS;

always@(posedge CLK, negedge RST)
begin : sequencial
if (RST == 1'b1)
	PS <= a;
else if(CLK == 1'b1 & RST == 1'b0)
	PS <= NS;
end

always@(CLK,PS,NS,In1)
begin : combinational
case(PS)
a:
begin : a
Out1 <= 1'b0;
if (In1 == 1'b0)
	NS <= a;
else 
	NS <= b;
end
b:
begin
Out1 <= 1'b0;
if (In1 == 1'b1)
	NS <= b;
else 
	NS <= c;
end
c:
begin
Out1 <= 1'b1;
if (In1 == 1'b0)
	NS <= c;
else 
	NS <= a;
end
default :
begin
	NS <= a;
end
endcase
end */
endmodule
