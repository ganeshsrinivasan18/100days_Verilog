module gaussian_noise_generator_tb();
reg clk,reset;
wire [7:0]noise;
//instantiation of module
gaussian_noise_generator DUT(.clk(clk),.reset(reset),.noise(noise));
//initializing values 
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin 
$dumpfile("gaussian_noise_generator.vcd");
$dumpvars(0,gaussian_noise_generator_tb);
$monitor($time,"clk=%b,reset=%b,noise=%b",clk,reset,noise);
end
initial begin 
reset=1;
#3 reset=0;
#200 $finish;
end
endmodule
