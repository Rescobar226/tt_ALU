module tt_um_Rescobar_alu (
    input  wire [7:0] io_in,     // Entradas (A[3:0], B[3:0])
    output wire [7:0] io_out,    // Salidas (resultado[3:0], flags o LEDs)
    input  wire       clk,       // Requerido por Tiny Tapeout
    input  wire       reset,     // Requerido por Tiny Tapeout
    input  wire       ena,       // Requerido por Tiny Tapeout
    input  wire [7:0] uio_in,    // No usado, pero necesario
    output wire [7:0] uio_out,   // No usado
    output wire [7:0] uio_oe     // No usado
);

    // Ignorar señales no utilizadas
    wire _unused_clk   = clk;
    wire _unused_rst   = reset;
    wire _unused_ena   = ena;
    wire [7:0] _unused_uio_in = uio_in;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // -------------------------
    // Entradas
    // -------------------------
    wire [3:0] A = io_in[3:0];   // Primer operando (SW[3:0])
    wire [1:0] op = io_in[5:4];  // Operación a realizar
    wire [1:0] shift_sel = io_in[7:6]; // Control de desplazamiento (opcional)

    wire [3:0] B = io_in[3:0]; // Segundo operando igual que A (Tiny Tapeout limita entradas)

    // -------------------------
    // Resultado
    // -------------------------
    reg [3:0] result;

    always @(*) begin
        case (op)
            2'b00: result = A + B;             // Suma
            2'b01: result = A - B;             // Resta
            2'b10: result = A & B;             // AND
            2'b11: result = A | B;             // OR
            default: result = 4'b0000;
        endcase
    end

    // -------------------------
    // Salidas
    // -------------------------
    assign io_out[3:0] = result;        // Resultado ALU
    assign io_out[7:4] = 4'b0000;       // Se puede usar para flags o leds extra

endmodule
