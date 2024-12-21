module traffic_light_tb();
reg clk,reset;
wire [1:0] light;
traffic_light DUT(.clk(clk),.reset(reset),.light(light));
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
$dumpfile("traffic_light.vcd");
$dumpvars(0,traffic_light_tb);
$monitor($time,"clk=%b,reset=%b,light=%b",clk,reset,light);

reset =1;
#5 reset =0;

#150 $finish;
end
endmodule
