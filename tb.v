`timescale 1ns / 1ps

module tb;
    reg clk, reset;
    wire [3:0] signature;
    wire s; // <- wire to capture CUT output

    bist dut (
        .clk(clk),
        .reset(reset),
        .signature(signature),
        .s(s) // <- connect to new output
    );

    integer i;

    // Clock generator: 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Clock system for exactly 8 cycles after reset
        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);  // wait for rising edge
            $display("Cycle %0d | CUT output S = %b | Signature = %b", i+1, s, signature);
        end

        // Print final signature
        $display("\n===============================");
        $display("Final Signature = %b", signature);
        $display("===============================");

        $finish;
    end
endmodule
