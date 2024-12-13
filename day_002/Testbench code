module carry_lookahead_adder_tb;
reg [3:0]A,B;
reg Cin;
wire [3:0]sum;
wire carry;
carry_lookahead_adder DUT(A,B,Cin,sum,carry);
initial
begin
$dumpfile("carry_lookahead_adder.vcd");
$dumpvars(0,carry_lookahead_adder_tb);
$monitor($time,"A=%b,B=%b,Cin=%b",A,B,Cin,sum,carry);

#10
A=4'b0000;
B=4'b0001;
Cin=1'b0;

#10
A=4'b0010;
B=4'b0011;
Cin=1'b1;

#10
A=4'b0100;
B=4'b0101;
Cin=1'b0;

#10
A=4'b0110;
B=4'b0111;
Cin=1'b1;

#10
A=4'b1000;
B=4'b1001;
Cin=1'b0;

#10
A=4'b1010;
B=4'b1011;
Cin=1'b1;

#10
A=4'b1100;
B=4'b1101;
Cin=1'b0;

#10
A=4'b1110;
B=4'b1111;
Cin=1'b1;

#15$finish;
end
