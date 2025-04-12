`timescale 1ns/1ps
module mac(in_a, in_b, in_valid_a, in_valid_b, clk, reset, mac_out);

// input output declaration
input signed [3:0] in_a, in_b;
input in_valid_a,in_valid_b;
input clk, reset;
output reg signed [10:0] mac_out;

parameter IDLE = 2'b00;
parameter WAIT_A = 2'b01;
parameter WAIT_B = 2'b10;
parameter MAC = 2'b11;

reg [1:0] state_next, state;
reg signed [3:0] reg_a, reg_b;

always@ (negedge clk)
if(reset)
mac_out <= 11'b0;

always@ (posedge clk)
begin
if(reset)
state <= IDLE;
else
state <= state_next;
end

always@ (*)
begin
case (state)
IDLE: if(in_valid_a&in_valid_b)
state_next = MAC;
else if(in_valid_a)
state_next = WAIT_B;
else if(in_valid_b)
state_next = WAIT_A;
else state_next = IDLE;

WAIT_A: if(in_valid_a)
state_next = MAC;
else state_next = WAIT_A;

WAIT_B: if(in_valid_b)
state_next = MAC;
else state_next = WAIT_B;

MAC: if(in_valid_a&in_valid_b)
state_next = MAC;
else if(in_valid_a)
state_next = WAIT_B;
else if(in_valid_b)
state_next = WAIT_A;
else state_next = IDLE;

default: state_next = IDLE;
endcase
end

always@ (posedge clk)
begin
if(in_valid_a)
reg_a <= in_a;
end

always@ (posedge clk)
begin
if(in_valid_b)
reg_b <= in_b;
end

always@ (negedge clk)
begin
if(reset)
mac_out <= 11'd0;
else if(in_valid_a&in_valid_b)
mac_out <= reg_a*reg_b;
else if(state == MAC)
mac_out <= mac_out + (reg_a*reg_b);
else
mac_out <= 11'd0;
end
endmodule
