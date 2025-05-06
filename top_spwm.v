module top_spwm(
input reset ,
input clk_int,
input [9:0]sel,
output spwm_1,
output spwm_2,
output spwm_3,
output c_spwm_1,
output c_spwm_2,
output c_spwm_3
//output [22:0] prod_ref
//output [10:0] sin_out
//output [10:0] tri_out
);
assign prod_ref = p;
assign c_spwm_1= ~(spwm_1);
assign c_spwm_2= ~(spwm_2);
assign c_spwm_3= ~(spwm_3);
wire a,b,c,d,e,f,g,h,i,j,k,s;
wire [11:0] l,m,n,t;
wire [10:0] o;
wire [22:0] p,q,r;


//assign sin_out=d;
//assign tri_out=e;

mux_2x1 MUX(
    .clk_5(a), 
    .clk_10(b),
    .clk_15(c), 
    .clk_20(d), 
    .clk_25(e), 
    .clk_30(f), 
    .clk_35(g), 
    .clk_40(h), 
    .clk_45(i), 
    .clk_50(j), 
    .s(sel), 
    .y(k)
);

clk_5Hz clk_5Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(a)
);

clk_10Hz clk_10Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(b)
);

clk_15Hz clk_15Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(c)
);

clk_20Hz clk_20Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(d)
);

clk_25Hz clk_25Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(e)
);

clk_30Hz clk_30Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(f)
);

clk_35Hz clk_35Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(g)
);

clk_40960 clk_40960hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(h)
);

clk_45Hz clk_45Hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(i)
);

clk_51200 clk_51200hz(
    .clk_in(clk_int), 
    .reset(reset), 
    .clk_out(j)
);

modulating_index_rom rom(
    .s(sel),
    .ma(o)
    );
    
ma_product ma1 (
    .sine(l),
    .ma(o), 
    .prod_ref(p)
    );
    
ma_product ma2 (
    .sine(m),
    .ma(o), 
    .prod_ref(q)
    );

ma_product ma3(
    .sine(n),
    .ma(o), 
    .prod_ref(r)
    );    
    
Clk_50mHz(
   .clk_in(clk_int),    
    .reset(reset),     
    .clk_out(s) 
);    

triangular_wave t_w(
    .clk_int(s), 
    .wave(t)
);

comparator comp_1(
    .sine(p), 
    .triangle(t), 
    .spwm(spwm_1)
);
comparator comp_2(
    .sine(q), 
    .triangle(t), 
    .spwm(spwm_2)
);
comparator comp_3(
    .sine(r), 
    .triangle(t), 
    .spwm(spwm_3)
);
LUT_method_1 S1(
    .data_out_1(l), 
    .Clk(k), 
    .reset(reset)
);

LUT_method_2 S2(
    .data_out_2(m),
    .Clk(k), 
    .reset(reset)
   );

LUT_method_3 S3(
    .data_out_3(n),
    .Clk(k), 
    .reset(reset)
   );

endmodule