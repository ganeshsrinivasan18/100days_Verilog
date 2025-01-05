module challenge_response_authenticated_tb();
reg clk;
reg reset;
reg [3:0]challenge;
reg [3:0]response;
wire authenticated;
challenge_response_authenticator DUT(.clk(clk),.reset(reset),.challenge(challenge),.response(response),.authenticated(authenticated));

initial begin
$dumpfile("challenge_response_authenticator.vcd");
$dumpvars(0,challenge_response_authenticated_tb);
$monitor($time,"clk=%b,reset=%b,challenge=%b,response=%b,authenticated=%b",clk,reset,challenge,response,authenticated);
end

initial begin 
clk=0;reset=1;
forever #5 clk = ~clk;
end

initial begin 
#5 reset=0;
//test1:authenticated is successfull
#10 challenge=4'b1010;response=4'b0110;


//test2:authentication is failed
#10 challenge=4'b1100;response=4'b1001;


// test3 random sequence
#10 challenge=$random();response=$random();


#10 challenge=$random();response=$random();


#10 challenge=$random();response=$random();

//test4 successfull authentication
#10 challenge = 4'b1110;response=4'b0010;

#20 $finish;
end                       
endmodule
