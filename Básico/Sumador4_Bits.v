/*
					**** SUMADOR DE 4 BITS ****
					
		El presente código verilog implementa el diseño de un módulo sumador de 4 bits a nivel estructural
			** ESTRUCTURA DEL DISEÑO **
				Medio_Sumador.v
				Sumador_Completo.v
				Sumador4_Bits.v
		el módulo mediante instanciaciones conecta 4 sumadores completos de 1 bit en cascada para generar
		los cuatro bits a sumar, se implementan señales internas (wire) para conectar entre si los Acarreos
		de los sumadores completos.
		*** NOTAS ****
			TODOS LOS ARCHIVOS DE LA ESTRUCTURA DEL DISEÑO DEBEN DE SER COMPILADOS
			
*/

//Definición del módulo y lista de puertos
module Sumador4_Bits(
	input [3:0] X,
	input [3:0] Y,
	output CarriSalida,
	output [3:0]Salida
	);

	//Señales internas
	wire [3:0] Acarreos;
	
	//Primer acarreo va a tierra
	assign Acarreos[0] = 1'b0;
	
	//Instanciaciones
	Sumador_Completo SC1(.X(X[0]), . Y(Y[0]), .AcarreoEntrada(Acarreos[0]), .AcarreoSalida(Acarreos[1]), .Salida(Salida[0]));
	Sumador_Completo SC2(.X(X[1]), . Y(Y[1]), .AcarreoEntrada(Acarreos[1]), .AcarreoSalida(Acarreos[2]), .Salida(Salida[1]));
	Sumador_Completo SC3(.X(X[2]), . Y(Y[2]), .AcarreoEntrada(Acarreos[2]), .AcarreoSalida(Acarreos[3]), .Salida(Salida[2]));
	Sumador_Completo SC4(.X(X[3]), . Y(Y[3]), .AcarreoEntrada(Acarreos[3]), .AcarreoSalida(CarriSalida), .Salida(Salida[3]));
	
	
endmodule //Fin del módulo
