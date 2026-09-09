module mux2to1 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output reg y
);

    always @(*) begin
        if (sel == 0)
            y = a;
        else
            y = b;
    end

endmodule


module muxnto1 #(parameter WIDTH = 4) (
  input [WIDTH-1:0] in,
  input [$clog2(WIDTH)-1:0] sel,
    output y
);
  localparam S = $clog2(WIDTH);
  wire [WIDTH-1:0] stage [0:S];
  assign stage[0] = in;
  genvar i,j;
  generate
    
    for(i=0; i<S; i=i+1)begin
      for(j=0; j< WIDTH/(2**(i+1)); j=j+1)begin
        
        mux2to1 m(.a(stage[i][2*j]),
                  .b(stage[i][2*j+1]),
                  .sel(sel[i]),
                  .y(stage [i+1][j]));
      end
    end
  endgenerate
  assign y = stage[S][0];
endmodule
  
