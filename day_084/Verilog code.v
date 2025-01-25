module gesture_control_system(
//Declaration of i/o ports

input [3:0]gesture,         //gesture input 4-bit input
input enable,               //enable signal for the gesture 
input reset,                //reset signal for the system
output reg [3:0]action,     //action based on the gesture input
output reg ack              //acknowledgement signal
);

//logic for the gesture operation
always @ (*) begin 
if (reset) begin 
action = 4'b0000;
ack = 0;
end 
//if enable signal is high
else if (enable) begin 
case (gesture) 
//case statements for the multiple sinals

4'b0000: action = 4'b0001;//Turn on
4'b0001: action = 4'b0010;//Turn off
4'b0010: action = 4'b0011;//increase intensity
4'b0011: action = 4'b0100;//decrease intensity
4'b0100: action = 4'b0101;//play
4'b0101: action = 4'b0110;//pause
//default statements
default: action = 4'b0000; 
endcase 
//Gesture recognized by the acknowledgement signal
ack = 1;
end 

else begin 
//if enable signal is low
action = 4'b0000;
ack = 0;
end 
end
//end of operation
endmodule
