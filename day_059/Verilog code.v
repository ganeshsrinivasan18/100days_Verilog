module challenge_response_authenticator(clk,reset,challenge,response,authenticated);
input clk;      //clock signal
input reset;    //reset signal
input [3:0]challenge;   //4 bit random challenge produced by the server
input [3:0]response;    //4 bit response by the user or client
output reg authenticated;  // authenticated if logic is true
reg [3:0]secret_key;        // 4bit secret key pre-shared for the user

//authetication logic
always @ (posedge clk or posedge reset)begin

if (reset)begin       //reset the system
secret_key <= 4'b1100; //4 bit secret key shared to the user
authenticated <= 0;
end

else if((challenge ^ secret_key) == response)begin 
authenticated <= 1;  // if the XOR of challenge and secret key is equal to response
end 
else begin 
authenticated <= 0; //if the condition fails authenticated is zero
end
end
endmodule
