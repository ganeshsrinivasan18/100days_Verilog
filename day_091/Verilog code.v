module intercom_system(
//Declaring i/o ports
input clk,          //clock system for the synchronization
input reset,        //reset system to clear the values
input ptt_1,        //push-to-talk button for station 1
input ptt_2,        //push-to-talk button for station 2
input [7:0] audio_in_1, //audio input from station 1
input [7:0] audio_in_2, //audio input from station 2
output reg [7:0] audio_out_1,  //audio output at station 1
output reg [7:0] audio_out_2   //audio output at station 2
);

//logic for the intercom system 

//logic for the reset system
always @ (posedge clk or posedge reset) begin 
if (reset) begin 
audio_out_1 <= 8'd0;
audio_out_2 <= 8'd0;
end 

//if reset is released
else begin 
//if push-to-talk button 1 high
if (ptt_1) begin 
//station 1 is speaking and station 2 receives
audio_out_1 <= 8'd0;
audio_out_2 <= audio_in_1;
end 

//if push-to-talk button 2 is high if
else if (ptt_2) begin 
//station 2 speaking and station 1 receives
audio_out_1 <= audio_in_2;
audio_out_2 <= 8'd0;
end

//if no communication between station 1 and station 2
else begin 
audio_out_1 <= 8'd0;
audio_out_2 <= 8'd0;
end
end
end
endmodule
