module tb_lifo_stack;

    reg clk;
    reg rst;
    reg push;
    reg pop;
    reg [7:0] din;
    wire [7:0] dout;
    wire full;
    wire empty;

    lifo_stack uut (
        .clk(clk),
        .rst(rst),
        .push(push),
        .pop(pop),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock Generation
    always #5 clk = ~clk; 

    initial begin
        clk = 0;
        rst = 1; push = 0; pop = 0; din = 8'd0;
        #10 rst = 0; // Release reset
        
        $display("Pushing Data: ");
        repeat (5) begin
            din = din + 8'd5;
            push = 1;
            #10 push = 0;
            #10;
            $display("Pushed: %d, Stack Pointer: %d", din, uut.sp);
        end
        
        $display("Popping Data: ");
        repeat (5) begin
            pop = 1;
            #10 pop = 0;
            #10;
            $display("Popped: %d, Stack Pointer: %d", dout, uut.sp);
        end
        
        #20 $stop;
    end
endmodule
