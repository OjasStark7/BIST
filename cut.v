module cut (
    input a, b, c, d,
    output s
);
    assign s = (a & b) | (c & d);
endmodule
// CUT :- f = a.b + c.d
