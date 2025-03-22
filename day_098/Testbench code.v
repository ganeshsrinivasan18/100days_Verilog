module tb_morphological_operations();

    reg clk, reset;
    reg [7:0] pixel_in;
    reg mode; // 0 = Erosion, 1 = Dilation
    wire [7:0] pixel_out;

    morphological_operations uut (
        .clk(clk),
        .reset(reset),
        .pixel_in(pixel_in),
        .mode(mode),
        .pixel_out(pixel_out)
    );

    always #5 clk = ~clk; // Clock Generation

    initial begin
        $dumpfile("morphological_operations.vcd");
        $dumpvars(0, tb_morphological_operations);
        $display("Time | Mode | Input Pixel | Output Pixel");
        
        clk = 0; reset = 1; pixel_in = 8'h00; mode = 1; // Dilation Mode
        #10 reset = 0;

        // Test Pixels
        #10 pixel_in = 8'h00; 
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h00;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h00;
        #10 pixel_in = 8'h01;
        
        // Change to Erosion Mode
        #10 mode = 0;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h00;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h01;
        #10 pixel_in = 8'h00;
        
        #50 $finish;
    end

    always @(posedge clk) begin
        $display("%4t |  %b   |      %b      |      %b", $time, mode, pixel_in, pixel_out);
    end

endmodule
