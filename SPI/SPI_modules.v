////modulo maestro
module Master(
    input clk,
    input rst,
    input start,
    input [7:0] tx_data,
    input miso,
    output reg mosi,
    output reg sclk,
    output reg ss
);

///estadossss
localparam IDLE  = 2'b00, START = 2'b01, SHIFT = 2'b10, STOP  = 2'b11;

reg [1:0] state;
reg [7:0] shift_reg;
reg [3:0] bit_count;
reg [3:0] clk_cnt;

//falta

endmodule


//modulo eclavo
module slave(
    input clk,
    input sclk,
    input smosi,
    input sss,
    output reg smiso
);

reg [7:0] rx_reg;
reg sclk_old;

//apartado por agregar

endmodule


////////topmodule spi
module SPI_top (
    input CLK, 
    input RST, 
    input START, 
    input [7:0] DATA
);

wire c1, c2, c3, c4;

Master m1 (
    .clk(CLK), 
    .rst(RST), 
    .start(START), 
    .tx_data(DATA),
    .miso(c4), 
    .mosi(c1), 
    .sclk(c2), 
    .ss(c3)
);

slave s1 (
    .clk(CLK), 
    .sclk(c2), 
    .smosi(c1), 
    .sss(c3), 
    .smiso(c4)
);

endmodule
