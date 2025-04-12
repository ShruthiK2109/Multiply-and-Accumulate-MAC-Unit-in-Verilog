`timescale 1ns/1ps

module mac_tb;
reg [3:0] in_a, in_b;
reg in_valid_a, in_valid_b;
reg clk, reset;
wire [10:0] mac_out;

mac u_mac( .mac_out(mac_out),
.in_a(in_a),
.in_b(in_b),
.in_valid_a(in_valid_a),
.in_valid_b(in_valid_b),
.clk(clk),
.reset(reset)
);

initial begin
clk = 1'b0; 
reset = 1'b1;
end
always begin #(5) clk =~clk; // clock generation
end

initial begin
in_a = 0110; in_b = 0001; in_valid_a = 0; in_valid_b = 0;
#50; reset = 1'b0;
in_a = 1010; in_b = 0001; in_valid_a = 0; in_valid_b = 1;
#20;
in_a = 0110; in_b = 0001; in_valid_a = 1; in_valid_b = 0;
#30;
in_a = 0010; in_b = 0001; in_valid_a = 1; in_valid_b = 1;
#40;
in_a = 0010; in_b = 1001; in_valid_a = 1; in_valid_b = 1;

end

initial #500 $finish;
endmodule

