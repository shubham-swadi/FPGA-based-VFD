module mo_product (
input [11:0] sine,
input [10:0] ma, 
output [22:0] prod_ref);

assign prod_ref = ma*sine;
endmodule 