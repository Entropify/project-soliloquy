/*
 * Copyright (c) 2026 Zhiyuan (Jerry) Jiang
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

 module alu_control (
    input wire [1:0] alu_op,
    input wire func7,
    input wire [2:0] func3,
    output reg [3:0] alu_control_out
 );

 always @(*) begin

    if (alu_op == 2'b00) begin  // I/S-type
        alu_control_out = 4'b0010;
    end

    else if (alu_op == 2'b01) begin// B-type
        alu_control_out = 4'b0110;
    end

    else if (alu_op == 2'b10) begin // R-type

        if (func3 == 3'b000 && func7 == 1'b0) begin // add
            alu_control_out = 4'b0010;
        end

        else if (func3 == 3'b000 && func7 == 1'b1) begin // sub
            alu_control_out = 4'b0110;
        end

        else if (func3 == 3'b111 && func7 == 1'b0) begin // and
            alu_control_out = 4'b0000;
        end

        else if (func3 == 3'b110 && func7 == 1'b0) begin // or
            alu_control_out = 4'b0001;
        end

        else begin // Safety for unknown R-type signal
            alu_control_out = 4'b0000;
        end

    end

    else begin // Safety for unknown alu_op signal
            alu_control_out = 4'b0000;
        end

 end



 endmodule