/*
					**** SUMADOR DE 4 BITS ****
					
		El presente código verilog implementa el diseño de un módulo sumador de 4 bits ahora mostrando
		en un exhibidor 7 segmentos los valores den entrada y salida en formato Hexadecimal.
		El funcionamiento es igual al restador normal de 4 bits solo que a diferencia este módulo implementa
		el decoder para los valores de entrada y salida a fin de mostrar el número que se esta aplicando.
		para cada entrada hay su equivalencia en hexadecimal mediante un display al igual 
		que el resultado ej, entrada X salida = X_Display.
				** ESTRUCTURA DEL DISEÑO **
					* DecodificadorBinario_Hexadecimal.v
					* Medio_Sumador.v
					* Sumador_Completo.v
					* Sumador4Bits_Display7s.v
			
*/

// Definición del módulo y lista de puertos
module Sumador4Bits_Display7s(
	input [3:0] X,
	input [3:0] Y,
	output CarriSalida,
	output [6:0] X_Display,
	output [6:0] Y_Display,
	output [6:0] Resultado_Display
);

	//Señales internas
	wire [3:0] Acarreos;
	wire [3:0] Salida;
	assign Acarreos[0] = 1'b0;
	
	
	//Formación del sumador de 4 bits a partir de 4 sumadores completos de 1 bit conectados en cascada con las señales internas
	Sumador_Completo SC1(.X(X[0]), . Y(Y[0]), .AcarreoEntrada(Acarreos[0]), .AcarreoSalida(Acarreos[1]), .Salida(Salida[0]));
	Sumador_Completo SC2(.X(X[1]), . Y(Y[1]), .AcarreoEntrada(Acarreos[1]), .AcarreoSalida(Acarreos[2]), .Salida(Salida[1]));
	Sumador_Completo SC3(.X(X[2]), . Y(Y[2]), .AcarreoEntrada(Acarreos[2]), .AcarreoSalida(Acarreos[3]), .Salida(Salida[2]));
	Sumador_Completo SC4(.X(X[3]), . Y(Y[3]), .AcarreoEntrada(Acarreos[3]), .AcarreoSalida(CarriSalida), .Salida(Salida[3]));
	
	//Instanciación del decodificador para mostrar los valores
	DecodificadorBinario_Hexadecimal RXD(.Binario(X), .Hexadecimal(X_Display));
	DecodificadorBinario_Hexadecimal RYD(.Binario(Y), .Hexadecimal(Y_Display));
	DecodificadorBinario_Hexadecimal RD(.Binario(Salida), .Hexadecimal(Resultado_Display));
	
	
endmodule //Fin del módulo