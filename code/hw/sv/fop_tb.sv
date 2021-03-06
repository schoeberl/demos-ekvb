// Copyright: 2015-17, Copenhagen Business School
// Author: Rasmus Ulslev Pedersen (rup.itm@cbs.dk)
// License: Simplified BSD License
//
// fop testbench

`timescale 1ns / 1ps

module fop_tb (); 
    
    // testbench clock
    logic tb_clk;

    
    logic fop_reset;
    logic fop_enable;
    fop fop_ (
                  .clk ( tb_clk),
                  .reset ( fop_reset ),
                  .enable ( fop_enable )    
             );
    
    // init and generate clock
    initial
    begin
        tb_clk = 1'b0;
        forever
        begin
            #5 tb_clk = ~tb_clk;
		end
    end		
    //always  #( TBCLK_PERIOD/2.0 ) tb_clk = ~tb_clk;
  
            
    initial fop_reset  = 1'b0;
    initial fop_enable = 1'b0;
    
    initial begin
	    $display("fop_tb starting...");
        @(posedge tb_clk);
        // run first instruction
        fop_reset = 1'b1;
        $display("fop_tb running...");       
        @(posedge tb_clk);
        fop_reset = 1'b0;
        fop_enable = 1'b1;
        @(posedge tb_clk);
        @(posedge tb_clk);
        @(posedge tb_clk);
        @(posedge tb_clk);
        @(posedge tb_clk);
        #100 $finish;
    end
endmodule