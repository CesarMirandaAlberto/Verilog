/*
					**** RESTADOR DE 4 BITS ****
					
		El presente código implementa el diseño de un Restador de 4 bits a nivel estructural
		por lo que se hace instanciación de dos módulos extra:
			**ESTRUCTURA DEL DISEÑO **
				* Medio_Restador.v
				* Restador_Completo.v
				* Restador4_Bits.v
		el diseño del  Restador de 4 Bits consta de 4 restadores de 1 bit conectados en cascada
		para lo cual se implementan señales internas para realizar las conexiones entre módulos
		y al final se implementa asignamiento continuo para asignar el acarreo negativo final.
		** NOTAS **
			Para el compilado del diseño debe ser en el orden en el que esta la estructura del
			diseño.
*/

//Definición del módulo y lista de puertos de entrada y salida
module Restador4_Bits(
	input [3:0] X,
	input [3:0] Y,
	output CarriNegSalida,
	output [3:0] R
);
	//Señales internas
	wire [4:0] CarrieNegativos;

	//Primer acarreo negativo va a tierra
	assign CarrieNegativos[0] = 1'b0;
	
	//instanciación en cascada de los restadores completos
	Restador_Completo RC1(.X(X[0]), .Y(Y[0]), .CarrieNEntrada(CarrieNegativos[0]), .R(R[0]), .CarrieNSalida(CarrieNegativos[1]));
	Restador_Completo RC2(.X(X[1]), .Y(Y[1]), .CarrieNEntrada(CarrieNegativos[1]), .R(R[1]), .CarrieNSalida(CarrieNegativos[2]));
	Restador_Completo RC3(.X(X[2]), .Y(Y[2]), .CarrieNEntrada(CarrieNegativos[2]), .R(R[2]), .CarrieNSalida(CarrieNegativos[3]));
	Restador_Completo RC4(.X(X[3]), .Y(Y[3]), .CarrieNEntrada(CarrieNegativos[3]), .R(R[3]), .CarrieNSalida(CarrieNegativos[4]));
	
	//Ultimo acarreo negativo
	assign CarriNegSalida = CarrieNegativos[4];
	
endmodule //Fin del módulo
