module misr(clk,reset,signature,data_in);
input clk,reset;
input [3:0]data_in;
output reg [3:0]signature;
wire feedback;

assign feedback = (signature[3] ^ data_in[3]);

always @ (posedge clk)begin 
if (reset)begin 
signature <= 4'b0000;
end
else begin 
signature <= {signature[2:0],feedback} ^ data_in;
end 
end
endmodule
