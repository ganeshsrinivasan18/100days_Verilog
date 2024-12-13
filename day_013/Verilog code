module t_ff(t,clk,q,qbar );
input t,clk;
output reg q=0;
output qbar;
always @(posedge clk)
if (t==1)
   q=~q;
else
   q = q;

assign qbar=~q;
endmodule
