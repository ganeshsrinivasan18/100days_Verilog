module queue_management_system_tb();
//declaring the i/o ports
reg clk;
reg reset;
reg next;
reg [2:0]counter_select;
wire [2:0] counter_display;
wire [7:0] customer_number_display;

//instantiating the module

queue_management_system DUT(.clk(clk),
                            .reset(reset),
                            .next(next),
                            .counter_select(counter_select),
                            .counter_display(counter_display),
                            .customer_number_display(customer_number_display));
                            
                            
//declaring the verilog code and testbench for the simulation                            
                            
initial begin 
$dumpfile("queue_management_system.vcd");
$dumpvars(0,queue_management_system);
$monitor("Time: %0t | Counter: %d | Serving Customer: %d",$time,counter_display,customer_number_display);
end                 

//initialising the clock signal

initial begin 
clk=0;
forever #5 clk=~clk;
end

//initialising the next and counter value

initial begin 
next=0;
counter_select=3'b000;
end     

//initialising the reset and applying inputs 

initial begin 
reset=1;
#10 reset=0;  //reset is released

//Test case 1: Next is high so customer and counter are incremented
next=1;
#10;
next=0;
#10;

//Test case 2: selecting the counter and next
counter_select = 3'b001;
next=1;
#10;
next=0;
#10; 

//Test case 3: selecting the counter and next
counter_select = 3'b010;
next=1;
#10;
next=0;
#10;

//Test case 4: selecting the counter and next
counter_select = 3'b011;
next=1;
#10;
next=0;
#10;

//Test case 5: selecting the counter and next
counter_select = 3'b100;
next=1;
#10;
next=0;
#10;

//Test case 6: selecting the counter and next
counter_select = 3'b101;
next=1;
#10;
next=0;
#10;

//Test case 7: selecting the counter and next
counter_select = 3'b110;
next=1;
#10;
next=0;
#10;

//Test case 8: selecting the counter and next
counter_select = 3'b111;
next=1;
#10;
next=0;
#10;

//end of simulation
$finish;
end     
endmodule
