module tpg_lfsr (
    input clk,
    input reset,
    output [3:0] pattern
);
    reg [3:0] lfsr;

    assign pattern = lfsr;

    always @(posedge clk or posedge reset) begin
        if (reset)
            lfsr <= 4'b0001;  // seed
        else
            lfsr <= {lfsr[0], lfsr[3], lfsr[2] ^ lfsr[0], lfsr[1] ^ lfsr[0]};
    end
endmodule
// Characteristic Polynomial :- x⁴ + x³ + x² + 1 (For LFSR)
