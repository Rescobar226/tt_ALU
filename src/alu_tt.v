module tt_um_Rescobar_alu (
    input  wire [7:0] ui_in,     // Entradas: A[3:0], op[1:0], resto reservado
    output wire [7:0] uo_out,    // Salidas: resultado y banderas
    input  wire [7:0] uio_in,    // I/O no utilizados
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       clk,       // Reloj
    input  wire       rst_n,     // Reset activo bajo
    input  wire       ena        // Enable general
);

    // -------------------------
    // Ignorar I/O no usados
    // -------------------------
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // -------------------------
    // Entradas
    // -------------------------
    wire [3:0] A  = ui_in[3:0];  // Operando A
    wire [3:0] B  = ui_in[3:0];  // Por limitación, B = A
    wire [1:0] op = ui_in[5:4];  // Código de operación

    // -------------------------
    // Resultado
    // -------------------------
    reg [3:0] result;

    always @(*) begin
        case (op)
            2'b00: result = A + B;   // Suma
            2'b01: result = A - B;   // Resta
            2'b10: result = A & B;   // AND
            2'b11: result = A | B;   // OR
            default: result = 4'b0000;
        endcase
    end

    assign uo_out[3:0] = result;
    assign uo_out[7:4] = 4'b0000; // Reservado

endmodule
