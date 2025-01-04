module motion_alarm_system_tb();
reg clk,reset,motion_detected;
wire alarm;
motion_alarm_system DUT(.clk(clk),.reset(reset),.motion_detected(motion_detected),.alarm(alarm));
initial begin 
$dumpfile("motion_alarm_system.vcd");
$dumpvars(0,motion_alarm_system_tb);
$monitor($time,"clk=%b,reset=%b,motion_detected=%b,alarm=%b",clk,reset,motion_detected,alarm);
end
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
reset=1;

#5 reset=0;

#10 motion_detected=1;

#40 motion_detected=1;

#40 motion_detected=0;

#50 $finish;
end
endmodule
