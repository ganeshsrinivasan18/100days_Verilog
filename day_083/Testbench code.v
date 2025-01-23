module read_only_memory_tb;
    // Parameters for testbench
   parameter ADDR_SIZE = 4;
parameter WORD_SIZE = 8;
    
    // Testbench signals
    reg [ADDR_SIZE-1:0] addr;
    wire [WORD_SIZE-1:0] data_out;
    
    // Instantiate the ROM module
    read_only_memory #(ADDR_SIZE, WORD_SIZE) DUT (
        .addr(addr),
        .data_out(data_out)
    );
    
    // Test sequence
    initial begin
        // Initialize signals
        addr = 0;
        
        // Monitor output
        $monitor("Time: %0t | Address: %d | Data Out: %h", $time, addr, data_out);
        
        // Apply addresses and observe ROM output
        #10 addr = 0;  // Read data from address 0
        
        #10 addr = 1; // Read data from address 1
        
        #10 addr = 2;  // Read data from address 2
        
        #10 addr = 3;  // Read data from address 3
        
        #10 addr = 4;  // Read data from address 4
        
        #10 addr = 5;  // Read data from address 5
        
        #10 addr = 6;  // Read data from address 6
        
        #10 addr = 7;  // Read data from address 7
        
        // End the simulation
       #10 $finish;
    end
endmodule
