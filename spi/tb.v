module tb_spi_master;

reg clk;
reg rst;
reg start;
reg [7:0] tx_data;
reg miso;

wire sclk;
wire mosi;
wire cs;
wire busy;

spi_master dut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .tx_data(tx_data),
    .miso(miso),
    .sclk(sclk),
    .mosi(mosi),
    .cs(cs),
    .busy(busy)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst     = 1;
    start   = 0;
    tx_data = 8'b10110011;
    miso    = 0;

    #20;
    rst = 0;

    #10;
    start = 1;

    #10;
    start = 0;

    #200;
    $finish;
end

