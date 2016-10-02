`timescale 1ns/1ns
module testbench;
  
  reg enable, clk, reset, car2, car4;
  wire [1:0] nextstate, l13, l24;
  wire [3:0] setbit, q, delay;
  reg [3:0] d1, d2, d3, d4;
  reg [1:0] state, oldstate;
  
  top_netlist u1(.enable(enable), .clk(clk), .reset(reset), .car2(car2), .car4(car4), .state(state), .nextstate(nextstate), .l13(l13), .l24(l24), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .setbit(setbit), .q(q), .delay(delay));
  
  always
    #10 clk = ~clk;
  
  initial begin
    $sdf_annotate("top.sdf",u1,,,"MAXIMUM");
  //initial conditions
       reset = 1'b1;
    #2 reset = 1'b0;
    #10 reset = 1'b1;
    d1 = 4'd3;
    d2 = 4'd11;
    d3 = 4'd10;
    d4 = 4'd5;
    clk = 1'b0;
    car2 = 1'b0;
    car4 = 1'b0;
    #5 enable = 1'b1;
    state = 2'h0;
    
    //testing condition when car arrives at light 2
    #1300 car2 = 1'b1;
    #30 car2 = 1'b0;
	
	//testing condition when car arrives at light 4
    #1300 car4 = 1'b1;
    #30 car4 = 1'b0;
    
	//testing condition when cars are at both lights 2 and 4
	#1300 car2 = 1'b1;
    car4 = 1'b1;
    #30 car2 = 1'b0;
    car4 = 1'b0;
    #1300 car2 = 1'b1;
    car4 = 1'b1;
    #20 car2 = 1'b0;
    #40 car4 = 1'b0;
    #200 $finish;
    
  end
  
  //required external connections
  always@(posedge clk) begin
    oldstate = state;
    if (|setbit) begin
        if(state == 2'b00 && (car2|car4)) begin
          state = nextstate;
        end
        else if (state != 2'b00) begin
          state = nextstate;
        end
      if(oldstate != state) begin
        reset = 1'b0;
        #5 reset = 1'b1;
      end
      else begin
        reset = 1'b1;
      end
	end
   end
endmodule
