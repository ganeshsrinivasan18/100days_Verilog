module smart_water_dispenser_tb();
//declaring the module ports
reg clk;
reg reset;
reg start_dispense;
reg stop_dispense;
wire [3:0] timer;
wire water_flow;
wire dispense_active;


//instantiating the module 
smart_water_dispenser DUT (.clk(clk),
                           .reset(reset),
                           .start_dispense(start_dispense),
                           .stop_dispense(stop_dispense),
                           .timer(timer),
                           .water_flow(water_flow),
                           .dispense_active(dispense_active));
                           

//instantiating the module and testbench
initial begin 
$dumpfile("smart_water_dispenser.vcd");
$dumpvars(0,smart_water_dispenser_tb);
$monitor("Time: %0t | Timer: %d | Water Flow: %b | Active: %b",$time,timer,water_flow,dispense_active);
end

//initializing the clock signal 
initial begin 
clk=0;
forever #5 clk=~clk;
end 

//initializing the reset signal and Test cases
initial begin 
//reset signal is high
reset=1;
start_dispense=0;
stop_dispense=0;

//when reset is released 
#15 reset=0; 

//Test cases...

$display("Smart Water Dispensing System begins...."); 

//Test case 1 manually stop the water flow
#10 start_dispense =1;
#10 start_dispense =0;

#30 stop_dispense=1;
#10 stop_dispense=0;
$display("Manually Stop the Water Flow");

//Test case 2 automatically stop the water flow (exceeds the timer limit)
#10 start_dispense =1;
#10 start_dispense =0;

#100 stop_dispense=1;
#10 stop_dispense=0;

$display("Automatically Stop the Water Flow (Time Limit Reached)");
#10 $finish;
end 
//end of test cases
endmodule
