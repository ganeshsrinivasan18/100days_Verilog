module digital_quiz_buzzer_tb();
reg clk,reset;
reg [3:0]buttons;
wire[3:0]winner; 
digital_quiz_buzzer DUT(.clk(clk),.reset(reset),.buttons(buttons),.winner(winner));

initial begin 
clk = 0;
forever #5 clk=~clk;
end 

initial begin 
$dumpfile("digital_quiz_buzzer.vcd");
$dumpvars(0,digital_quiz_buzzer_tb);
$monitor($time,"clk=%b,reset=%b,buttons=%b,winner=%b",clk,reset,buttons,winner);
end 

initial begin 
//initial state
reset=1;buttons=4'b0000;#10;
reset=0;#10;
//player 1 presses first
buttons = 4'b0001;#10;
buttons = 4'b0000;#10;
//release buttons
reset=1;#10;reset=0;#10;
//player 3 presses first
buttons =4'b0100;#10;
buttons =4'b0000;#10; 
//release buttons
reset=1;#10;reset=0;#10;
//multiple buttons pressed,player 1 has priority
buttons = 4'b1011;#10;
buttons = 4'b0000;#10;

$finish; 
end
endmodule
