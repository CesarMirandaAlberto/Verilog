/*
				**** DECODIFICADOR BINARIO A GRAY *****
		EL presente código verilog implementa un módulo decodificador binario a gray de cuatro bits
		implementando lógica combinacional. EL módulo consta de una entrada(Binario) y una salida (Gray)
		ambas de 4 bits.

*/

//Declaración del módulo y lista de puertos
module DecodificadorBinario_Gray(
		input [3:0] Binario,
		output reg [3:0] Gray
);

// Definición de constantes
	localparam CERO = 4'b0000;
	localparam UNO = 4'b0001;
	localparam DOS = 4'b0010;
	localparam TRES = 4'b0011;
	localparam CUATRO = 4'b0100;
	localparam CINCO = 4'b0101;
	localparam SEIS = 4'b0110;
	localparam SIETE = 4'b0111;
	localparam OCHO = 4'b1000;
	localparam NUEVE = 4'b1001;
	localparam DIEZ = 4'b1010;
	localparam ONCE = 4'b1011;
	localparam DOCE = 4'b1100;
	localparam TRECE = 4'b1101;
	localparam CATORCE = 4'b1110;
	localparam QUINCE = 4'b1111;

//Lista sensitiva con todas las señales del módulo	
	always@(*) begin 
		Gray = 4'b0000; // Evitar latches
			case (Binario) // Case que evalua y asigna valores a la salida acorde a los estados de la entrada
					CERO : Gray = 4'b0000;
					UNO : Gray = 4'b0001;
					DOS : Gray = 4'b0011;
					TRES : Gray = 4'b0010;
					CUATRO : Gray = 4'b0110;
					CINCO : Gray = 4'b0111;
					SEIS : Gray = 4'b0101;
					SIETE : Gray = 4'b0100;
					OCHO : Gray = 4'b1100;
					NUEVE : Gray = 4'b1101;
					DIEZ : Gray = 4'b1111;
					ONCE : Gray = 4'b1110;
					DOCE : Gray = 4'b1010;
					TRECE : Gray = 4'b1011;
					CATORCE : Gray = 4'b1001;
					QUINCE : Gray = 4'b1000;
					default: Gray = 4'b0000; // Evitar latches
			endcase
	end
endmodule //fin del módulo