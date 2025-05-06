module clk_45Hz( 
    input wire clk_in,    
    input wire reset,     
    output reg clk_out    
);
    reg [12:0] counter;   
    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == 260) begin  // Changed from 196 to 294
                counter <= 0;           
                clk_out <= ~clk_out;    
            end else begin
                counter <= counter + 1; 
            end
        end
    end
endmodule