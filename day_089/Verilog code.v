module smart_water_dispenser(
//declaring i/o ports
input clk,              //clock signal for the synchronization
input reset,            //reset signal for the system
input start_dispense,   //start dispense signal for the flow of water
input stop_dispense,    //stop the flow of water manually
output reg [3:0] timer, //timer signal for the flow of water
output reg water_flow,  //signal to indicate the water flow
output reg dispense_active  //show whether the start or stop dispensing state
);

//parameter value for the timer
parameter DISPENSING_TIME = 4'd10;

//logic for the smart water dispensing

always @ (posedge clk or posedge reset) begin 
//if reset signal is high 
if (reset) begin 
timer <= 4'd0;
water_flow <= 1'b0;
dispense_active <= 1'b0;
end 

//if start dispense signal is high
else if (start_dispense) begin 
timer <= DISPENSING_TIME; 
water_flow <= 1'b1;
dispense_active <= 1'b1;
end 

//if dispense active signal is high 
else if (dispense_active) begin 

if (stop_dispense) begin 
water_flow <= 1'b0;
dispense_active <= 1'b0; 
end 

//if timer limit exceeds 
else if (timer > 0) begin 
timer <= timer - 1'b1;
end 

else begin 
water_flow <= 1'b0;
dispense_active <= 1'b0;
end 
end 
end
//end of logic
endmodule
