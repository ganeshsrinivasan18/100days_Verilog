module lottery_system(clk,reset,winner,start);
input clk,reset,start;
output reg [3:0]winner;
reg [3:0]lfsr;
wire feedback;
assign feedback = lfsr[3] ^ lfsr[1];
always @ (posedge clk or posedge reset)begin 
if (reset) begin 
lfsr <= 4'b0001;
end 
else if (start) begin 
lfsr <= {lfsr[2:0] , feedback};
winner <= lfsr % 16;
end 
end
endmodule
