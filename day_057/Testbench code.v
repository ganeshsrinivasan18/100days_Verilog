module barrel_shifter_tb();
parameter WIDTH =8;
reg [WIDTH-1 :0]data_in;
reg [3:0] shift_amt;
reg shift_dir;
wire [WIDTH-1 :0]data_out;
barrel_shifter DUT(.data_in(data_in),.shift_amt(shift_amt),.shift_dir(shift_dir),.data_out(data_out));

initial begin 
$dumpfile("barrel_shifter.vcd");
$dumpvars(0,barrel_shifter_tb);
$monitor($time,"data_in=%b,shift_amt=%b,shift_dir=%b,data_out=%b",data_in,shift_amt,shift_dir,data_out);
end 

initial begin 
//right shift logic
shift_dir=1;shift_amt=4;data_in=8'b10010011;

// left shift logic
#20 shift_dir=0;shift_amt=3;data_in=$random();

//random sequence
#20 shift_dir=$random();shift_amt=$random();data_in=$random();

#20 shift_dir=$random();shift_amt=$random();data_in=$random();

#20 shift_dir=$random();shift_amt=$random();data_in=$random();

#20 shift_dir=$random();shift_amt=$random();data_in=$random();

$finish;
end
endmodule
