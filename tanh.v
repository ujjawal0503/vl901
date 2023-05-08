module ig ( clk , x ,xend,out, y ,ysn,index,address,a,b,wea,ena);

parameter k = 27;
parameter n = 31;
integer i;

input signed [n:0] x;
output reg signed [k-1:1] ysn;
 reg a_b ;
input clk;
output reg [63:0] out;


input signed [n-1:0] xend [k-1:0];
output reg signed [n:0] y [k-1:1];
reg signed xsign;
wire [31:0] din;

output reg [k : 1] index;

always@(*)
begin
for(i=1 ; i<=9 ;i++)
begin
xsign = 0;
end
end

always@(*)
begin
for(i=10 ; i<=19 ;i=i+1)
begin
xsign = 1;
end
end


output [31:0] a;
output [31:0] b;
input wea,ena;
output reg [4:0] address;

initial
begin
address = 5'b00000;
end


always @(*)begin
if (xsign == 1)begin

y[i] = x +({xsign, ~xend[i]});//        y = x +({xsign, ~xend})  ; //({xsign, ~xend[i]});

end
end

always @(*)begin
if (xsign == 0)
begin

y[i] = x +({xsign, xend[i]});//        y = x +({xsign, ~xend})  ; //({xsign, ~xend[i]});

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
case(ysn)
26'b11111111111111111111111111 : index=27'b000000000000000000000000001; 
26'b11111111111111111111111110 : index=27'b000000000000000000000000010; 
26'b11111111111111111111111100 : index=27'b000000000000000000000000100; 
26'b11111111111111111111111000 : index=27'b000000000000000000000001000; 
26'b11111111111111111111110000 : index=27'b000000000000000000000010000; 
26'b11111111111111111111100000 : index=27'b000000000000000000000100000; 
26'b11111111111111111111000000 : index=27'b000000000000000000001000000; 
26'b11111111111111111110000000 : index=27'b000000000000000000010000000; 
26'b11111111111111111100000000 : index=27'b000000000000000000100000000; 
26'b11111111111111111000000000 : index=27'b000000000000000001000000000; 
26'b11111111111111110000000000 : index=27'b000000000000000010000000000; 
26'b11111111111111100000000000 : index=27'b000000000000000100000000000; 
26'b11111111111111000000000000 : index=27'b000000000000001000000000000; 
26'b11111111111110000000000000 : index=27'b000000000000010000000000000; 
26'b11111111111100000000000000 : index=27'b000000000000100000000000000; 
26'b11111111111000000000000000 : index=27'b000000000001000000000000000; 
26'b11111111110000000000000000 : index=27'b000000000010000000000000000;  
26'b11111111100000000000000000 : index=27'b000000000100000000000000000;  
26'b11111111000000000000000000 : index=27'b000000001000000000000000000;                                                                 //Initializing index mux
26'b11111110000000000000000000 : index=27'b000000010000000000000000000;
26'b11111100000000000000000000 : index=27'b000000100000000000000000000;
26'b11111000000000000000000000 : index=27'b000001000000000000000000000;
26'b11110000000000000000000000 : index=27'b000010000000000000000000000;
26'b11100000000000000000000000 : index=27'b000100000000000000000000000;
26'b11000000000000000000000000 : index=27'b001000000000000000000000000;
26'b10000000000000000000000000 : index=27'b010000000000000000000000000;
26'b00000000000000000000000000 : index=27'b100000000000000000000000000;
default : index=27'b00000000000000000000000001; 
endcase
end


always @(*)
begin
case(ysn)                                                                 //Initializing index mux
27'b000000000000000000000000001 : a_b =index[1];
27'b000000000000000000000000010 : a_b =index[2];
27'b000000000000000000000000100 : a_b =index[3];
27'b000000000000000000000001000 : a_b =index[4];
27'b000000000000000000000010000 : a_b =index[5];
27'b000000000000000000000100000 : a_b =index[6];
27'b000000000000000000001000000 : a_b =index[7];
27'b000000000000000000010000000 : a_b =index[8];
27'b000000000000000000100000000 : a_b =index[9];
27'b000000000000000001000000000 : a_b =index[10];
27'b000000000000000010000000000 : a_b =index[11];
27'b000000000000000100000000000 : a_b =index[12];
27'b000000000000001000000000000 : a_b =index[13];
27'b000000000000010000000000000 : a_b =index[14];
27'b000000000000100000000000000 : a_b =index[15];
27'b000000000001000000000000000 : a_b =index[16];
27'b000000000010000000000000000 : a_b =index[17];
27'b000000000100000000000000000 : a_b =index[18];
27'b000000001000000000000000000 : a_b =index[19];
27'b000000010000000000000000000 : a_b =index[20];
27'b000000100000000000000000000 : a_b =index[21];
27'b000001000000000000000000000 : a_b =index[22];
27'b000010000000000000000000000 : a_b =index[23];
27'b000100000000000000000000000 : a_b =index[24];
27'b001000000000000000000000000 : a_b =index[25];
27'b010000000000000000000000000 : a_b =index[26];
27'b100000000000000000000000000 : a_b =index[27];
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
address =5'b00000;
else if( index[2]==1)
address = 5'b00001;
else if( index[3]==1)
address = 5'b00011;
else if( index[4]==1)
address = 5'b00011;
else if( index[5]==1)
address = 5'b00100;
else if( index[6]==1)
address = 5'b00101;
else if( index[7]==1)
address =5'b00110;
else if( index[8]==1)
address = 5'b01000;
else if( index[9]==1)
address = 5'b01001;
else if( index[10]==1)
address = 5'b01001;
else if( index[11]==1)
address = 5'b01011;
else if( index[12]==1)
address = 5'b01100;
else if( index[13]==1)
address = 5'b01101;
else if( index[14]==1)
address = 5'b01110;
else if( index[15]==1)
address = 5'b01111;
else if( index[16]==1)
address = 5'b10000;
else if( index[17]==1)
address = 5'b10001;
else if( index[18]==1)
address = 5'b10010;
else if( index[19]==1)
address = 5'b10011;
else if( index[20]==1)
address = 5'b10100;
else if( index[21]==1)
address = 5'b11001;
else if( index[22]==1)
address = 5'b11010;
else if( index[23]==1)
address = 5'b10111;
else if( index[24]==1)
address = 5'b11000;
else if( index[25]==1)
address = 5'b11001;
else if( index[26]==1)
address = 5'b11010;
else
address = 5'b11011;

end



blk_mem_gen_0 ablock (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(address),  // input wire [4 : 0] addra
  .dina(din),    // input wire [31 : 0] dina
  .douta(a)  // output wire [31 : 0] douta
);

blk_mem_gen_1 bblock (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(address),  // input wire [4 : 0] addra
  .dina(din),    // input wire [31 : 0] dina
  .douta(b)  // output wire [31 : 0] douta
);



always @(*)
begin
out = (a*x) + b;
end

endmodule