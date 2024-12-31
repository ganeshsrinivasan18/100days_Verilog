module pipo2(dout,din,ld,clr,clk);

input [15:0] din;
input ld,clr,clk;
output reg [15:0] dout;
always @(posedge clk) begin

if(clr) dout<=16'b0000_0000_0000_0000;
else if(ld) dout<=din;  

end
endmodule
