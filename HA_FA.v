module HA (
    input  a,
    input  b,
    output sum,
    output cout
);

    assign sum  = a ^ b;
    assign cout = a & b;

endmodule


module FA (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    wire s1, c1, c2;

    HA uut1 (
        .a(a),
        .b(b),
        .sum(s1),
        .cout(c1)
    );

    HA uut2 (
        .a(s1),
        .b(cin),
        .sum(sum),
        .cout(c2)
    );

    assign cout = c1 | c2;

endmodule
