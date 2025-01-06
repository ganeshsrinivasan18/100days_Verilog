module digital_dice_simulator_tb();
reg clk;
reg reset;
reg roll;
wire [2:0]dice_value;
digital_dice_simulator DUT(.clk(clk),.reset(reset),.roll(roll),.dice_value(dice_value));

initial begin 
$dumpfile("digital_dice_simulator.vcd");
$dumpvars(0,digital_dice_simulator_tb);
$monitor($time,"clk=%b,reset=%b,roll=%b,dice_value=%b",clk,reset,roll,dice_value);
end 

initial begin 
clk=0;roll=0;
forever #5clk=~clk;
end

initial begin 
reset=1;
#5 reset=0;
#10 roll=1;
#10 roll=0;
#10 roll=1;
#10 roll=1;
#10 roll=0;
#10 roll=0;
#10 roll=0;
#10 roll=1;
#10 roll=1;
#10 $finish;
end
endmodule
