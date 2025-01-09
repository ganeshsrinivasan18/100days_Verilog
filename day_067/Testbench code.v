module random_colour_generator_tb();
reg clk;
reg reset;
wire [7:0]r;
wire [7:0]g;
wire [7:0]b;
random_colour_generator DUT(.clk(clk),.reset(reset),.r(r),.g(g),.b(b));
initial begin 
$dumpfile("random_colour_generator.vcd");
$dumpvars(0,random_colour_generator_tb);
$monitor($time,"clk=%b,reset=%b,r=%h,g=%h,b=%h",clk,reset,r,g,b);
end
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
reset=1;
#5 reset=0;
#300 $finish;
end
endmodule
