/*
			**** MULTIPLEXOR 2 A 1 ****
	El presente código implementa el diseño de un módulo multiplexor con 2 entradas y 1 Salida
	ademas del Selector quien mediante un case quien determinará que entrada será asignada a 
	la Salida.
	Se definen constantes para evaluar los casos a fin de evitar los números mágicos.
	Se asigna un valor antes de evaluar a fin de evitar latches.
	
*/
//Declaración del módulo y su lista de puertos
module Multiplexor2a1 (
	//Entradas
    input wire X,
    input wire Y,
    input wire [1:0] Selector,
	//Salida
    output reg Salida
);
	//Definición de constantes locales
    localparam ENTRADA1 = 2'b01;
    localparam ENTRADA2 = 2'b10;
	localparam DEFECTO = 1'b0;
	
	//Lista sensitiva
    always @(*) begin
		Salida = DEFECTO;  
        case (Selector) //Evaluación de  casos y asignación de salida
            ENTRADA1: Salida = X;
            ENTRADA2: Salida = Y;
            default:  Salida = DEFECTO;
        endcase 
    end

endmodule // Fin del módulo
