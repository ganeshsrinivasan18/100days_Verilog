module vga_tb;
    reg clk;
    reg rst;
    wire hsync, vsync, video_on;
    wire [9:0] x, y;

    // Instantiate the VGA controller module
    vga_controller uut (
        .clk(clk), 
        .rst(rst), 
        .hsync(hsync), 
        .vsync(vsync), 
        .x(x), 
        .y(y), 
        .video_on(video_on)
    );

    // Clock generation: 50 MHz clock with 10 ns period
    always #10 clk = ~clk;  

    initial begin
        // Initialize values
        clk = 0;
        rst = 1;
        
        // Display initial message
        $display("Starting VGA Testbench...");
        #20 rst = 0; // Release reset after 20 time units

        // Monitor critical signals
        $monitor("Time: %0t | x: %d y: %d | hsync: %b vsync: %b | video_on: %b", 
                 $time, x, y, hsync, vsync, video_on);

        // Run simulation for a limited time
        #50000 $display("Simulation completed.");
        $finish;
    end
endmodule
