/*
		**** DECODIFICADOR BINARIO A HEXADECIMAL ****
		
	El presente código verilog implementa el diseño de un módulo decodificador binario a hexadecimal
	el cual consta de una entrada de 4 bits y una salida de 7 se implementa lógica combinacional y uso
	de case para evaluar los estados de la entrada binaria al mismo tiempo que antes de case y en estados
	diferentes de la entrada binaria se establece un valor defecto para evitar latches.
	Este módulo fue diseñado y bajado en un FPGA DE-10 Lite en un display siete segmentos de ánodo común.
*/
//Declaración del módulo y su lista de puertos
module DecodificadorBinario_Hexadecimal(
		input [3:0] Binario,
		output reg [6:0] Hexadecimal
);
	// Digitos en hexadecimal
	localparam CERO = 7'b1000000;
	localparam UNO = 7'b1111001;
	localparam DOS = 7'b0100100;
	localparam TRES = 7'b0110000;
	localparam CUATRO = 7'b0011001;
	localparam CINCO = 7'b0010010;
	localparam SEIS = 7'b0000010;
	localparam SIETE = 7'b1111000;
	localparam OCHO = 7'b0000000;
	localparam NUEVE = 7'b0011000;
	localparam A = 7'b0001000;
	localparam B = 7'b0000011;
	localparam C = 7'b1000110;
	localparam D = 7'b0100001;
	localparam E = 7'b0000110;
	localparam F = 7'b0001110;
	localparam APAGADO = 7'b1111111;
	
	//Lista sensitiva con todas las señales
		always@(*) begin
				Hexadecimal = APAGADO; // Evitar latches
				
				case (Binario) // Evaluación de estados del binario
					4'b0000: Hexadecimal = CERO;
					4'b0001: Hexadecimal = UNO;
					4'b0010: Hexadecimal = DOS;
					4'b0011: Hexadecimal = TRES;
					4'b0100: Hexadecimal = CUATRO;
					4'b0101: Hexadecimal = CINCO;
					4'b0110: Hexadecimal = SEIS;
					4'b0111: Hexadecimal = SIETE;
					4'b1000: Hexadecimal = OCHO;
					4'b1001: Hexadecimal = NUEVE;
					4'b1010: Hexadecimal = A;
					4'b1011: Hexadecimal = B;
					4'b1100: Hexadecimal = C;
					4'b1101: Hexadecimal = D;
					4'b1110: Hexadecimal = E;
					4'b1111: Hexadecimal = F;
					default: Hexadecimal = APAGADO;// Evitar latches 
				endcase // Fin del case
		end
endmodule // Fin del módulo
