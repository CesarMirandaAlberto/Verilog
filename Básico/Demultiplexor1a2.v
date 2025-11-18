/*
				**** DEMULTIPLEXOR 1 A 2 ****
		El presente código verilog implementa el diseño de un módulo demultiplexor 1 entrada y 2 salidas
		el módulo consta de 2 entradaa de 1 bit 1 y el Selector de 2 bits y 2 salidas de 1 bit.
		
		Se implementa lógica combinacional para la asignación de las salidas al mismo tiempo que se asigna
		un valor defecto a las salidas para evitar latches.
		
*/
// Descripción del módulo y lista de puertos
module Demultiplexor1a2(
		input X,
		input [1:0] Selector,
		output reg Salida1,
		output reg Salida2
);
// Constantes para los valores del Selector
	localparam SALIDA_1 = 2'b01;
	localparam SALIDA_2 = 2'b10;
	localparam DEFECTO = 1'b0;
	
//List sensitiva con todas las señales
	always@(*) begin
	Salida1 = DEFECTO; // Evitar latches
    Salida2 = DEFECTO;
	
		case(Selector) // Case para evaluar los valores del Selector y asignar a las salidas
			SALIDA_1 : Salida1 = X;
			SALIDA_2 : Salida2 = X;
			default: begin
				Salida1 = DEFECTO;
				Salida2 = DEFECTO;
			end
		endcase
		
	end
endmodule // Fin del módulo
