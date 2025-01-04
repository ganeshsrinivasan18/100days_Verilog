module motion_alarm_system(motion_detected,clk,reset,alarm);
input motion_detected,clk,reset;
output reg alarm;
reg [3:0]timer;
reg motion_flag;
// motion alarm logic 
always @(posedge clk,posedge reset)begin 
//reset 
if (reset) begin 
alarm <=0;
timer <=0;
motion_flag <=0;
end

//when motion is detected

else if(motion_detected && !motion_flag)begin 
motion_flag<= 1;
alarm <= 1;
timer <= 10;
end 

// when motion flag is high

else if(motion_flag)begin 
if(timer > 0)begin 
timer <= timer-1;
end 

//reset the system

else begin 
alarm <= 0;
motion_flag <= 0;
end 
end 
end
endmodule
