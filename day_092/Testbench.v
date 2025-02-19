module tb_fifo;

    // Testbench signals
    reg clk;
    reg reset;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;

    // FIFO instance
    fifo #(
        .DEPTH(8),    // FIFO depth
        .WIDTH(8)     // FIFO width
    ) uut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

//monitor signal for the system
 initial begin
        $monitor("Time=%0t | wr_en=%b | rd_en=%b | data_in=%h | data_out=%h | full=%b | empty=%b",
                 $time, wr_en, rd_en, data_in, data_out, full, empty);
    end
    // Clock generation (50 MHz)
    always begin
        #10 clk = ~clk;  // 50 MHz clock
    end

    // Testbench process
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;

        // Apply reset
        #20 reset = 1;   // Apply reset for 20 ns
        #20 reset = 0;   // Release reset after 20 ns

        // Test Write Operation
        #20 wr_en = 1; data_in = 8'b00000001;  // Write data 1
        #20 wr_en = 1; data_in = 8'b00000010;  // Write data 2
        #20 wr_en = 1; data_in = 8'b00000011;  // Write data 3
        #20 wr_en = 0;  // Stop writing
        
        // Test Read Operation
        #20 rd_en = 1;  // Read data
        #20 rd_en = 0;  // Stop reading
        
        // Test Full Condition
        #20 wr_en = 1; data_in = 8'b00000100;  // Write data 4
        #20 wr_en = 1; data_in = 8'b00000101;  // Write data 5
        #20 wr_en = 1; data_in = 8'b00000110;  // Write data 6
        #20 wr_en = 1; data_in = 8'b00000111;  // Write data 7
        #20 wr_en = 1; data_in = 8'b00001000;  // Write data 8
        #20 wr_en = 0;  // FIFO is now full
        
        // Test Empty Condition
        #20 rd_en = 1;  // Read data
        #20 rd_en = 0;  // Stop reading
        #20 rd_en = 1;  // Continue reading
        #20 rd_en = 0;  // Stop reading
        
        // End simulation
        #100 $stop;
    end

endmodule
