module intercom_system_tb();
//declaring i/o ports
reg clk;
reg reset;
reg ptt_1;
reg ptt_2;
reg [7:0] audio_in_1,audio_in_2;
wire [7:0] audio_out_1,audio_out_2;

//instantiate the module
intercom_system DUT (.clk(clk),
                     .reset(reset),
                     .ptt_1(ptt_1),
                     .ptt_2(ptt_2),
                     .audio_in_1(audio_in_1),
                     .audio_in_2(audio_in_2),
                     .audio_out_1(audio_out_1),
                     .audio_out_2(audio_out_2));
                     

//instantiating the module and testbench
initial begin 
$dumpfile("intercom_system.vcd");
$dumpvars(0,intercom_system_tb);
end

//clock generation
initial begin 
clk=0;
forever #5 clk = ~clk;
end

//Test cases 

initial begin 

//if reset is high 
reset = 1;
ptt_1 = 0;
ptt_2 = 0;
audio_in_1 = 8'h00;
audio_in_2 = 8'h00;

//if reset is releases
#15 reset = 0;

$display("Test cases for the InterComm System....");

//Test case 1: Station 1 speaks, Station 2 receives
#20 ptt_1 = 1; audio_in_1 =8'hA5;
#40 ptt_1 = 0;
$display("Test case 1: Station 1 Speaking | Audio Out  = %h",audio_out_2);


//Test case 2: Station 2 speaks, Station 1 receives
#20 ptt_2 = 1; audio_in_2 =8'hC2;
#40 ptt_2 = 0;
$display("Test case 2: Station 2 Speaking | Audio Out  = %h",audio_out_1);

//Test case 3: Both the station press the button
#20 ptt_2 = 1; ptt_1 = 1;  audio_in_1 =8'hB2; audio_in_2 = 8'hCA;
#40 ptt_2 = 0; ptt_1 = 0;
$display("Test case 3: Both PTT ON | Audio Out 1  = %h | Audio out 2 = %h ",audio_out_1,audio_out_2);


//Test case 4: No one is speaking
#20 ptt_1 = 0; ptt_2 = 0;
#40;
$display("Test case 4: No Communication | Audio Out 1  = %h | Audio out 2 = %h ",audio_out_1,audio_out_2);


//Test case 5: Station 1 speaks, Station 2 receives
#20 ptt_1 = 1; audio_in_1 =8'hD6;
#40 ptt_1 = 0;
$display("Test case 5: Station 1 Speaking | Audio Out  = %h",audio_out_2);


//Test case 6: Station 2 speaks, Station 1 receives
#20 ptt_2 = 1; audio_in_2 =8'hE2;
#40 ptt_2 = 0;
$display("Test case 6: Station 2 Speaking | Audio Out  = %h",audio_out_1);

//Test case 7: Station 1 speaks, Station 2 receives
#20 ptt_1 = 1; audio_in_1 =8'hB4;
#40 ptt_1 = 0;
$display("Test case 7: Station 1 Speaking | Audio Out  = %h",audio_out_2);


#20 $finish; 
end
//end of simulation
endmodule
