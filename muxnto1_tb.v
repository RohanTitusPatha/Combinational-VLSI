module muxnto1_tb;

    parameter WIDTH = 4;
    localparam S = $clog2(WIDTH);

    reg [WIDTH-1:0] in;
    reg [S-1:0] sel;
    wire y;

    integer i;

    muxnto1 #(.WIDTH(WIDTH)) dut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin

        $display("In     Sel    Y");

        in = 4'b1011;

        for (i = 0; i < WIDTH; i = i + 1) begin
            sel = i;
            #10;
            $display("%b    %b     %b", in, sel, y);
        end

        $finish;

    end

endmodule
