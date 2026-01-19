/*
					**** DECODER BCD 7 SEGMENTOS ****
					
	El presente código implementa el diseño de un módulo decoder bcd que se exhibe en un
	display 7 segmentos de ánodo común.
	Se implementan constantes para evitar números mágicos al mismo tiempo que dentro de la
	lista sensitiva se asigna un valor por defecto para evitar latches.
	
*/

// Definición del módulo y lista de puertos
module DecoderBCD_7Seg(
	input [3:0] Binario,
	output reg [6:0] Decimal
);
	// DEFINICIÓN DE CONSTANTES PARA DISPLAY 7 SEGMENTOS
	parameter NUMEROCERO = 7'b1000000;
	parameter NUMEROUNO = 7'b1111001;
	parameter NUMERODOS = 7'b0100100;
	parameter NUMEROTRES = 7'b0110000;
	parameter NUMEROCUATRO = 7'b0011001;
	parameter NUMEROCINCO = 7'b0010010;
	parameter NUMEROSEIS = 7'b0000010;
	parameter NUMEROSIETE = 7'b1111000;
	parameter NUMEROOCHO = 7'b0000000;
	parameter NUMERONUEVE = 7'b0011000;
	parameter APAGADO = 7'b1111111;
	
	// Lista sensitiva
	always@(*) begin
		Decimal = APAGADO;
		
		case (Binario) // Evaluación de la entrada en Binario
			4'b0000: Decimal = NUMEROCERO;
			4'b0001: Decimal = NUMEROUNO;
			4'b0010: Decimal = NUMERODOS;
			4'b0011: Decimal = NUMEROTRES;
			4'b0100: Decimal = NUMEROCUATRO;
			4'b0101: Decimal = NUMEROCINCO;
			4'b0110: Decimal = NUMEROSEIS;
			4'b0111: Decimal = NUMEROSIETE;
			4'b1000: Decimal = NUMEROOCHO;
			4'b1001: Decimal = NUMERONUEVE;
			default : Decimal = APAGADO;
		endcase
	end // Fin de la lista sensitiva
	
endmodule// Fin del módulo
