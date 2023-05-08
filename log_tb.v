module tb;

parameter k =7;
parameter n = 31;


reg signed [n:0] x;
reg clk,wea,ena;
reg signed [n-1:0] xend [k-1:0];
wire signed [n:0] y [k-1:1];
wire [63:0] out;//wire signed [n:0] y;
wire signed [k-1:1] ysn;
wire [k : 1] index;
wire [2:0] address;
wire [31:0] a;
wire [31:0] b;

ig dut(clk ,x,xend ,out,y,ysn,index,address,a,b,wea,ena);


always begin
#5 clk = ~clk;
end

initial 
begin
clk =0;
x =32'b00111111000000000000000000000000;
wea=0;
ena=1;
end

initial 
begin
$readmemb("xend.mem" ,xend);
#10;
end

endmodule