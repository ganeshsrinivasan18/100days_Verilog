
module voltage_monitoring_system(clk,reset,adc_value,over_voltage,under_voltage,within_range);
//declaring the parameters
parameter ADC_WIDTH = 12;  //analog to digital value
parameter UPPER_THRESHOLD = 3000; //maximum value for the voltage
parameter LOWER_THRESHOLD = 1000; //minimum value for the voltage

input clk;   // clock signal for the synchronization
input reset;  //reset signal for the system
input [ADC_WIDTH-1 : 0]adc_value;  //input adc value
output reg over_voltage;   //high if the voltage exceeds the upper threshold value
output reg under_voltage;   //high if the voltage below the lower threshold value
output reg within_range;     //high if the voltage within the limit

//logical operation

always @ (posedge clk or posedge reset)begin 

if (reset)begin 
    // reset the values
    over_voltage <= 0;
    under_voltage <= 0;
    within_range <= 0;
end 

else if (adc_value > UPPER_THRESHOLD) begin 
//crosses the upper threshold value
    over_voltage <= 1;
    under_voltage <= 0;
    within_range <= 0;
end 

else if (adc_value < LOWER_THRESHOLD)begin 
//below the lower threshold value
    over_voltage <= 0;
    under_voltage <= 1;
    within_range <= 0;
end 

else begin 
//voltage within the limit
over_voltage <= 0;
under_voltage <= 0;
within_range <= 1;
end 
end
endmodule
