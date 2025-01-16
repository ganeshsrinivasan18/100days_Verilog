module fire_smoke_detector(
//declaring i/o ports
input clk,          //clock signal for the synchronization
input reset,        //reset signal for the system
input smoke_sensor, //smoke sensor for the smoke detection
input temp_sensor,  //temp sensor for the temperature detection
output reg alarm,   //alarm (buzzer) if the sensor signal is high
output reg [1:0]hazard_type //hazard type 2'b00=None; 2'b01=smoke sensor; 2'b10=temp sensor
                            //2'b11=both sensors high
);

// logic for the fire or smoke sensor detection

always @ (posedge clk or posedge reset) begin 
// reset system
if(reset) begin 
alarm <= 0;
hazard_type <= 2'b00;
end 

//logic for the sensor detection
else begin 
//when both sensor are active
if(smoke_sensor && temp_sensor) begin 
alarm <= 1'b1;
hazard_type <= 2'b11;
end
//when smoke sensor alone active
else if(smoke_sensor) begin 
alarm <= 1'b1;
hazard_type <= 2'b01;
end 
//when temp sensor alone active
else if(temp_sensor) begin 
alarm <= 1'b1;
hazard_type <= 2'b10;
end
//when all the sensor are inactive
else begin 
alarm <= 1'b0;
hazard_type <= 2'b00;
end
end 
end
//end of operation
endmodule
