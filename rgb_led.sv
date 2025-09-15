module top(
    input logic     clk,
    output logic    RGB_B,
    output logic    RGB_R,
    output logic    RGB_G,
);
    parameter interval = 2000000;
    logic [31:0] counter = 0;

    initial begin
        RGB_R = 1'b1;
        RGB_G = 1'b0;
        RGB_B = 1'b0;
    end
    
    always_ff @(posedge clk) begin
        if (counter == interval) begin
            counter <= 0;

            if (RGB_R == 1 && RGB_G == 0 && RGB_B == 0) begin // red
                RGB_G <= 1;
            end
            else if (RGB_R == 1 && RGB_G == 1 && RGB_B == 0) begin // yellow 
                RGB_R <= 0;
            end
            else if (RGB_R == 0 && RGB_G == 1 && RGB_B == 0) begin // green
                RGB_B <= 1;
            end
            else if (RGB_R == 0 && RGB_G == 1 && RGB_B == 1) begin // cyan
                RGB_G <= 0;
            end
            else if (RGB_R == 0 && RGB_G == 0 && RGB_B == 1) begin // blue
                RGB_R <= 1;
            end
            else if (RGB_R == 1 && RGB_G == 0 && RGB_B == 1) begin // magenta
                RGB_B <= 0;
            end
        end else begin
            counter <= counter + 1;
        end
    end
    
    
    

endmodule