`timescale 1ns/1ns
module timer_tb;
  
  reg enable, clk, reset;
  wire [3:0] setbit, q, delay;
  reg [3:0] delay1, delay2, delay3, delay4;
  reg [1:0] cs;
  
  timer t1(enable,clk,reset,setbit, cs, delay1, delay2, delay3, delay4, q, delay);
  
  always
    #10 clk = ~clk;
  
  initial begin
    delay1 = 4'd3;
    delay2 = 4'd4;
    delay3 = 4'd2;
    delay4 = 4'd3;
    clk = 1'b0;
    
    #340 cs = 2'b00;
    
    reset = 1'b1;
    #2 reset = 1'b0;
    #5 reset = 1'b1;
    #5 enable = 1'b1;
    
    #340 cs = 2'b01;
    #2 reset = 1'b0;
    #5 reset = 1'b1;

    #340 cs = 2'b10;
    #2 reset = 1'b0;
    #5 reset = 1'b1;

    #340 cs = 2'b11;        
    #2 reset = 1'b0;
    #5 reset = 1'b1;

    #340 cs = 2'b00;  
    #2 reset = 1'b0;
    #5 reset = 1'b1;
    
    #340
    
    #50 enable = 1'b0;
    
    #30 $finish;
  end
endmodule
