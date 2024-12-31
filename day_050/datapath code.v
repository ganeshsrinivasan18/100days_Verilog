module mul_datapath(eqz,lda,ldb,ldp,clrp,decb,data_in,clk);
input lda,ldb,ldp,clrp,decb,clk;
input [15:0] data_in;
output eqz;
wire [15:0] x,y,z,bout,bus;
assign bus=data_in;
pipo1 a (x,bus,lda,clk);
pipo2 p (y,z,ldp,clrp,clk);
cntr b (bout,bus,ldb,decb,clk);
add ad (z,x,y);
eqz comp (eqz,bout);
endmodule
