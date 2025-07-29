module sisr (
    input clk,
    input reset,
    input s_in,
    output [3:0] signature
);
    reg [3:0] reg_sisr;

    assign signature = reg_sisr;

    always @(posedge clk or posedge reset) begin
        if (reset)
            reg_sisr <= 4'b0000;
        else begin
            reg_sisr[3] <= s_in ^ reg_sisr[0];
            reg_sisr[2] <= reg_sisr[3];
            reg_sisr[1] <= reg_sisr[2] ^ reg_sisr[0];
            reg_sisr[0] <= reg_sisr[1] ^ reg_sisr[0];
        end
    end
endmodule
// Characteristic Polynomial :- x⁴ + x³ + x² + 1 (For SISR/ORA)
