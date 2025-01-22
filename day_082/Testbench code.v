module dual_port_ram_tb();
    // Parameters
    parameter ADDR_SIZE = 10;
    parameter WORD_SIZE = 8;
    parameter MEMORY_SIZE = 1024;

    // I/O Declarations
    reg clk;
    reg wr_a, wr_b;
    reg [ADDR_SIZE-1:0] addr_a, addr_b;
    reg [WORD_SIZE-1:0] data_in_a, data_in_b;
    wire [WORD_SIZE-1:0] data_out_a, data_out_b;

    // Instantiate the DUT
    dual_port_ram #(
        .ADDR_SIZE(ADDR_SIZE),
        .WORD_SIZE(WORD_SIZE),
        .MEMORY_SIZE(MEMORY_SIZE)
    ) DUT (
        .clk(clk),
        .wr_a(wr_a),
        .wr_b(wr_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    // Generate Waveform
    initial begin
        $dumpfile("dual_port_ram.vcd");
        $dumpvars(0, dual_port_ram_tb);
        $monitor("Time: %0t | Addr_A: %0h, Data_In_A: %0h, Wr_A: %0b, Data_Out_A: %0h | Addr_B: %0h, Data_In_B: %0h, Wr_B: %0b, Data_Out_B: %0h",
                 $time, addr_a, data_in_a, wr_a, data_out_a, addr_b, data_in_b, wr_b, data_out_b);
    end

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Testbench Logic
    initial begin
        // Reset Inputs
        wr_a = 0; addr_a = 0; data_in_a = 0; 
        wr_b = 0; addr_b = 0; data_in_b = 0;

        // Test Case 1: Write to Port A
        #10;
        addr_a = 1; data_in_a = 8'h0A; wr_a = 1; // Write 10 (hex: 0A) to address 1
        #10 wr_a = 0;

        // Test Case 2: Write to Port B
        #10;
        addr_b = 2; data_in_b = 8'h14; wr_b = 1; // Write 20 (hex: 14) to address 2
        #10 wr_b = 0;

        // Test Case 3: Read from Port A and Port B
        #10;
        addr_a = 1; // Read from address 1 (should return 10)
        addr_b = 2; // Read from address 2 (should return 20)

        // Test Case 4: Simultaneous Write
        #10;
        addr_a = 3; addr_b = 4;
        data_in_a = 8'h1E; data_in_b = 8'h28; // Write 30 and 40
        wr_a = 1; wr_b = 1;
        #10 wr_a = 0; wr_b = 0;

        // Test Case 5: Read from both ports
        #10;
        addr_a = 3; // Read from address 3 (should return 30)
        addr_b = 4; // Read from address 4 (should return 40)
        
         //Again Writing Port A and Port B
         // Test Case 6: Write to Port A
        #10;
        addr_a = 8; data_in_a = 8'h0B; wr_a = 1; 
        #10 wr_a = 0;

        // Test Case 7: Write to Port B
        #10;
        addr_b = 9; data_in_b = 8'h45; wr_b = 1; 
        #10 wr_b = 0;
        
        
        

        #20 $finish;
    end
endmodule
