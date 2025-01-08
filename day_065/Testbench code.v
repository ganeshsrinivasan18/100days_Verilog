module misr_tb();
reg clk,reset;
reg [3:0] data_in;
wire [3:0] signature;
misr DUT (.clk(clk),.reset(reset),.data_in(data_in),.signature(signature));
initial begin 
$dumpfile("misr.vcd");
$dumpvars(0,misr_tb);
$monitor($time,"clk=%b,reset=%b,data_in=%b,signature=%b",clk,reset,data_in,signature);
end
initial begin 
clk=0;
forever #5 clk=~clk;
end 
initial begin 
reset=1;data_in=4'b0000;
#15 reset=0;data_in=4'b1001;
#10 data_in=4'b1100;
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 data_in=$random();
#10 $finish;
end
endmodule
