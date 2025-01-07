module watermark_generator(clk,reset,pixel_in,pixel_out,watermark_bit);
input clk;  //clock signal for input
input reset; //reset signal for the device
input [7:0]pixel_in; //pixel data for the watermark
input watermark_bit;   //watermark_bit for the different watermark generation
output reg [7:0]pixel_out; //pixel out for the watermark generator
//logic for watermark generator
always @ (posedge clk)begin
if(reset)begin
pixel_out <= 8'b0;
end 
else begin
pixel_out <= {pixel_in[7:1],watermark_bit};
end 
end
endmodule
