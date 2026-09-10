module FA_tb;

    reg a;
    reg b;
    reg cin;

    wire sum;
    wire cout;

    FA dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $display("A  B  cin  S  Cout");

        a = 0; b = 0; cin = 0;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 0; b = 0; cin = 1;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 0; b = 1; cin = 0;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 0; b = 1; cin = 1;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 1; b = 0; cin = 0;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 1; b = 0; cin = 1;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 1; b = 1; cin = 0;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        a = 1; b = 1; cin = 1;
        #10 $display("%b  %b  %b  %b  %b", a, b, cin, sum, cout);

        $finish;

    end

endmodule
