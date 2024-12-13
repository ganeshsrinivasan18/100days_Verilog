module carry_lookahead_adder(A,B,Cin,sum,carry);
input [3:0]A;
input [3:0]B;
input Cin;
output [3:0]sum;
output carry;
wire [3:0] G,P,C;
assign G=A&B;
assign P=A^B;
assign C[0]=(P[0]&Cin)|G[0];
assign C[1]=(P[1]&C[0])|G[1];
assign C[2]=(P[2]&C[1])|G[2];
assign C[3]=(P[3]&C[2])|G[3];
assign sum=P^C;
assign carry=(P[3]&C[3])|G[3];

endmodule
