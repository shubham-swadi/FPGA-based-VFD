module mux_2x1 (
    input wire clk_5,      
    input wire clk_10, 
    input wire clk_15,
    input wire clk_20,
    input wire clk_25,
    input wire clk_30,
    input wire clk_35,
    input wire clk_40,
    input wire clk_45,
    input wire clk_50,
    input wire [9:0] s,    
    output reg y    
);
   always@(*)
   begin
   case(s)
   10'd1 : y=clk_5;
   10'd3 : y=clk_10;
   10'd7 : y=clk_15;
   10'd15 : y=clk_20; 
   10'd31 : y=clk_25;
   10'd63 : y=clk_30;
   10'd127 : y=clk_35;
   10'd255 : y=clk_40;
   10'd511 : y=clk_45;
   10'd1023 : y=clk_50;
   default : y=clk_50;
   endcase
   end
endmodule