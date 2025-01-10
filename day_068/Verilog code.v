module scramble_descramble(clk,reset,scramble_en,descramble_en,data_in,data_out);
input clk; //clock signal
input reset; //Reset sysytem
input scramble_en;  //scramble signal triggering
input descramble_en; //descramble signal triggering
input [7:0]data_in;  // input data for 8 bits
output reg [7:0] data_out; //output data after the operation 8bits

//internal wire for scrambling and descrambling
reg [7:0] key =8'b11001101;

//logic operation for scrambling/descrambling

always @ (posedge clk or posedge reset)begin 

//reset signal high

if(reset)begin
data_out <= 8'b0; 
end 

// scrambling operation

else if (scramble_en)begin 
data_out <= data_in ^ key;
end 

// descrambling operation

else if (descramble_en)begin 
data_out <= data_in ^ key;
end  
end
