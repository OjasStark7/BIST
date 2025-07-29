module bist (
    input clk,
    input reset,
    output [3:0] signature,
    output s  // <== Add this line
);
    wire [3:0] pattern;
    wire s_out;

    assign s = s_out;

    // TPG
    tpg_lfsr tpg (
        .clk(clk),
        .reset(reset),
        .pattern(pattern)
    );

    // CUT
    cut cut_uut (
        .a(pattern[3]),
        .b(pattern[2]),
        .c(pattern[1]),
        .d(pattern[0]),
        .s(s_out)
    );

    // SISR
    sisr signature_analyzer (
        .clk(clk),
        .reset(reset),
        .s_in(s_out),
        .signature(signature)
    );
endmodule
