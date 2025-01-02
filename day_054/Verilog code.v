module gaussian_noise_generator(clk,reset,noise);
input clk,reset;
output reg [7:0]noise;
reg [7:0]lfsr1,lfsr2,lfsr3,lfsr4;
//LFSR logic
always @(posedge clk or posedge reset)begin
if(reset)begin
lfsr1 <= 8'b00000001;
lfsr2 <= 8'b00000010;
lfsr3 <= 8'b00000100;
lfsr4 <= 8'b00001000;
end
else begin 
lfsr1 <= {lfsr1[6:0],(lfsr1[7] ^ lfsr1[5])};
lfsr2 <= {lfsr2[6:0],(lfsr2[7] ^ lfsr2[4])};
lfsr3 <= {lfsr3[6:0],(lfsr3[7] ^ lfsr3[3])};
lfsr4 <= {lfsr4[6:0],(lfsr4[7] ^ lfsr4[2])};
end
end

//noise(output)logic
always @(posedge clk or posedge reset) begin 
if (reset)
noise <= 8'b0;
else 
noise <= lfsr1 + lfsr2 + lfsr3 + lfsr4;
end
endmodule
