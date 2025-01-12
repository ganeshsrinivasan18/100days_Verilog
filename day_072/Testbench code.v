module signal_pattern_detector_tb();
//declaring the i/o ports
parameter [3:0] PATTERN=4'b1011;
reg clk;
reg reset;
reg serial_in;
wire detected;

// declaring the module
signal_pattern_detector DUT(.clk(clk),
                            .reset(reset),
                            .serial_in(serial_in),
                            .detected(detected));
                            
   // declaring the module and testbench                          
initial begin 
$dumpfile("signal_pattern_detector.vcd");
$dumpvars(0,signal_pattern_detector_tb);
$monitor("Time = %0t | serial_in =%b | detected =%b",$time,serial_in,detected);
end 

//declaration for the clock signal
initial begin 
clk=0; 
forever #5 clk=~clk;
end 

initial begin 
//reset is high for initially 
reset=1;serial_in=0; 

//reset is released at 10ns
#10 reset=0; 
//input values 
#10 serial_in=1;   
#10 serial_in=0; 
#10 serial_in=1;
#10 serial_in=1; //pattern detected
#10 serial_in=0;
#10 serial_in=1;
#10 serial_in=1; //pattern detected
#10 serial_in=0;

//random values for input data
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
#10 serial_in=$random();
//end of input values
#50 $finish;  //end of simulation
end                    
endmodule
