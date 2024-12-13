module sr_flip_flop(S,R,clk,Q,Qbar);
input S,R,clk;
output Q,Qbar;
wire n3,n4;


nand A(n3,S,clk); 
nand B(n4,R,clk);
nand C(Q,n3,Qbar);
nand D(Qbar,n4,Q);
endmodule
