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

module RCA (
    input  [3:0] a,
    input  [3:0] b,
    input  cin,
    output [3:0] sum,
    output cout
);

    wire c1, c2, c3;

    FA uut1 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c1)
    );

    FA uut2 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    FA uut3 (
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );

    FA uut4 (
        .a(a[3]),
        .b(b[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(cout)
    );

endmodule