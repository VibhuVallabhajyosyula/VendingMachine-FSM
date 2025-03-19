module vending_machine_tb;
    logic clk, rst;
    logic [1:0] a;
    logic b;
    logic [1:0] change;

    // Instantiate the vending machine module
    vending_machine dut (.clk(clk), .rst(rst), .a(a), .b(b), .change(change));

    // Clock generation
    initial clk = 0; // Initialize clk
    always #5 clk = ~clk; // Clock period = 10ns

    // Test Sequence
    initial begin
        // Enable waveform dump
        $dumpfile("dump.vcd"); 
        $dumpvars(0, vending_machine_tb);

        // Initialize signals
        rst = 1;  // Activate reset
        a = 2'b00; // No coin inserted
        #10;
        
        rst = 0; // Release reset
        #10;

        // Insert 5rs
        a = 2'b01; 
        #10;

        // Insert 10rs
        a = 2'b10; 
        #10;

        // Insert 5rs, then another 5rs (should vend)
        a = 2'b01; 
        #10;
        a = 2'b01; 
        #10;

        // Insert 5rs, then 10rs (should vend)
        a = 2'b01; 
        #10;
        a = 2'b10; 
        #10;

        // Insert 10rs, then 10rs (should vend twice)
        a = 2'b10; 
        #10;
        a = 2'b10; 
        #10;

        // End simulation
        $finish;
    end

    // Monitor to observe signal behavior
    initial begin
        $monitor("Time = %0t | rst = %b | a = %b | b = %b | change = %b",
                 $time, rst, a, b, change);
    end
endmodule

