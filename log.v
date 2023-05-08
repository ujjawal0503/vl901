module ig ( clk , x ,xend,out, y ,ysn,index,address,a,b,wea,ena);

parameter k = 7;
parameter n = 31;
integer i;

input signed [n:0] x;
output reg signed [k-1:1] ysn;
 reg a_b ;
input clk;
output reg [63:0] out;


input signed [n-1:0] xend [k-1:0];
output reg signed [n:0] y [k-1:1];
wire signed xsign;
wire [31:0] din;
//wire [30:0] dinx;

output reg [k : 1] index;

assign xsign = 1;



output [31:0] a;
output [31:0] b;
input wea,ena;
output reg [2:0] address;

initial
begin
address = 3'b000;
end


always @(*)begin
 for ( i=1; i<=k-1; i=i+1)begin
   
y[i] = x +({xsign, ~xend[i]});//        y = x +({xsign, ~xend})  ; //({xsign, ~xend[i]});
end
end



always @(*)
    for ( i=1; i<=k-1; i=i+1)
   ysn[i] = y[i][31];
    
//    always @(*) begin
//     ysn = y[31];   
//     end   
     
     
always @(*)
begin
case(ysn)                                                                 //Initializing index mux
6'b111111 : index=7'b0000001;
6'b111110 : index=7'b0000010;
6'b111100 : index=7'b0000100;
6'b111000 : index=7'b0001000;
6'b110000 : index=7'b0010000;
6'b100000 : index=7'b0100000;
6'b000000 : index=7'b1000000;
default :  index=7'b0000001;
endcase
end


always @(*)
begin
case(ysn)                                                                 //Initializing index mux
6'b111111 : a_b =index[1];
6'b111110 : a_b =index[2];
6'b111100 : a_b =index[3];
6'b111000 : a_b =index[4];
6'b110000 : a_b =index[5];
6'b100000 : a_b =index[6];
6'b000000 : a_b =index[7];
default : a_b = index[1];
endcase
end

//always@(*)
//begin
//case(a_b)
//index[1] : address =3'b000;                                                  //accessing luts a and b
//index[2] : address =3'b001;
//index[3] : address =3'b010;
//index[4] : address =3'b011;
//index[5] : address =3'b100;
//index[6] : address =3'b101;
//index[7] : address =3'b110;
//index[8] : address =3'b111;
//endcase
//end

always @(*)
begin 

if( index[1]==1)
address =3'b000;
else if( index[2]==1)
address = 3'b001;
else if( index[3]==1)
address = 3'b010;
else if( index[4]==1)
address = 3'b011;
else if( index[5]==1)
address = 3'b100;
else if( index[6]==1)
address = 3'b101;
else 
address = 3'b110;

end



blk_mem_gen_0 ablock (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(address),  // input wire [2 : 0] addra
  .dina(din),    // input wire [31 : 0] dina
  .douta(a)  // output wire [31 : 0] douta
);

blk_mem_gen_1 bblock (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(address),  // input wire [2 : 0] addra
  .dina(din),    // input wire [31 : 0] dina
  .douta(b)  // output wire [31 : 0] douta
);

// blk_mem_gen_2 xendbl (
//  .clka(clk),    // input wire clka
//  .ena(ena),      // input wire ena
//  .wea(wea),      // input wire [0 : 0] wea
//  .addra(address),  // input wire [2 : 0] addra
//  .dina(dinx),    // input wire [31 : 0] dina
//  .douta(xend)  // output wire [31 : 0] douta
// );


always @(*)
begin
out = (a*x) + b;
end

endmodule