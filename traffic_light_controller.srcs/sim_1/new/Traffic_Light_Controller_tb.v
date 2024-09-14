`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2020 23:44:40
// Design Name: 
// Module Name: Traffic_Light_Controller_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Traffic_Light_Controller_TB;
    reg clk, rst;
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    // Instantiate DUT (Device Under Test)
    Traffic_Light_Controller dut (
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_S(light_S),
        .light_M2(light_M2),
        .light_MT(light_MT)
    );

    // Clock generation (1ns period for faster simulation)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period (100MHz clock)
    end

    // Simulation control
    initial begin
        // Test reset functionality
        rst = 1;
        #10; // 10 time units for reset
        rst = 0;
        
        // Let the simulation run for 2000 time units
        #2000;
        $finish;
    end
endmodule