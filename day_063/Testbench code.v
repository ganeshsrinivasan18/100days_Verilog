module watermark_generator_tb();
reg clk;
reg reset;
reg [7:0]pixel_in;
reg watermark_bit;
wire [7:0]pixel_out;
watermark_generator DUT(.clk(clk),.reset(reset),.pixel_in(pixel_in),.pixel_out(pixel_out),.watermark_bit(watermark_bit));
initial begin 
$dumpfile("watermark_generator.vcd");
$dumpvars(0,watermark_generator_tb);
$monitor($time,"clk=%b,reset=%b,pixel_in=%b,pixel_out=%b,watermark_bit=%b",clk,reset,pixel_in,pixel_out,watermark_bit);
end
initial begin 
clk=0;reset=1;watermark_bit=1;pixel_in=8'b10001111;
forever #5 clk=~clk;
end
initial begin 
#7 reset=0;
#10 pixel_in = 8'b10011010; 
#10 watermark_bit = 1;
#10 pixel_in = $random();
#10 watermark_bit = 1;
#10 pixel_in = $random();
#10 watermark_bit = 0;
#10 pixel_in = $random();
#10 watermark_bit = 1;
#10 pixel_in = $random();
#10 watermark_bit = 0;
#10 pixel_in = $random();
#10 watermark_bit = 1;
#10 pixel_in = $random();
#10 watermark_bit = 0;
#10 $finish;
end
endmodule
