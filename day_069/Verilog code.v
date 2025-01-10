module threshold_indicator(clk,reset,data_in,threshold,hysteresis,threshold_exceeded);
input clk;
input reset; 
input [7:0]data_in;
input [7:0]threshold;
input [7:0]hysteresis;
output reg threshold_exceeded;

reg threshold_active;

always @ (posedge clk or posedge reset)begin 
if (reset)begin 
threshold_exceeded <= 0;
threshold_active <= 0;
end
else if (!threshold_active && (data_in > threshold))begin 
threshold_exceeded <= 1;
threshold_active <= 1;
end 
else if (threshold_active && data_in < (threshold - hysteresis))begin 
threshold_exceeded <= 0;
threshold_active <= 0; 
end 
end
endmodule
