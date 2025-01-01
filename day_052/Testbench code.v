module lfsr_tb();
reg clk,reset;
wire [3:0]lfsr_out;
lfsr DUT(.clk(clk),.reset(reset),.lfsr_out(lfsr_out));

initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin
reset=1;
#10 reset=0;
#150 $finish;
end 

initial begin 
$dumpfile("lfsr.vcd");
$dumpvars(0,lfsr_tb);
$monitor($time,"clk=%b,reset=%b,lfsr_out=%b",clk,reset,lfsr_out);
end
endmodule
