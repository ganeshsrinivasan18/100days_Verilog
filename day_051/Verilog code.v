module digital_quiz_buzzer(clk,reset,buttons,winner);
input clk,reset;
input [3:0]buttons;
output reg [3:0]winner;
reg latched;

always @(posedge clk or posedge reset) begin 
if(reset)begin 
winner <=4'b0000;
latched <=1'b0; 
end 
else if(!latched)begin 
case(buttons)
4'b0001 : begin 
winner <= 4'b0001;
latched <= 1'b1;
end 

4'b0010 : begin 
winner <= 4'b0010;
latched <= 1'b1;
end 

4'b0100 : begin 
winner <= 4'b0100;
latched <= 1'b1;
end 

4'b1000 : begin 
winner <= 4'b1000; 
latched <= 1'b1;
end 
default : begin 
winner <= 4'b0000; 
end
endcase
end
end
endmodule
