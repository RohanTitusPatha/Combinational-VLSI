module RCA_tb;

    parameter N = 4;

    reg  [N-1:0] a;
    reg  [N-1:0] b;
    reg  cin;

    wire [N-1:0] sum;
    wire cout;

    RCA #(.N(N)) dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $display("   A      B     Cin | Cout   Sum");

        a = 4'b0000; b = 4'b0000; cin = 0;
        #10 $display("%b   %b    %b  |   %b    %b",
                     a, b, cin, cout, sum);

        a = 4'b0011; b = 4'b0010; cin = 0;
        #10 $display("%b   %b    %b  |   %b    %b",
                     a, b, cin, cout, sum);

        a = 4'b0101; b = 4'b0011; cin = 0;
        #10 $display("%b   %b    %b  |   %b    %b",
                     a, b, cin, cout, sum);

        a = 4'b1111; b = 4'b0001; cin = 0;
        #10 $display("%b   %b    %b  |   %b    %b",
                     a, b, cin, cout, sum);

        a = 4'b1111; b = 4'b1111; cin = 1;
        #10 $display("%b   %b    %b  |   %b    %b",
                     a, b, cin, cout, sum);

        $finish;

    end

endmodule
