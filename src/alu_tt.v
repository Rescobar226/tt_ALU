module tt_um_Rescobar_alu (
    input  wire [7:0] io_in,     // Entradas: A[3:0], OP[1:0], Shift[1:0] (no todos se usan)
    output wire [7:0] io_out,    // Salidas: resultado y banderas opcionales
    input  wire       clk,       // Requerido por Tiny Tapeout
    input  wire       rst_n,     // Reset activo bajo (corregido)
    input  wire       ena,       // Enable, no usado en este diseño
    input  wire [7:0] uio_in,    // No usado
    output wire [7:0] uio_out,   // No usado
    output wire [7:0] uio_oe     // No usado
);

    // Ignorar señales no utilizadas
    wire _unused_clk   = clk;
    wire _unused_rst_n = rst_n;
    wire _unused_ena   = ena;
    wire [7:0] _unused_uio_in = uio_in;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // -------------------------
    // Entradas
    // -------------------------
    wire [3:0] A = io_in[3:0];       // Operando A
    wire [1:0] op = io_in[5:4];      // Operación a realizar
    wire [3:0] B = io_in[3:0];       // B = A, por restricción de pines

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

    // -------------------------
    // Salidas
    // -------------------------
    assign io_out[3:0] = result;
    assign io_out[7:4] = 4'b0000; // Reservado o para debug

endmodule
