module modulating_index_rom(
    input [9:0] s,
    output reg [10:0] ma
    );

always @(*) begin
   case(s) 
   10'd1 : ma= 1;
   10'd3 : ma= 2;
   10'd7 : ma= 3;
   10'd15 : ma= 4; 
   10'd31 : ma= 5;
   10'd63 : ma= 6;
   10'd127 : ma= 7;
   10'd255 : ma= 8;
   10'd511 : ma= 9;
   10'd1023 : ma= 10;
   default : ma= 0;
   endcase
   end
endmodule