`timescale 1ns/1ns
module timer(enable,clk,reset,setbit, cs, delay1, delay2, delay3, delay4, q, delay);
	input [3:0] delay1, delay2, delay3, delay4;
	output reg[3:0] q, delay, setbit;
	input enable, clk, reset;
	reg [3:0] sb_int;
	input [1:0] cs;
	wire d0, d1, d2, d3;

	//combinational logic for MOD-16 counter
	assign d0 = (~q[0]&~q[1])|(~q[0]&q[1]);
	assign d1 = (q[0]&~q[1])|(~q[0]&q[1]);
	assign d2 = (q[0]&q[1]&~q[2])|(~q[0]&q[2])|(~q[1]&q[2]);
	assign d3 = (q[0]&q[1]&q[2]&~q[3])|(~q[0]&q[2]&q[3])|(~q[1]&q[2]&q[3])|(~q[2]&q[3]);
	
	//sequential logic for MOD-16 counter
	always@(posedge clk or negedge reset) begin
		if(~reset) begin
			q <= 4'b0000;
		end
		else begin
			if(enable) begin
				q[0] <= d0;
				q[1] <= d1;
				q[2] <= d2;
				q[3] <= d3;
			end
			else begin
				q[0] <= 1'b0;
				q[1] <= 1'b0;
				q[2] <= 1'b0;
				q[3] <= 1'b0;
			end
		end
	end
	
	//logic that decides which delay to choose according to the state of the FSM
	always@(posedge clk) begin
			if(cs == 2'b00) begin
				sb_int <= 4'b1000;
				delay <= delay1;
			end
			else if(cs == 2'b01) begin
				sb_int <= 4'b0100;
				delay <= delay2;
				end
			else if(cs == 2'b10) begin
				sb_int <= 4'b0010;
				delay <= delay3;
				end
			else begin
				sb_int <= 4'b0001;
				delay <= delay4;
			end
	end	
	
	always@(delay == q) begin
		if (delay == q) begin
			setbit = sb_int;
		end
		else begin
			setbit = sb_int;
		end
	end
endmodule
