
`timescale 1ns/1ps

module tb_counter;

    reg clk = 0;
    reg rst;
    wire [3:0] count;

    reg [3:0] expected_count = 4'b0000;
  
    counter dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );


    always #5 clk = ~clk;

 
    initial begin
        rst = 1;
        #12;
        rst = 0;
        #200;
        $finish;
    end


    always @(negedge clk) begin
        if (rst)
            expected_count = 4'b0000;
        else
            expected_count = expected_count + 1'b1;
    end

   
    always @(negedge clk) begin
        #1;
        if (count !== expected_count) begin
            $display("ERROR: Mismatch at time %0t | Expected: %d | Actual: %d",
                     $time, expected_count, count);
        end
        else begin
            $display("PASS: Matched at time %0t | Count: %d",
                     $time, count);
        end
    end

  
    initial begin
        $monitor("Time=%0t | Clock=%b | Reset=%b | Count=%d",
                 $time, clk, rst, count);
    end


    initial begin
        $dumpfile("tb_counter.vcd");
        $dumpvars(0, tb_counter);
    end

endmodule
