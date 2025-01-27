module color_detection_tb();
//Declaring i/o ports
reg clk;
reg reset;
reg [7:0] r_in;
reg [7:0] g_in;
reg [7:0] b_in;
wire red_detected;
wire blue_detected;
wire green_detected;

//instantiating module
color_detection DUT (.clk(clk),
                     .reset(reset),
                     .r_in(r_in),
                     .g_in(g_in),
                     .b_in(b_in),
                     .red_detected(red_detected),
                     .blue_detected(blue_detected),
                     .green_detected(green_detected));
                     
                     
//instantiating the module and the testbench
initial begin 
$dumpfile("color_detection.vcd");
$dumpvars(0,color_detection_tb);
end

//initialising the clock
initial begin 
clk=0;
forever #5 clk = ~clk;
end


//declaring the initial values
initial begin 
//reset is high
reset = 1;
r_in = 8'd0;
g_in = 8'd0;
b_in = 8'd0; 
//reset is released
#15 reset = 0; 

//Various test cases for the color detection

$display("Color Detection for Various Colors....");

//Test case 1 : RED detection
 r_in = 8'd160; b_in = 8'd40; g_in = 8'd40;
#10;
if(red_detected == 1 && green_detected == 0 && blue_detected == 0)
$display("Test case 1 : Passed - Red Detected Correctly");
else 
$display("Test case 1 : Failed - Red Detected Incorrectly");



//Test case 2 : GREEN detection
 r_in = 8'd50; b_in = 8'd40; g_in = 8'd160;
#10;
if(red_detected == 0 && green_detected == 1 && blue_detected == 0)
$display("Test case 2 : Passed - Green Detected Correctly");
else 
$display("Test case 2 : Failed - Green Detected Incorrectly");



//Test case 3 : BLUE detection
 r_in = 8'd50; b_in = 8'd180; g_in = 8'd40;
#10;
if(red_detected == 0 && green_detected == 0 && blue_detected == 1)
$display("Test case 3 : Passed - Blue Detected Correctly");
else 
$display("Test case 3 : Failed - Blue Detected Incorrectly");



//Test case 4 : No color detection
 r_in = 8'd100; b_in = 8'd100; g_in = 8'd100;
#10;
if(red_detected == 0 && green_detected == 0 && blue_detected == 0)
$display("Test case 4 : Passed - No Color Detected Successfully");
else 
$display("Test case 4 : Failed - No Color Detected Unsuccessfully");



//Test case 5 : Green detection
 r_in = 8'd100; b_in = 8'd100; g_in = 8'd170;
#10;
if(red_detected == 0 && green_detected == 1 && blue_detected == 0)
$display("Test case 5 : Passed - Green Detected Correctly");
else 
$display("Test case 5 : Failed - Green Detected Incorrectly");



//Test case 6 : Mixed color
 r_in = 8'd160; b_in = 8'd160; g_in = 8'd100;
#10;
if(red_detected == 0 && green_detected == 0 && blue_detected == 0)
$display("Test case 6 : Passed - No Color Detected Successfully(Mixed colors)");
else 
$display("Test case 6 : Failed - No Color Detected Unsuccessfully(Mixed colors");


//Test case 7 : RED detection
 r_in = 8'd200; b_in = 8'd40; g_in = 8'd40;
#10;
if(red_detected == 1 && green_detected == 0 && blue_detected == 0)
$display("Test case 7 : Passed - Red Detected Correctly");
else 
$display("Test case 7 : Failed - Red Detected Incorrectly");



//Test case 8 : GREEN detection
 r_in = 8'd50; b_in = 8'd40; g_in = 8'd160;
#10;
if(red_detected == 0 && green_detected == 1 && blue_detected == 0)
$display("Test case 8 : Passed - Green Detected Correctly");
else 
$display("Test case 8 : Failed - Green Detected Incorrectly");



//Test case 9 : BLUE detection
 r_in = 8'd50; b_in = 8'd180; g_in = 8'd40;
#10;
if(red_detected == 0 && green_detected == 0 && blue_detected == 1)
$display("Test case 9 : Passed - Blue Detected Correctly");
else 
$display("Test case 9 : Failed - Blue Detected Incorrectly");



//Test case 10 : No color detection
 r_in = 8'd100; b_in = 8'd100; g_in = 8'd100;
#10;
if(red_detected == 0 && green_detected == 0 && blue_detected == 0)
$display("Test case 10 : Passed - No Color Detected Successfully");
else 
$display("Test case 10 : Failed - No Color Detected Unsuccessfully");


#10 $finish;
end

//End of test cases
endmodule
