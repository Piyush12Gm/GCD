`timescale 1ns / 1ps

module test;

    reg [15:0] data_in;
    reg clk, start;
    wire done;
    wire [15:0] A, B;
    wire lt, gt, eq;
    wire ldA, ldB, sel1, sel2, sel_load;

    reg [15:0] origA = 0, origB = 0;

    // Instantiate Data Path and Controller
    data_path DP( A, B,lt, gt, eq, ldA, ldB, sel1, sel2, sel_load, clk, data_in);
    controller CON(ldA, ldB, sel1, sel2, sel_load, done, lt, gt, eq, clk, start);

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Apply inputs
    initial begin
        start = 0;
        #10 data_in = 270;  // First number
        start = 1;
        #10 data_in = 192;   // Second number
        #10 start = 0;
    end

    // Store original A and B when loaded
    always @(posedge clk) begin
        if (ldA && sel_load)
            origA <= data_in;
        if (ldB && sel_load)
            origB <= data_in;
    end

    // For printing intermediate steps
    reg [15:0] lastA = 16'hFFFF, lastB = 16'hFFFF;
    wire [15:0] gcd;
    wire [31:0] product;
    reg [31:0] lcm;

    assign gcd = A;
    assign product = origA * origB;

    // Header
    initial begin
        $display("            Time    A     B    Done");
    end

    // Monitor and display logic
    always @(posedge clk) begin
        if ((A !== lastA || B !== lastB) || done) begin
            $display("%t   %3d   %3d     %b", $time, A, B, done);
            lastA <= A;
            lastB <= B;
        end

        if (done) begin
            lcm = product / gcd;
            $display("GCD(%0d, %0d) = %0d", origA, origB, gcd);
            $display("LCM(%0d, %0d) = %0d", origA, origB, lcm);
            $finish;
        end
    end

endmodule
