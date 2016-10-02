`timescale 1ns/1ns
module timer1(enable,clk,reset,setbit,curr_state);

  input enable,clk,reset;
  input [1:0] curr_state;
  wire d0,d1;
  reg [1:0] q;

  output reg [3:0] setbit;
  
  assign d0 = ~q[0];
  assign d1 = q[0]^q[1];
	
  always@(posedge clk or negedge reset) begin
    if(~reset) begin
      q = 2'b00;
	end
	else begin
      if(enable) begin
           q[0] = d0;
           q[1] = d1;
	  end
      else begin
        q[0] = 1'b0;
        q[1] = 1'b0;
      end
    end
  end
  
  always@(posedge clk) begin
    case (curr_state)
      2'b00:setbit = 4'h8;
      2'b01:setbit = 4'h4;
      2'b10:setbit = 4'h2;
      2'b11:setbit = 4'h1;
    endcase
  end
/*  
  always@(posedge clk) begin
    if(q[0] & q[1]) begin
      setbit = 4'b1000;
    end
    else begin
      setbit = 4'b0000;
    end
  end
*/
endmodule
/*
///////////////////////////////////////////////////////////

module timer2(enable,clk,reset,setbit);

  input enable,clk,reset;
  wire d0,d1;
  reg [1:0] q;

  output reg [3:0] setbit;
  
  assign d0 = ~q[0];
  assign d1 = q[0]^q[1];
	
  always@(posedge clk or negedge reset) begin
    if(~reset) begin
      q = 2'b00;
	end
	else begin
      if(enable) begin
           q[0] = d0;
           q[1] = d1;
	  end
      else begin
        q[0] = 1'b0;
        q[1] = 1'b0;
      end
    end
  end
  
  always@(posedge clk) begin
    if(q[0] & q[1]) begin
      setbit = 4'b0100;
    end
    else begin
      setbit = 4'b0000;
    end
  end

endmodule

///////////////////////////////////////////////////////////

module timer3(enable,clk,reset,setbit);

  input enable,clk,reset;
  wire d0,d1;
  reg [1:0] q;

  output reg [3:0] setbit;
  
  assign d0 = ~q[0];
  assign d1 = q[0]^q[1];
	
  always@(posedge clk or negedge reset) begin
    if(~reset) begin
      q = 2'b00;
	end
	else begin
      if(enable) begin
           q[0] = d0;
           q[1] = d1;
	  end
      else begin
        q[0] = 1'b0;
        q[1] = 1'b0;
      end
    end
  end
  
  always@(posedge clk) begin
    if(q[0] & q[1]) begin
      setbit = 4'b0010;
    end
    else begin
      setbit = 4'b0000;
    end
  end

endmodule

///////////////////////////////////////////////////////////

module timer4(enable,clk,reset,setbit);

  input enable,clk,reset;
  wire d0,d1;
  reg [1:0] q;

  output reg [3:0] setbit;
  
  assign d0 = ~q[0];
  assign d1 = q[0]^q[1];
	
  always@(posedge clk or negedge reset) begin
    if(~reset) begin
      q = 2'b00;
	end
	else begin
      if(enable) begin
           q[0] = d0;
           q[1] = d1;
	  end
      else begin
        q[0] = 1'b0;
        q[1] = 1'b0;
      end
    end
  end
  
  always@(posedge clk) begin
    if(q[0] & q[1]) begin
      setbit = 4'b0001;
    end
    else begin
      setbit = 4'b0000;
    end
  end

endmodule
*/
