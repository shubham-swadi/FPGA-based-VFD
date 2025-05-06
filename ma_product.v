module ma_product (
    input  [11:0] sine,
    input  [10:0] ma,
    output [22:0] prod_ref
);

    reg [22:0] product;
    integer i;

    always @(*) begin
        product = 23'b0;
        for (i = 0; i < 11; i = i + 1) begin
            if (ma[i])
                product = product + (sine << i);
        end
    end

    assign prod_ref = product/10;

endmodule
