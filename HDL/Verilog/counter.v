module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output reg [3:0]Q,        // Parallel Output 	
    output reg RCO            // Ripple Carry Output (Terminal Count
);

always@(D,CLK,CLR_n,LOAD_n,ENP,ENT)
begin
if(CLK == 1'b0 & CLR_n == 1'b0) 
	Q <= 4'b0000;
else if (CLK == 1'b1 & CLR_n == 1'b1 & ENP == 1'b0  & ENT == 1'b0)
	Q <= D;
else if (CLK == 1'b1 & CLR_n == 1'b1 & ENP == 1'b1 & ENT ==1'b0 )
begin
	Q <= Q+1;
end 
if(Q == 4'b1111)
	RCO <= 1'b1;    
else 
	RCO <= 1'b0;
end 

endmodule
