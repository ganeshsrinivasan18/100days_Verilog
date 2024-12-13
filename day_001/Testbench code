module full_adder_tb;
reg A,B,C;
full_adder DUT (A,B,C,sum,carry);
initial
begin
$dumpfile("full_adder.vcd");
$dumpvars(0,full_adder_tb);
$monitor($time,"A=%b,B=%b,C=%b",A,B,C,sum,carry);
#5 A=0;B=0;C=0;
#5 A=0;B=0;C=1;
#5 A=0;B=1;C=0;
#5 A=0;B=1;C=1;
#5 A=1;B=0;C=0;
#5 A=1;B=0;C=1;
#5 A=1;B=1;C=0;
#5 A=1;B=1;C=1;
#5$finish;
end
endmodule
