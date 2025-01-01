module noise_generator_tb();
reg clk,reset;
wire [7:0]noise;
noise_generator DUT(.clk(clk),.reset(reset),.noise(noise));

initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin 
reset=1;
#3reset=0;
#500$finish;
end

initial begin 
$dumpfile("noise_generator.vcd");
$dumpvars(0,noise_generator_tb);
$monitor($time,"clk=%b,reset=%b,noise=%b",clk,reset,noise);
end
endmodule
