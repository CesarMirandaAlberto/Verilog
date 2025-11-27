/*
						**** MEDIO SUMADOR ****	
						
		El presente código verilog implementa el diseño de un módulo  medio sumador a nivel compuertas lógicas.
		El código consta de 2 entradas y 2 salidas de 1 bit, mientras que se implementa  asignamiento continuo 
		para la asignación de las operaciones con compuertas lógicas.

*/

//Declaración del módulo y su lista de puertos
module Medio_Sumador(
		input X,
		input Y,
		output Salida,
		output CarrieSalida
);
	//Asignamiento continuo
	assign Salida = X ^ Y;
	assign CarrieSalida = X & Y;
	
endmodule // Fin del módulo
