module digital_coin_counter_tb();
//declaring i/o ports
reg clk;
reg reset;
reg [1:0]coin_type;
reg coin_insert;
wire [15:0]total_value;
wire [7:0]one_rupee_count;
wire [7:0]two_rupee_count;
wire [7:0]five_rupee_count;
wire [7:0]ten_rupee_count;

//instantiating the module
digital_coin_counter DUT(.clk(clk),
                         .reset(reset),
                         .coin_type(coin_type),
                         .coin_insert(coin_insert),
                         .total_value(total_value),
                         .one_rupee_count(one_rupee_count),
                         .two_rupee_count(two_rupee_count),
                         .five_rupee_count(five_rupee_count),
                         .ten_rupee_count(ten_rupee_count));
                         
//instatiating the module and the testbench
initial begin 
$dumpfile("digital_coin_counter.vcd");
$dumpvars(0,digital_coin_counter_tb);
$monitor("Time: %0t | Coin Type: %b | 1₹ Coins: %d | 2₹ Coins: %d | 5₹ Coins: %d | 10₹ Coins: %d | Total Value: %d",$time,coin_type,one_rupee_count,two_rupee_count,five_rupee_count,ten_rupee_count,total_value);
end 

//initializing the clock
initial begin 
clk=0;
forever #5 clk = ~ clk;
end

//initializing the values
initial begin 
//reset is high and initial values are set
reset=1;coin_insert=0;coin_type=2'b00;
//reset is released
#15 reset=0;

//Test case for the inserting various coin(1,2,5,10)

//inserting 1₹ coin
#10 coin_insert=1; coin_type=2'b00;

#10 coin_insert=0;

//inserting 2₹ coin
#10 coin_insert=1; coin_type=2'b01;

#10 coin_insert=0;

//inserting 5₹ coin
#10 coin_insert=1; coin_type=2'b10;

#10 coin_insert=0;

//inserting 10₹ coin
#10 coin_insert=1; coin_type=2'b11;

#10 coin_insert=0;

//again inserting various coins
//inserting coins in different orders 
#10 coin_insert=1; coin_type=2'b00;

#10 coin_insert=0;


#10 coin_insert=1; coin_type=2'b10;

#10 coin_insert=0;

#10 coin_insert=1; coin_type=2'b11;

#10 coin_insert=0;

#10 coin_insert=1; coin_type=2'b01;

#10 coin_insert=0;

#10 coin_insert=1; coin_type=2'b00;

#10 coin_insert=0;

#10 $finish;
end
//end of simulation
endmodule
