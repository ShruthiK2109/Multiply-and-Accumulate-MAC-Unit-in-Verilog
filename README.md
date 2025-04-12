# Multiply-and-Accumulate-MAC-Unit-in-Verilog
Overview of the Design:

This project implements a MAC (Multiply and Accumulate) module using Verilog HDL, a fundamental block used in DSP (Digital Signal Processing), neural networks, and signal/image processing systems. The MAC unit multiplies two signed 4-bit inputs and accumulates the result over time depending on the input validity signals. It is designed as a finite state machine (FSM) and includes a basic testbench to simulate its behavior.

Working of MAC Unit: 

Multiplication: The MAC Unit takes two input operands and multiplies them together using hardware multiplier circuits or algorithms.

Accumulation: The result of the multiplication is then added to an accumulation regsiter. This accumulator stores the accumulated sum of all multiplication results computed by the MAC unit.

Output: The final output of the MAC unit is the value stored in the accumulator after all the multiplication and accumulation operations have been completed.

Module Details:

Inputs:

in_a: Signed 4-bit input A.

in_b: Signed 4-bit input B.

in_valid_a: Input A validity signal.

in_valid_b: Input B validity signal.

clk: Clock signal.

reset: Active-high synchronous reset.

Output:

mac_out: Signed 11-bit output which holds the accumulated result.

FSM states:

IDLE: Waits for valid inputs.

WAIT_A: Waits for valid in_a after getting valid in_b.

WAIT_B: Waits for valid in_b after getting valid in_a.

MAC: Performs multiply-and-accumulate operation.

When both in_valid_a and in_valid_b are high, the inputs are stored in internal registers reg_a and reg_b, and their product is added to the accumulated mac_out value.

