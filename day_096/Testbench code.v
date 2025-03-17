
module fir_filter_tb;
    reg clk;
    reg reset;
    reg signed [7:0] data_in;
    wire signed [15:0] data_out;

    // Instantiate the FIR filter module
    fir_filter uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        data_in = 0;
        
        // Apply Reset
        #10 reset = 0;
        
        // Apply test samples
        #10 data_in = 8'd10;   // First input sample
        #10 data_in = 8'd20;   // Second input sample
        #10 data_in = 8'd30;   // Third input sample
        #10 data_in = 8'd40;   // Fourth input sample
        #10 data_in = 8'd50;   // Fifth input sample
        #10 data_in = 8'd60;   // Sixth input sample
        #10 data_in = 8'd70;   // Seventh input sample
        #10 data_in = 8'd80;   // Eighth input sample
        
        #50 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | Input = %d | Output = %d", $time, data_in, data_out);
    end
endmodule
