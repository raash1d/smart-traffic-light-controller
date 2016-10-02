`timescale 1ns/1ns
module timers_tb;
  
  reg enable, clk, reset;
  wire [3:0] setbit1,setbit2,setbit3,setbit4;
  
  timer1 t1(enable,clk,reset,setbit1);
  timer2 t2(enable,clk,reset,setbit2);
  timer3 t3(enable,clk,reset,setbit3);
  timer4 t4(enable,clk,reset,setbit4);
  
  always
    #5 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    reset = 1'b1;
    #2 reset = 1'b0;
    #5 reset = 1'b1;
    #5 enable = 1'b1;
    #50 enable = 1'b0;
    #100 $finish;
  end
  
endmodule
