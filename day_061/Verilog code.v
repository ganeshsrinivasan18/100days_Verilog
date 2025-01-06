module rotating_led(clk,reset,led);
input clk,reset;
output reg [7:0]led;

reg[2:0]counter;
reg[7:0]led_pattern;

always @ (posedge clk or posedge reset)begin 
if(reset)begin
counter <= 3'b000;
led_pattern <= 8'b00000001;
end 

else begin 
led_pattern <={led_pattern[6:0],led_pattern[7]};
counter <= counter+1;
end 
end 
always @ (posedge clk)begin
led <= led_pattern; 
end
