module tb_spi_master;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;
reg miso;

wire sclk;
wire mosi;
wire cs;
wire busy;

spi_master dut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .start(start),
    .miso(miso),
    .sclk(sclk),
    .mosi(mosi),
    .cs(cs),
    .busy(busy)
);

always #5 clk = ~clk;

initial begin
    clk     = 0;
    rst     = 1;
    start   = 0;
    data_in = 8'b10110011;
    miso    = 0;

    #20;
    rst = 0;

    #10;
    start = 1;

    #10;
    start = 0;

    #300;
    $finish;
end

endmodule