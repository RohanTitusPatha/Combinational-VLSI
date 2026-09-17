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

module CLA (
    input  [3:0] a,
    input  [3:0] b,
    input  cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] p, g;
    wire c1, c2, c3;
    wire temp1, temp2, temp3, temp4;

    assign p = a ^ b;
    assign g = a & b;

    assign c1 = g[0] | (p[0] & cin);

    assign c2 = g[1] |
                (p[1] & g[0]) |
                (p[1] & p[0] & cin);

    assign c3 = g[2] |
                (p[2] & g[1]) |
                (p[2] & p[1] & g[0]) |
                (p[2] & p[1] & p[0] & cin);

    assign cout = g[3] |
                  (p[3] & g[2]) |
                  (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & cin);

    FA f0(a[0], b[0], cin, sum[0], temp1);
    FA f1(a[1], b[1], c1,  sum[1], temp2);
    FA f2(a[2], b[2], c2,  sum[2], temp3);
    FA f3(a[3], b[3], c3,  sum[3], temp4);

endmodule
