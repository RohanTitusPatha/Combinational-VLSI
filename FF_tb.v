module FF_tb;
  reg d, clk;
  wire q;
  
  FF dut(.d(d), .clk(clk), .q(q));
  
  always #5 clk = ~clk;
  
initial begin
  		  clk=0;
  		  d=0;
  		#10
        d = 0;
  		#10 $display("clk=%b d=%b q=%b", clk, d, q); 			
      	d = 1;
  		#10 $display("clk=%b d=%b q=%b", clk, d, q); 		 
       	d = 0;
		  #10 $display("clk=%b d=%b q=%b", clk, d, q);
        $finish;
    end
 
endmodule
