module digital_coin_counter(
//Declaring i/o ports
input clk,                      //clock signal for the system
input reset,                    //reset signal for the clearing of values
input[1:0]coin_type,            //coin type 2'b00=₹1; 2'b01=₹2; 2'b10=₹5; 2'b11=₹10
input coin_insert,              //coin insert is high while inserting the coin
output reg [15:0]total_value,   //total value for the coin inserted
output reg [7:0]one_rupee_count,  //one rupee coin inserted
output reg [7:0]two_rupee_count,  //two rupee coin inserted 
output reg [7:0]five_rupee_count, //five rupee coin inserted
output reg [7:0]ten_rupee_count   //ten rupee coin inserted
);

//logic for the coin counting machine
always @ (posedge clk or posedge reset) begin 
//logic for the reset signal
if (reset) begin 
one_rupee_count <= 0;
two_rupee_count <= 0;
five_rupee_count <= 0;
ten_rupee_count <= 0;
total_value <= 0;
end 
//logic for the coin counter
else begin 
//case statement for the coin type
case(coin_type)

//one rupee coin logic
2'b00: begin 
if(coin_insert)begin 
one_rupee_count <= one_rupee_count + 1;
total_value <= total_value + 1;
end
end

//two rupee coin logic
2'b01: begin 
if(coin_insert)begin 
two_rupee_count <= two_rupee_count + 1;
total_value <= total_value + 2;
end 
end 

//five rupee coin logic
2'b10: begin 
if(coin_insert)begin 
five_rupee_count <= five_rupee_count + 1;
total_value <= total_value + 5;
end 
end 

//ten rupee coin logic
2'b11: begin 
if(coin_insert)begin 
ten_rupee_count <= ten_rupee_count + 1;
total_value <= total_value + 10;
end 
end 
endcase

end 
end
endmodule
