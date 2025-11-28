/*
				**** MEDIO RESTADOR ***
				
		El presente código implementa el diseño de un medio restado a nivel compuertas lógicas
		el módulo consta de 2 entradas y 2 salidas de un bit X,Y, R=Resta, AN= Acarreo negativo
		ademas que se implementa asignamiento continuo para la asignación de las operaciones 
		con compuertas.
		
*/

//Definición del módulo y lista de puertos
module Medio_Restador(
	input X,
	input Y,
	output R,
	output AN
);
	//Asignamiento de operaciones
	assign R = X ^ Y;
	assign AN = (~X) & Y;
	
endmodule // Fin del módulo
