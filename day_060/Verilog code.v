module digital_dice_simulator(clk,reset,roll,dice_value);
input clk;   //clock input
input reset;  // reset function
input roll;   //roll input for the the dice
output reg [2:0]dice_value;  //dice value(0 to 6) so 3 bit is taken
reg [3:0]lfsr;    //lfsr to generate the random sequence

//lfsr logic
always @ (posedge clk or posedge reset)begin
if(reset)begin 
lfsr <= 4'b1001; //assign lfsr to a non-zero value
end 
else begin 
lfsr <= {lfsr[2:0] , (lfsr[3] ^ lfsr[2])}; //lfsr operation for a 4 bit
end 
end

//dice roll logic 
always @ (posedge clk or posedge reset)begin 
if (reset) begin 
dice_value <= 3'b001; //initially dice to 1
end 
else if (roll) begin 
dice_value <= (lfsr % 6) + 1;  //generating dice value 1 to 6
end 
end
endmodule
