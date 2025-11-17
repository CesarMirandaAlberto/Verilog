/*
		**** COMPUERTAS LOGICAS ****
	El presente código verilog implementa las compuertas lógicas
	utilizando asignamiento continuo.
	Para cada compuera lógica esta establecida una salida S=Salida seguido de la compuerta
	que almacenará (ej  Sand = Salida And.
	
*/
//Definición del módulo y su lista de puertos de Entradas(input) Salidas(output)
module Compuertas_Logicas(

	input X,
	input Y,

	output wire Sand,
	output wire Sor,
	output wire Snot,
	output wire Snand, 
	output wire Sxor,
	output wire Snor
);
	//Asignación de compuertas lógicas a las salidas
	assign Sand = X & Y;
	assign Sor = X | Y;
	assign Snot = ~X;
	assign Snand = ~(X & Y);
	assign Snor = ~(X | Y);
	assign Sxor = X ^ Y;
	
endmodule // Fin del módulo
