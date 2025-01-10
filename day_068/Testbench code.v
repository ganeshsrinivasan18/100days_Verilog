module scramble_descramble_tb();
reg clk,reset,scramble_en,descramble_en;
reg [7:0]data_in;
wire [7:0]data_out;
scramble_descramble DUT(.clk(clk),.reset(reset),.scramble_en(scramble_en),.descramble_en(descramble_en),.data_in(data_in),.data_out(data_out));
initial begin 
$dumpfile("scramble_descramble.vcd");
$dumpvars(0,scramble_descramble_tb);
$monitor($time,"clk=%b,reset=%b,scramble_en=%b,descramble_en=%b,data_in=%b,data_out=%b",clk,reset,scramble_en,descramble_en,data_in,data_out);
end 
initial begin 
clk=0;
forever #5 clk=~clk;
end 

initial begin 
reset=1;data_in=8'b10001101;scramble_en=0;descramble_en=0;
#5 reset=0;
//Test case 1
#10 scramble_en=1;
#40 scramble_en=0;
#10 descramble_en=1;
#40 descramble_en=0;
//Test case 2
#10 data_in=$random();
#10 scramble_en=1;
#40 scramble_en=0;
#10 descramble_en=1;
#40 descramble_en=0;
//Test case 3
#10 data_in=$random();
#10 scramble_en=1;
#40 scramble_en=0;
#10 descramble_en=1;
#40 descramble_en=0;
#20 $finish;

end
endmodule
