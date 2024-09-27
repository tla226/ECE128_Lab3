`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2024 02:32:06 PM
// Design Name: 
// Module Name: top_adder
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


`timescale 1ns/1ps
module top_adder_tb;
wire [6:0] seg; //output
reg [1:0] a,b; //input
 
top_adder uut1(a, b, seg);

integer i;
integer j;
initial begin
    for(i=0; i<4; i= i+1)
    begin
        for (j=0; j<4; j= j+1)
        begin
            #10 a = i;
            #10 b = j;
            end
    end 





#10 $stop;

end
endmodule
