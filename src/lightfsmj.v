`timescale 1ns/1ns
module lightfsmj(i,c,s,ns,light13,light24);
	input i; 
	input[3:0] c; 
	input [1:0] s;
	output[1:0] ns;
	output reg[1:0] light13;
	output reg[1:0] light24;


	assign ns[1] = ((~s[1])&(s[0])&(c[2]))|(s[1]&(~s[0])&(~c[1]))|(s[1]&(~s[0])&(c[1]))|(s[0]&s[1]&(~c[0]));
	assign ns[0] = ((~s[1])&(~s[0])&c[3]&i)|((~s[1])&(s[0])&(~c[2]))|((s[1])&(~s[0])&c[1])|((s[1])&(s[0])&(~c[0]));

	always@(s) begin
		light13[0] <= ~s[1]&s[0];
		light13[1] <= s[1];
		light24[0] <= s[1]&s[0];
		light24[1] <= ~s[1];
	end
endmodule
