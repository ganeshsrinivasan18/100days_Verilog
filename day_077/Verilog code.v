module water_quality_indicator(
//declaring i/o ports
input clk,                  //clock signal for the synchronization
input reset,                //reset signal for the system
input [7:0]ph_value,        //PH value for the water quality
input [7:0]turbidity,       //Turbidity value for the water
input [7:0]temp,            //Temperature value for the water
input [7:0]ph_lower,        //PH value for the acidic of water
input [7:0]ph_upper,        //PH value for the alkaline of of water
input [7:0]turbidity_max,   //maximum turbidity value
input [7:0]temp_lower,      //least temperature value for the water
input [7:0]temp_upper,      //maximum temperature value
output reg [1:0]water_quality,  //water quality 2'b00:unsafe;2'b01:unsafe due to PH level
                                //2'b10:unsafe due to turbidity;2'b11: unsafe due to temp
output reg alert
);

//logic operation for the reset signal
always @ (posedge clk or posedge reset) begin 
//if reset signal is high
if (reset) begin 
water_quality <= 2'b00;
alert <= 0;
end 
else begin
//logic operation for the water quality

//logic operation for the PH value
if(ph_value < ph_lower || ph_value > ph_upper) begin 
water_quality <= 2'b01;
alert <= 1;
end 

//logic operation for the turbidity quality
else if (turbidity > turbidity_max) begin 
water_quality <= 2'b10;
alert <= 1;
end 

//logic operation for the temperaure quality
else if (temp < temp_lower || temp > temp_upper) begin 
water_quality <= 2'b11;
alert <= 1;
end 

//if none of the condition matches
else begin 
water_quality <= 2'b00;
alert = 0;
end
//end of operation
end
end
endmodule
