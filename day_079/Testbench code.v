module digital_ticketing_system_tb();
//declaring i/o ports
reg clk;
reg reset;
reg purchase_vip;
reg purchase_regular;
reg purchase_student;
reg purchase_senior;
wire [7:0]available_vip;
wire [7:0]available_regular;
wire [7:0]available_student;
wire [7:0]available_senior;
wire purchase_success;
wire purchase_failed;

//instantiating the module
digital_ticketing_system DUT (.clk(clk),
                              .reset(reset),
                              .purchase_vip(purchase_vip),
                              .purchase_regular(purchase_regular),
                              .purchase_student(purchase_student),
                              .purchase_senior(purchase_senior),
                              .available_vip(available_vip),
                              .available_regular(available_regular),
                              .available_student(available_student),
                              .available_senior(available_senior),
                              .purchase_success(purchase_success),
                              .purchase_failed(purchase_failed));
                              
//initialising the clock signal
initial begin 
clk=0;
forever #5 clk=~clk; 
end 
//initialising the value
initial begin 
//reset signal is high
reset=1;purchase_vip=0;purchase_regular=0;
purchase_student=0;purchase_senior=0;

//reset signal is high
#10 reset=0;

//test cases for the ticket booking , various test scenarios
//also included the test cases for purchasing the ticket even ticket is unavailable
repeat (33) begin 
#10 purchase_vip = 1;
#10 purchase_vip = 0;



#10 purchase_regular = 1; 
#10 purchase_regular = 0; 



#10 purchase_student = 1;
#10 purchase_student = 0;



#10 purchase_senior = 1;
#10 purchase_senior = 0;
 
end
$finish;
//end of test cases
end

//instatiating the module and the testbench
initial begin 
$dumpfile("digital_ticketing_system.vcd");
$dumpvars(0,digital_ticketing_system_tb);
$monitor("Time: %0t | VIP Tickets: %0d | Regular Tickets: %0d | Student Tickets: %0d | Senior Tickets: %0d | Purchase Success: %b | Purchase Failed: %b",$time,available_vip,available_regular,available_student,available_senior,purchase_success,purchase_failed);
end
endmodule
