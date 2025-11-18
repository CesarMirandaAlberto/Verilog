/*
				**** CODIFICADOR 7 A 3 ****
		El presente código implementa el diseño de un módulo Codificador7a3 
		7 entradas y 3 salidas.
*/
//Definición del módulo y su lista de puertos
module Codificador7a3(
		input [6:0] X,
		output reg[2:0]Salida
);

// Definición de constantes
	localparam UNO = 7'b0000001;
	localparam DOS = 7'b0000010;
	localparam TRES = 7'b0000100;
	localparam CUATRO = 7'b0001000;
	localparam CINCO = 7'b0010000;
	localparam SEIS = 7'b0100000;
	localparam SIETE = 7'b1000000;
	localparam DEFECTO = 3'b000;

//lista sensitiva con todas las señales del módulo
	always@(*) begin
		Salida = DEFECTO;//Evitar latches
		//Case que asigna valores acorde a los estados de la entrada X
		case (X)
			UNO : Salida = 3'b001;
			DOS : Salida = 3'b010;
			TRES : Salida = 3'b011;
			CUATRO : Salida = 3'b100;
			CINCO : Salida = 3'b101;
			SEIS : Salida = 3'b110;
			SIETE : Salida = 3'b111;
			default: Salida = DEFECTO; //Evitar latches
		endcase
	end 
	
endmodule // Fin del módulo
