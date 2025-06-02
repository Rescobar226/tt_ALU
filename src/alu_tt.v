module tt_um_Rescobar_alu (
    input  wire [7:0] io_in,   // Control de operación y selección
    output wire [7:0] io_out
);

    // Mapas de entrada:
    // io_in[1:0]   = sel_op
    // io_in[7:4]   = B
    // io_in[3:0]   = A

    wire [3:0] A = io_in[3:0];
    wire [3:0] B = io_in[7:4];
    wire [1:0] sel = io_in[1:0];

    reg [7:0] result;

    always @(*) begin
        case (sel)
            2'b00: result = A + B;         // Suma
            2'b01: result = A - B;         // Resta
            2'b10: result = A & B;         // AND
            2'b11: result = A | B;         // OR
            // Puedes extender a más operaciones si se asigna más espacio de control
        endcase
    end

    assign io_out = result;

endmodule
