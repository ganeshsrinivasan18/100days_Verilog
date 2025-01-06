module rotating_led_tb();
reg clk,reset;
wire [7:0]led;
rotating_led DUT(.clk(clk),.reset(reset),.led(led));
initial begin 
$dumpfile("rotating_led.vcd");
$dumpvars(0,rotating_led_tb);
$monitor($time,"clk=%b,reset=%b,led=%b",clk,reset,led);
end
initial begin 
clk=0;reset=1;
forever #5 clk=~clk;
end
initial begin 

#5 reset=0;

#200$finish;
end
endmodule
