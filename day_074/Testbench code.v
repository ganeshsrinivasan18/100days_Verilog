module digital_thermostat_controller_tb();
//declaring the i/o ports
reg clk;
reg reset;
reg [7:0]current_temp;
reg [7:0]set_temp;
wire heating;
wire cooling;

//instantiating the module
digital_thermostat_controller DUT(.clk(clk),
                                  .reset(reset),
                                  .current_temp(current_temp),
                                  .set_temp(set_temp),
                                  .heating(heating),
                                  .cooling(cooling));

//instatiating the module and testbench
initial begin 
$dumpfile("digital_thermostat_controller.vcd");
$dumpvars(0,digital_thermostat_controller_tb);
$monitor("Time: %0t | Current Temp: %d | Set Temp: %d | Heating: %b | Cooling: %b",$time,current_temp,set_temp,heating,cooling);
end

//initialising the clock
initial begin 
clk=0;
forever #5 clk=~clk;
end

//initialising the temperature
initial begin 
current_temp = 8'd20;
set_temp = 8'd25;
end

////initialising the reset
initial begin 
//reset is high
reset=1;
//reset is released
#10 reset = 0;

//Test heating scenario
current_temp = 8'd20;#20;

current_temp = 8'd25;#20;


//Test cooling Scenario
set_temp = 8'd18;

current_temp = 8'd22;#20;

current_temp = 8'd18;#20;


//Test Heating Scenario
set_temp = 8'd20;

current_temp = 8'd15;#20;

current_temp = 8'd15;#20;


//Test cooling Scenario
set_temp = 8'd20;

current_temp = 8'd25;#20;

current_temp = 8'd25;#20;

$finish;
//end of test cases
end
endmodule
