module pwm_generator(
//declaring i/o ports
input clk,  //clock signal for the synchronization
input reset,  //reset signal for the system
input [7:0] duty_cycle, //duty cycle 8 bits(0 to 255)
output reg pwm_out     //pwm out signal
);

//internal signal for the counter
reg [7:0]counter;
// logic for the pwm
always @  (posedge clk or posedge reset) begin 
if (reset) begin 
counter <= 8'd0;
pwm_out <= 0;
end 
//if reset is released 
else begin 
if (counter < duty_cycle) begin 
pwm_out <= 1;
end 
else begin 
pwm_out <= 0;
end 
//increment the counter value
counter <= counter+1;
end 
end
endmodule
