module fifo #(
    parameter DEPTH = 8,    // FIFO depth (number of entries)
    parameter WIDTH = 8     // FIFO width (number of bits per entry)
)(
    input wire clk,          // System clock
    input wire reset,        // Reset signal
    input wire wr_en,        // Write enable signal
    input wire rd_en,        // Read enable signal
    input wire [WIDTH-1:0] data_in, // Data to be written into FIFO
    output wire [WIDTH-1:0] data_out, // Data read from FIFO
    output wire full,        // Full flag (FIFO is full)
    output wire empty        // Empty flag (FIFO is empty)
);

    // FIFO memory (using a 2D array)
    reg [WIDTH-1:0] fifo_mem [0:DEPTH-1];

    // Write and Read Pointers
    reg [DEPTH-1:0] wr_ptr;   // Write pointer, keeps track of the write position
    reg [DEPTH-1:0] rd_ptr;   // Read pointer, keeps track of the read position
    
    // FIFO Count (tracks number of items in FIFO)
    reg [DEPTH:0] count;      // Counter to track the number of elements in the FIFO

    // Full and Empty flags (based on the count)
    assign full = (count == DEPTH);    // FIFO is full when count == DEPTH
    assign empty = (count == 0);       // FIFO is empty when count == 0

    // Data output (read data from FIFO memory)
    assign data_out = fifo_mem[rd_ptr];

    // Write and Read Operations
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            wr_ptr <= 0;      // Reset write pointer to 0
            rd_ptr <= 0;      // Reset read pointer to 0
            count <= 0;       // Reset counter to 0
        end else begin
            // Write Operation
            if (wr_en && !full) begin
                fifo_mem[wr_ptr] <= data_in;  // Write data to FIFO
                wr_ptr <= wr_ptr + 1;         // Increment write pointer
                count <= count + 1;           // Increment count
            end
            
            // Read Operation
            if (rd_en && !empty) begin
                rd_ptr <= rd_ptr + 1;         // Increment read pointer
                count <= count - 1;           // Decrement count
            end
        end
    end
endmodule
