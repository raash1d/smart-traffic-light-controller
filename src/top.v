`timescale 1ns/1ns
module top(enable, clk, reset, car2, car4, state, nextstate, l13, l24, d1, d2, d3, d4, setbit, q, delay);
  input car2, car4, enable, clk, reset;
  output wire [1:0] l13, l24;
  output wire [1:0] nextstate;
  input wire [1:0] state;
  output wire [3:0] setbit, q, delay;
  input wire [3:0] d1, d2, d3, d4;
  
  lightfsmj f1(.i(car2|car4),.c(setbit),.s(state),.ns(nextstate), .light13(l13), .light24(l24));
  timer t1(.enable(enable), .clk(clk), .reset(reset), .setbit(setbit), .cs(state), .delay1(d1), .delay2(d2), .delay3(d3), .delay4(d4), .q(q), .delay(delay));
  
endmodule
