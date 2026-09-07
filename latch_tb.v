module latch_tb;
 
    reg  d,en;
    wire q;
 
    latch dut (
      .d(d), .en(en), .q(q)
    );
 
    initial begin
        en = 1; d = 1;
      	#10 $display("en=%b d=%b q=%b", en, d, q); 			
      	en = 0; d = 1;
      	#10 $display("en=%b d=%b q=%b", en, d, q); 		 
      	en = 1; d = 0;
      	#10 $display("en=%b d=%b q=%b", en, d, q); 		 
      	en = 0; d = 0;
		#10 $display("en=%b d=%b q=%b", en, d, q); 		 
      	
        $finish;
    end
 
endmodule
