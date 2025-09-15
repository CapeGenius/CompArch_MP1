module top(

    // declared relevant input and output logic for project
    input logic     clk,
    output logic    RGB_B,
    output logic    RGB_R,
    output logic    RGB_G,
);

    // defined the interval as every 2000000 cycles -- or 1/6th second until 2^31
    parameter interval = 2000000;
    logic [31:0] counter = 0;

    // assigns single bit values to each rgb color
    initial begin
        RGB_R = 1'b1;
        RGB_G = 1'b0;
        RGB_B = 1'b0;
    end
    
    // always loop to use clock --> alternate everytime counter reaches 200,000
    always_ff @(posedge clk) begin
        if (counter == interval) begin
            counter <= 0;

            // based on truth table of color theory

            if (RGB_R == 1 && RGB_G == 0 && RGB_B == 0) begin // red
                RGB_G <= 1;
            end
            else if (RGB_R == 1 && RGB_G == 1 && RGB_B == 0) begin // yellow 
                RGB_R <= 0; // red + green = yellow
            end
            else if (RGB_R == 0 && RGB_G == 1 && RGB_B == 0) begin // green
                RGB_B <= 1;
            end
            else if (RGB_R == 0 && RGB_G == 1 && RGB_B == 1) begin // cyan
                RGB_G <= 0; // green + blue = cyan
            end
            else if (RGB_R == 0 && RGB_G == 0 && RGB_B == 1) begin // blue
                RGB_R <= 1;
            end
            else if (RGB_R == 1 && RGB_G == 0 && RGB_B == 1) begin // magenta
                RGB_B <= 0; // red + blue = magenta
            end
        end else begin
            counter <= counter + 1;
        end
    end
    
    
    

endmodule