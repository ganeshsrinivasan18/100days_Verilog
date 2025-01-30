module reg_file_tb;

  reg clk;
  reg reset;
  reg write;
  reg [4:0] sr1, sr2, dr;
  reg [31:0] wrdata;
  wire [31:0] rddata1, rddata2;

  // Instantiate the register file
  reg_file uut (
    .clk(clk),
    .reset(reset),
    .write(write),
    .sr1(sr1),
    .sr2(sr2),
    .dr(dr),
    .wrdata(wrdata),
    .rddata1(rddata1),
    .rddata2(rddata2)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    write = 0;
    sr1 = 0;
    sr2 = 0;
    dr = 0;
    wrdata = 0;
    
    // Apply reset
    #10 reset = 0; // Deassert reset

     $display("Register file 32x32...."); 

    // Write values to registers
    #10 write = 1; dr = 5; wrdata = 32'hA5A5A5A5; // Write A5A5A5A5 to reg5
    #10 write = 1; dr = 10; wrdata = 32'h5A5A5A5A; // Write 5A5A5A5A to reg10
    #10 write = 0;

    // Read values from registers
    #10 sr1 = 5; sr2 = 10;
    #10 $display("Read data1: %h, Read data2: %h", rddata1, rddata2);
    
    
        // Write values to registers
    #10 write = 1; dr = 6; wrdata = 32'hB67BB6; // Write B67BB6 to reg6
    #10 write = 1; dr = 15; wrdata = 32'hC45ACF; // Write C45ACF to reg7
    #10 write = 0;
    
    
        // Read values from registers
    #10 sr1 = 6; sr2 = 15;
    #10 $display("Read data1: %h, Read data2: %h", rddata1, rddata2);
    
    
            // Write values to registers
    #10 write = 1; dr = 20; wrdata = 32'hCCA54614; // Write CCAG54614 to reg20
    #10 write = 1; dr = 12; wrdata = 32'hDAAB3412; // Write DAAB3412 to reg12
    #10 write = 0;
    
    
        // Read values from registers
    #10 sr1 = 20; sr2 = 12;
    #10 $display("Read data1: %h, Read data2: %h", rddata1, rddata2);
    
    
            // Write values to registers
    #10 write = 1; dr = 3; wrdata = 32'h5667ABCD; // Write 5667ABCD to reg3
    #10 write = 1; dr = 30; wrdata = 32'hAABBCCDD; // Write AABBCCDD to reg30
    #10 write = 0;
    
            // Read values from registers
    #10 sr1 = 3; sr2 = 30;
    #10 $display("Read data1: %h, Read data2: %h", rddata1, rddata2);

    
    // End simulation
    #20 $finish;
  end

endmodule
