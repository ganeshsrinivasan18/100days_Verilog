module t_ff_tb();
reg t,clk=0;
wire q,qbar;
t_ff DUT(t,clk,q,qbar);
always #5 clk=~clk;
initial      
begin  
$dumpfile("t_ff.vcd");
$dumpvars(0,t_ff_tb);
$monitor($time,"t=%b,q=%b,qbar=%b",t,q,qbar);

#10 t=0;
#10 t=1;
#10 t=1;
#5  t=0;
#2  t=0;

#50 $finish;
end
endmodule
