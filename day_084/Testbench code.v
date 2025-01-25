module gesture_control_system_tb();
//Declaration of i/o ports
reg [3:0]gesture;
reg enable;
reg reset;
wire [3:0]action;
wire ack;

//instantiating the module
gesture_control_system DUT(.gesture(gesture),
                           .enable(enable),
                           .reset(reset),
                           .action(action),
                           .ack(ack));


//instantiating the module and the testbench
initial begin 
$dumpfile("gesture_control_system.vcd");
$dumpvars(0,gesture_control_system_tb);
end

//Test case for the gesture control system
initial begin 
$display("Gesture control system simulation....");

//Test case 1: Turn on the device
gesture = 4'b0000 ; enable = 1 ; reset = 0;
#10;
$display("Test case 1 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 2: Turn off the device
gesture = 4'b0001 ; enable = 1 ; reset = 0;
#10;
$display("Test case 2 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 3: inrease intensity
gesture = 4'b0010 ; enable = 1 ; reset = 0;
#10;
$display("Test case 3 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 4: Decrease intensity
gesture = 4'b0011 ; enable = 1 ; reset = 0;
#10;
$display("Test case 4 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 5: play action
gesture = 4'b0100 ; enable = 1 ; reset = 0;
#10;
$display("Test case 5 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 6: Pause action
gesture = 4'b0101 ; enable = 1 ; reset = 0;
#10;
$display("Test case 6 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 7: Invalid gesture
gesture = 4'b1111 ; enable = 1 ; reset = 0;
#10;
$display("Test case 7 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 8: Reset the system
reset=1;
#10;
$display("Test case 8 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);
reset=0;


//Test case 9: Again turn on gesture
gesture = 4'b0000 ; enable = 1 ; reset = 0;
#10;
$display("Test case 9 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);


//Test case 10: No gesture detected
gesture = 4'b0000 ; enable = 0 ; reset = 0;
#10;
$display("Test case 10 - Gesture: %b | Action: %b | Ack: %b",gesture,action,ack);

$finish;
end
//end of operation
endmodule
