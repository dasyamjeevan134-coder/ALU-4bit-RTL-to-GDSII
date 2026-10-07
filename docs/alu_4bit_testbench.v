`timescale 1ns/1ps

module tb_alu_4bit;

    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] ALU_Sel;
    wire [3:0] Y;

    alu_4bit DUT (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .Y(Y)
    );

    initial begin

        // Addition: 5 + 3 = 8
        A = 4'd5;
        B = 4'd3;
        ALU_Sel = 2'b00;
        #10;

        // Subtraction: 5 - 3 = 2
        A = 4'd5;
        B = 4'd3;
        ALU_Sel = 2'b01;
        #10;

        // AND: 5 & 3 = 1
        A = 4'd5;
        B = 4'd3;
        ALU_Sel = 2'b10;
        #10;

        // OR: 5 | 3 = 7
        A = 4'd5;
        B = 4'd3;
        ALU_Sel = 2'b11;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | A=%d | B=%d | Sel=%b | Y=%d",
                 $time, A, B, ALU_Sel, Y);
    end

endmodule
