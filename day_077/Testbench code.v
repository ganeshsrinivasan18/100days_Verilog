module water_quality_indicator_tb();
//Declaring i/o ports
reg clk;
reg reset;
reg[7:0] ph_value;
reg [7:0] turbidity;
reg [7:0] temp;
reg [7:0] ph_lower;
reg [7:0] ph_upper;
reg [7:0] turbidity_max;
reg [7:0] temp_lower;
reg [7:0] temp_upper;
wire [1:0] water_quality;
wire alert;

//instantiating the module
water_quality_indicator DUT(.clk(clk),
                            .reset(reset),
                            .ph_value(ph_value),
                            .turbidity(turbidity),
                            .temp(temp),
                            .ph_lower(ph_lower),
                            .ph_upper(ph_upper),
                            .turbidity_max(turbidity_max),
                            .temp_lower(temp_lower),
                            .temp_upper(temp_upper),
                            .water_quality(water_quality),
                            .alert(alert));
                            
//instantiating the module and testbench
initial begin
$dumpfile("water_quality_indicator.vcd");
$dumpvars(0,water_quality_indicator_tb);
$monitor("Time: %0t | PH Value: %d | Turbidity: %d | Temp: %d | Water Quality: %b | Alert: %b",$time,ph_value,turbidity,temp,water_quality,alert);
end

//initialising the clk
initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin 
//initialising all the values
ph_value = 8'd7;
turbidity = 8'd50;
temp = 8'd25;
ph_lower = 8'd6;
ph_upper = 8'd8;
turbidity_max = 8'd100;
temp_lower = 8'd20;
temp_upper = 8'd30;
//reset signal is high
reset=1;
//reset signal is reset
#10 reset=0;

//Test case 1: safe water quality
#20;
ph_value = 8'd7;
turbidity = 8'd50;
temp = 8'd25;
#10;


//Test case 2: Unsafe water quality due to PH level
#20;
ph_value = 8'd9;
turbidity = 8'd50;
temp = 8'd25;
#10;


//Test case 3: Unsafe water quality due to turbidity
#20;
ph_value = 8'd7;
turbidity = 8'd150;
temp = 8'd25;
#10;


//Test case 4: Unsafe water quality due to temperature
#20;
ph_value = 8'd7;
turbidity = 8'd50;
temp = 8'd35;
#10;

//Test case 5: safe water quality again
#20;
ph_value = 8'd7;
turbidity = 8'd50;
temp = 8'd25;
#10;

//Test case 6: Unsafe water quality due to low PH value
#20;
ph_value = 8'd5;
turbidity = 8'd50;
temp = 8'd25;
#10;

//Test case 7: Unsafe water quality due to low temperature
#20;
ph_value = 8'd7;
turbidity = 8'd50;
temp = 8'd10;
#10;
$finish;
end
//end of simulation
endmodule
