module energy_meter(

//Declaring i/o ports

input [7:0]voltage,         //voltage of the system (8 bits - 256)
input [7:0]current,         //current of the system (8 bits - 256)
input [15:0]threshold,      //threshold value for the energy consumption
input enable,               //enable signal for the energy meter
input reset,                //reset signal after the over_load signal
output reg [15:0]power,     //power of the system P = V * I
output reg over_load,       //overload signal if the power exceeds the threshold
output reg protection       //protection signal for the system if value exceeds
);

//Logic operation for the energy meter

always @ (*) begin 
//Reset signal is high
if (reset) begin 
power = 16'b0;
over_load = 0;
protection = 0;
end 

//if enable signal is high 
else if (enable) begin
power = voltage * current;

if (power > threshold) begin 
over_load = 1;
protection = 1; 
end 

else begin 
over_load = 0;
protection = 0;
end  
end 

else begin 
power = 16'b0;
over_load = 0;
protection =0;
end
end 
//end of logic
endmodule
