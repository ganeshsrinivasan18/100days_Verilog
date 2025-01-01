module noise_generator(clk,reset,noise);
input clk,reset;
output [7:0]noise;
reg [7:0] lfsr;

always @(posedge clk or posedge  reset)begin 
if (reset) 
lfsr <= 8'b1111_1111;
else 
lfsr <= {lfsr[6:0],(lfsr[7] ^ lfsr[5])};
end

assign noise = lfsr;


endmodule
