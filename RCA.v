module RCA #(parameter N = 4) (
    input  [N-1:0] a,
    input  [N-1:0] b,
    input  cin,
    output [N-1:0] sum,
    output cout
);

    wire [N:0] c;

    assign c[0] = cin;
    assign cout = c[N];

    genvar i;

    generate
        for(i = 0; i < N; i = i + 1) begin
            FA uut (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

endmodule
