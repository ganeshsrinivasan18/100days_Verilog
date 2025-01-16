module fire_smoke_detector_tb();
reg clk;
reg reset;
reg smoke_sensor;
reg temp_sensor;
wire alarm;
wire [1:0]hazard_type;

fire_smoke_detector DUT (.clk(clk),
                         .reset(reset),
                         .smoke_sensor(smoke_sensor),
                         .temp_sensor(temp_sensor),
                         .alarm(alarm),
                         .hazard_type(hazard_type));

initial begin 
$dumpfile("fire_smoke_detector.vcd");
$dumpvars(0,fire_smoke_detector_tb);
$monitor("Time: %0t | Smoke Sensor: %b | Temp Sensor: %b | Alarm: %b | Hazard Type: %b",$time,smoke_sensor,temp_sensor,alarm,hazard_type);
end  

initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin 
reset=1;smoke_sensor=0;temp_sensor=0;

#10 reset=0;

//Test case 1: Smoke Detected 
#20 smoke_sensor=1;
#10 smoke_sensor=0;

//Test case 2 : temp detected
#20 temp_sensor=1;
#10 temp_sensor=0;

//Test case 3 : both sensor detected
#20 smoke_sensor=1;temp_sensor=1;

//Test case 4 : both sensor inactive
#20 smoke_sensor=0;temp_sensor=0;

//Test case 5 : Reset is again high
#20 reset=1;
// reset is released
#10 reset=0;

//Test case 6 : both sensor active
#20 smoke_sensor=1;temp_sensor=1;

#20 $finish;
end
//end of simulation
endmodule
