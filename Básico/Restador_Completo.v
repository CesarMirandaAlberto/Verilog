/*
				**** RESTADOR COMPLETO 1 BIT ****
				
		El presente código implementa el diseño de un restador completo de 1 bit a nivel
		estructural.
			** ESTRUCTURA DEL DISEÑO **
				* Medio_Restador.v
				* Restador_Completo.v
		Se hace instanciación del Medio_Restador en 2 ocaciones y se implementan en cascada
		a fin de formar el restador completo, ademas que se implementan señales internas 
		(wire) para conectar en cascada los medios restadores.
		**NOTAS**
		Dado que el diseño es a nivel estructural es necesario compilar los módulos instanciados
		acorde al orden de la estrura del diseño.
		MR = Medio Restador.
		Finalmente mediante asignamiento continuo se hace una OR (suma) de los acarreos negativos
		de los medios sumadores.
*/

//Definición del módulo y lista de puertos
module Restador_Completo(
	input X,
	input Y,
	input CarrieNEntrada,
	output R,
	output CarrieNSalida
);
	//Señales internas
	wire Resta1;
	wire CarrieN1;
	wire CarrieN2;
	
	//Instanciaciones y mapeo de señales
	Medio_Restador MR1(.X(X), .Y(Y), .R(Resta1), .AN(CarrieN1));
	Medio_Restador MR2(.X(Resta1), .Y(CarrieNEntrada), .R(R), .AN(CarrieN2));
	
	//Suma de Acarreos negativos
	assign CarrieNSalida = CarrieN1 | CarrieN2;
	
endmodule // Fin del módulo
