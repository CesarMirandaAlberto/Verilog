/*
			**** MULTIPLEXOR 4 A 1 ****
	El presente código implementa el diseño de un módulo multiplexor de 4 entradas y una Salida ademas
	del selector que mediante lógica combinacional determina que entrada será asignada a la salida.
	
	Las entradas y salida tienen un ancho de 3 bits al igual que el selector.
	Dado que solo se necesitan 2 bits para las 4 entradas el selector se implementa a 3 bits para cubrir
	casos donde no se asigna nada y comprobar que no se generan latches.
	
	NOTA: Definición de constantes para evitar número mágicos.
*/

//Declaración del módulo y lista de puertos
module Multiplexor4a1(
	//Entradas
	input [2:0]A,
	input [2:0]B,
	input [2:0]C, 
	input [2:0]D,
	input [2:0] Selector,
	//Salida
	output reg [2:0] Salida
);

	//Definición de cosntantes
	localparam ENTRADA1 = 3'b001;
	localparam ENTRADA2 = 3'b010;
	localparam ENTRADA3 = 3'b011;
	localparam ENTRADA4 = 3'b100;
	localparam DEFECTO = 3'b000;
	
	//Lista sensitiva con todas las señales del módulo
	always@(*)begin
		Salida = DEFECTO;
		//Asignación de salida mediante case en base a la lectura del selector
		case(Selector)
			ENTRADA1 : Salida = A;
			ENTRADA2 : Salida = B;
			ENTRADA3 : Salida = C;
			ENTRADA4 : Salida = D;
			default : Salida = DEFECTO; //Evitar latches
		endcase
	end

endmodule//Fin del módulo
