module lfsr(clk,reset,lfsr_out);
input clk,reset;
output reg [3:0]lfsr_out;
always @ (posedge clk or posedge reset)begin
if (reset)
lfsr_out <= 4'b1111;
else 
lfsr_out <= {lfsr_out[2:0],(lfsr_out[3] ^ lfsr_out[2])};
end
endmodule
