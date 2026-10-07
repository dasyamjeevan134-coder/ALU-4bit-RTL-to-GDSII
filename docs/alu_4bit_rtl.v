module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [1:0] ALU_Sel,
    output reg [3:0] Y
);

always @(*) begin
    case (ALU_Sel)

        2'b00: Y = A + B;   // Addition
        2'b01: Y = A - B;   // Subtraction
        2'b10: Y = A & B;   // AND
        2'b11: Y = A | B;   // OR

        default: Y = 4'b0000;

    endcase
end

endmodule
