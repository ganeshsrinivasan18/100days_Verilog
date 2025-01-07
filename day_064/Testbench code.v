module lottery_system_tb();
reg clk,reset,start;
wire [3:0]winner;
lottery_system DUT (.clk(clk),.reset(reset),.start(start),.winner(winner));
initial begin 
$dumpfile("lottery_system.vcd");
$dumpvars(0,lottery_system_tb);
$monitor($time,"clk=%b,reset=%b,winner=%b,start=%b",clk,reset,winner,start);
end 
initial begin 
clk=0;
forever #5 clk=~clk;
end
initial begin 
reset=1;
#5 reset=0;
#10 start=1;
#40 start=0;
#10 start=1;
#40 start=0;
#20 $finish;
end
endmodule
