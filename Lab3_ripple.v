`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2024 01:44:25 PM
// Design Name: 
// Module Name: Lab3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
/*
// carryout adder
module Lab3_carryout(
input [1:0] a,
input [1:0] b,
output [6:0] seg
    );
wire [2:0] w_c;
wire [1:0] w_g, w_p, w_s;

assign w_g[0] = a[0] & b[0];
assign w_g[1] = a[1] & b[1];

assign w_p[0] = a[0]^b[0];
assign w_p[1] = a[1]^b[1];

assign w_c[0] = 1'b0;
assign w_c[1] = w_g[0] | (w_p[0] & w_c[0]);
assign w_c[2] = w_g[1] | (w_p[1] & w_c[1]);


FA_1bit uut1(a[0],b[0],w_c[0],w_c[1],w_s[0]);
FA_1bit uut2(a[1],b[1],w_c[1],w_c[2],w_s[1]);

assign cout = w_c[2];
    
endmodule
*/

//ripple carry adder
module top_adder(
    input [1:0] a,
    input [1:0] b,
    output [6:0] seg
    );

wire cout_w;
wire [1:0] s_w;
wire [3:0] x;
assign x = {1'b0, cout_w, s_w};

top_2bit uut1(a,b,cout_w,s_w);
BCD_7seg uut2(x,seg);
endmodule



module top_2bit(
input [1:0] a,
input [1:0] b,
output cout,
output [1:0] s
);

wire cin_0;
wire c1;
assign cin_0 = 1'b0;

FA_1bit FA1(a[0], b[0], cin_0, c1, s[0]);
FA_1bit FA2(a[1], b[1], c1, cout, s[1]);


endmodule

module FA_1bit(
    input a,
    input b, 
    input cin,
    output cout, 
    output s);
    
   wire an, bn, cinn, s0,s1,s2,s3, c1,c2,c3,c4;
   
   not (an, a);
   not (bn, b);
   not (cinn, cin);
   
   and (s0, an, bn, cin);
   and (s1, an, b, cinn);
   and (s2, a, bn, cinn);
   and (s3, a ,b, cin);
   
   or (s, s0,s1,s2,s3);
   
   //for ccout 
    and (c1, an, b, cin);
    and (c2, a, bn, cin);
    and (c3, a, b, cinn);
    and (c4, a, b, cin);
    
    or (cout, c1,c2,c3,c4);
        
endmodule


module BCD_7seg(
    input [3:0] num,
    output reg [6:0] out
    );
    
    always @(num)
    begin
        case (num)
            4'b0000: out = 7'b1000000; // 0
            4'b0001: out = 7'b1111001; // 1
            4'b0010: out = 7'b0100100; // 2
            4'b0011: out = 7'b0110000; // 3
            4'b0100: out = 7'b0011001; // 4
            4'b0101: out = 7'b0010010; // 5
            4'b0110: out = 7'b0000010; // 6
            default: out = 1'bx;
            endcase
         end
         
         
         
endmodule
    
