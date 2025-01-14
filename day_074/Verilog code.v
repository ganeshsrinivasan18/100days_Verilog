module digital_thermostat_controller(
//declaring i/o ports

input clk,  //clock signal for the synchronization
input reset, //reset signal for the system
input [7:0]current_temp,  //current temp (room temp) signal
input [7:0]set_temp,      // set temp signal for the desired temp 
output reg heating,       // heating signal
output reg cooling        // cooling signal
);


// state declaration
parameter IDLE=2'b00,HEAT=2'b01,COOL=2'b10;
reg [1:0]state;


//reset signal operation
always @(posedge clk or posedge reset) begin 
if(reset)begin 
heating <= 0;
cooling <= 0;
state <= IDLE; 
end 
//FSM operation
else begin 

case(state)

IDLE: begin 
heating <= 0;
cooling <= 0; 
if(current_temp < set_temp - 2)  //-2 buffer for the slight fluctuations in the temperature
state <= HEAT;
else if (current_temp > set_temp + 2) //+2 buffer for the slight fluctuations in the temperature
state <= COOL;
end

HEAT: begin 
heating <= 1;
cooling <= 0;
if(current_temp >= set_temp)
state <= IDLE;
end 

COOL: begin 
heating <= 0;
cooling <= 1;
if(current_temp <= set_temp)
state <= IDLE;
end

default: state <= IDLE;
endcase
end 
end
//end of operation
endmodule
