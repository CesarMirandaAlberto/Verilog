/*
							**** DEMULTIPLEXOR 1 A 4 ****
		El presente código verilog implementa el diseño del módulo Demultiplexor 1 a 4
		1 entrada y 4 salidas con un acho de 4 bits:
		El módulo consta ademas del Selector de 3 bits el cual cuyos valores determinarán la salida
		que será asignada el valor de entrada.
		NOTA:
		Apesar que solo se necesitan 2 bits para las combinaciones 1 para cada entrada en este caso
		se implementa el Selector de 3 bits a fin de evaluar mas casos de prueba y verificar que funcione
		correctamente el código.
*/
//Definición del módulo y su lista de puertos 
module Demultiplexor1a4(
	input [3:0] X,
	input [2:0] Selector,
	output reg [3:0] A,
	output reg [3:0] B,
	output reg [3:0] C,
	output reg [3:0] D
);
//Definición de constantes
	localparam SALIDA1 = 3'b001;
	localparam SALIDA2 = 3'b010;
	localparam SALIDA3 = 3'b011;
	localparam SALIDA4 = 3'b100;
	localparam DEFECTO = 4'b0000;
	
	//Lista sensitiva con todas las señales
	always@(*) begin
		A = DEFECTO; B = DEFECTO; //Evitar latches
		C = DEFECTO; D = DEFECTO;
		
		case(Selector) //Case que evalua los valores del selector y asigna a las salidas
				SALIDA1: A = X;
				SALIDA2: B = X;
				SALIDA3: C = X;
				SALIDA4: D = X;
				default: begin
					A = DEFECTO; B = DEFECTO;
					C = DEFECTO; D = DEFECTO;
				end
		endcase
	end
	
endmodule // Fin del módulo
