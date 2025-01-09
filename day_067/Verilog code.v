
module random_colour_generator(clk,reset,r,g,b);
input clk;
input reset;
output reg[7:0]r;
output reg[7:0]g;
output reg[7:0]b;

reg [23:0]lfsr;
wire feedback;

assign feedback = (lfsr[23] ^ lfsr[22] ^ lfsr[21] ^ lfsr[16]);
always @ (posedge clk or posedge reset)begin 
if (reset)begin 
lfsr <= 24'hf;
end 
else begin 
lfsr <= ({lfsr[22:0],feedback});
end
end

always @ (posedge clk or posedge reset)begin
if (reset) begin 
r <= 8'h0;
g <= 8'h0;
b <= 8'h0; 
end  
else begin 
r <= lfsr[23:16];
g <= lfsr[15:8];
b <= lfsr[7:0];
end 
end
endmodule
