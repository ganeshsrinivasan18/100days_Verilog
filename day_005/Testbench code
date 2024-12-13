module encoder_8to3_tb;
reg A7,A6,A5,A4,A3,A2,A1,A0;
wire B,C,D;
encoder_8to3 DUT(A7,A6,A5,A4,A3,A2,A1,A0,B,C,D);
initial 
begin 
$dumpfile("encoder_8to3.vcd");
$dumpvars(0,encoder_8to3_tb);
$monitor($time,"A7=%b,A6=%b,A5=%b,A4=%b,A3=%b,A2=%b,A1=%b,A0=%b,B=%b,C=%b,D=%b",A7,A6,A5,A4,A3,A2,A1,A0,B,C,D);

#5 A7=0;A6=0;A5=0;A4=0;A3=0;A2=0;A1=0;A0=1;
#5 A7=0;A6=0;A5=0;A4=0;A3=0;A2=0;A1=1;A0=0;
#5 A7=0;A6=0;A5=0;A4=0;A3=0;A2=1;A1=0;A0=0;
#5 A7=0;A6=0;A5=0;A4=0;A3=1;A2=0;A1=0;A0=0;
#5 A7=0;A6=0;A5=0;A4=1;A3=0;A2=0;A1=0;A0=0;
#5 A7=0;A6=0;A5=1;A4=0;A3=0;A2=0;A1=0;A0=0;
#5 A7=0;A6=1;A5=0;A4=0;A3=0;A2=0;A1=0;A0=0;
#5 A7=1;A6=0;A5=0;A4=0;A3=0;A2=0;A1=0;A0=0;
end
endmodule
