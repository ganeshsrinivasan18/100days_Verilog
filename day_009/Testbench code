module sr_latch_tb;
reg S,R;
wire Q,Qbar;
sr_latch DUT(S,R,Q,Qbar);
initial 
begin

$dumpfile("sr_latch.vcd");
$dumpvars(0,sr_latch_tb);
$monitor($time,"S=%b,R=%b,Q=%b,Qbar=%b",S,R,Q,Qbar);
 S=0;R=0;
#5 S=0;R=1;
#5 S=1;R=0;
#5 S=1;R=1;
#5 $finish;
end 
endmodule
