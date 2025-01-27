module color_detection(
//Declaring i/o ports 

input clk,                  //clck signal for the synchronization
input reset,                //reset signal for the clearing of inputs
input [7:0] r_in,           //Red color data input
input [7:0] g_in,           //Green color data input
input [7:0] b_in,           //Blue color data input
output reg red_detected,    //RED detected signal
output reg green_detected,  //GREEN detected signal
output reg blue_detected    //BLUE detected signal
);

//Pre-defined values for the RED,GREEN,BLUE
parameter RED_THRESHOLD = 8'd150;
parameter GREEN_THRESHOLD = 8'd150;
parameter BLUE_THRESHOLD = 8'd150;

//Logic operation for the color detection
always @ (posedge clk or posedge reset) begin 
//if reset signal is high (clearing of values)
if(reset) begin 
red_detected <= 0;
green_detected <= 0;
blue_detected <= 0;
end 
//color detection.....
else begin 
//RED color detection
if(r_in >= RED_THRESHOLD && g_in <= 8'd100 && b_in <= 8'd100)begin 
red_detected <= 1;
end 

else begin 
red_detected <= 0;
end

//GREEN color detection
if(r_in <= 8'd100 && g_in >= GREEN_THRESHOLD && b_in <= 8'd100)begin 
green_detected <= 1;
end 

else begin 
green_detected <= 0;
end

//BLUE color detection
if(r_in <= 8'd100 && g_in <= 8'd100 && b_in >= BLUE_THRESHOLD)begin 
blue_detected <= 1;
end 

else begin 
blue_detected <= 0;
end

end 
end

//End of operation
endmodule
