module dual_port_ram#(
    // Declaration of the size of the RAM
    parameter ADDR_SIZE = 10,  // Address width (1024 locations)
    parameter WORD_SIZE = 8,  // Data width (8 bits)
    parameter MEMORY_SIZE = 1024 // Memory size (1024 words)
)(
    // I/O ports
    input clk,                // Clock signal for both Port A and Port B
    input wr_a,               // Write enable for Port A
    input [ADDR_SIZE-1:0] addr_a,   // Address for Port A
    input [WORD_SIZE-1:0] data_in_a,// Data input for Port A
    output reg [WORD_SIZE-1:0] data_out_a, // Data output for Port A

    input wr_b,               // Write enable for Port B
    input [ADDR_SIZE-1:0] addr_b,   // Address for Port B
    input [WORD_SIZE-1:0] data_in_b,// Data input for Port B
    output reg [WORD_SIZE-1:0] data_out_b  // Data output for Port B
);

    // RAM modeling
    reg [WORD_SIZE-1:0] mem [0:MEMORY_SIZE-1];

    // Logic for Port A
    always @(posedge clk) begin
        if (wr_a)
            mem[addr_a] <= data_in_a; // Write data to memory
        else
            data_out_a <= mem[addr_a]; // Read data from memory
    end

    // Logic for Port B
    always @(posedge clk) begin
        if (wr_b)
            mem[addr_b] <= data_in_b; // Write data to memory
        else
            data_out_b <= mem[addr_b]; // Read data from memory
    end

endmodule
