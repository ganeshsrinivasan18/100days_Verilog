module digi_pot(
//declaring i/o ports

input clk,                  //clock signal for the synchronization
input reset,               //reset signal for the system
input load,                //load for the predefined values
input inc,                  //increment the resistance values
input dec,                  //decrement the resistance values
input [7:0]resistance_in,   //reistance value from the user 
output reg [7:0]resistance_out  //resistance value to be set 
);

//paramters for the MAX and MIN values of the resistor
parameter MAX_RESISTANCE = 8'd255;
parameter MIN_RESISTANCE = 8'd0;

//logic for digital potentiometer
always @ (posedge clk or posedge reset) begin 

//logic for the reset signal
if (reset) 
resistance_out <= 8'd128;

//if load signal is high
else if (load)
resistance_out <= resistance_in;

else if (inc && resistance_out < MAX_RESISTANCE)
resistance_out <= resistance_out + 1;

else if (dec && resistance_out > MIN_RESISTANCE)
resistance_out <= resistance_out - 1;
end
//end of logic
endmodule
