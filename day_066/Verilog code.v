module simple_timer(clk,reset,start,time_out);
parameter MAX_COUNT =16;
input clk,reset,start;
output reg time_out;

reg [15:0]counter;
reg timer_running;

always @ (posedge clk or posedge reset)begin 
if (reset) begin 
time_out <= 0;
counter <= 0;
timer_running <= 0;
end 
else if (start && !timer_running)begin 
timer_running <= 1;
counter <= 0;
time_out <= 0;
end 
else if (timer_running)begin 
if (counter < MAX_COUNT -1 ) begin
counter <= counter + 1;
time_out <= 0;
end 
else begin 
time_out <= 1;
timer_running <= 0;
end 
end 
end
