/*
				**** RESTADOR DE 4 BITS CON DISPLAY 7 SEGMENTOS HEXADECIMAL ****
				
		El presente código implementa el desarrollo del restador de 4 bits agregando
		un exhibidor 7 segmentos con valores en hexadecimal, el funcionamiento es 
		igual al restador normal de 4 bits solo que a diferencia este módulo implementa
		el decoder para los valores de entrada y salida a fin de mostrar el número que
		se esta aplicando.
		para cada entrada hay su equivalencia en hexadecimal mediante un display al igual 
		que el resultado ej, entrada X salida = X_Display.
				** ESTRUCTURA DEL DISEÑO **
					* DecodificadorBinario_Hexadecimal.v
					* Medio_Sumador.v
					* Sumador_Completo.v
					* Sumador4_Bits.v
*/

//Definición del módulo y lista de puertos
module Restador4Bits_Display7s(
	input [3:0] X,
	input [3:0] Y,
	output CarrieNegSalida,
	output [6:0] X_Display,
	output [6:0] Y_Display,
	output [6:0] Resultado_Display
);

	// Señales internas
	wire [4:0] CarrieNegativos;
	wire [3:0] Resultado;
	
	//Primer acarreo va a tierra
	assign CarrieNegativos[0] = 1'b0;
	
	//Instanciación y conexión en cascada para formar el restador de 4 bits
	Restador_Completo RC1(.X(X[0]), .Y(Y[0]), .CarrieNEntrada(CarrieNegativos[0]), .R(Resultado[0]), .CarrieNSalida(CarrieNegativos[1]));
	Restador_Completo RC2(.X(X[1]), .Y(Y[1]), .CarrieNEntrada(CarrieNegativos[1]), .R(Resultado[1]), .CarrieNSalida(CarrieNegativos[2]));
	Restador_Completo RC3(.X(X[2]), .Y(Y[2]), .CarrieNEntrada(CarrieNegativos[2]), .R(Resultado[2]), .CarrieNSalida(CarrieNegativos[3]));
	Restador_Completo RC4(.X(X[3]), .Y(Y[3]), .CarrieNEntrada(CarrieNegativos[3]), .R(Resultado[3]), .CarrieNSalida(CarrieNegativos[4]));
	
	assign CarrieNegSalida = CarrieNegativos[4];
	
	
	//Decodificador de valores binarios a hexadecimal en los displays
	DecodificadorBinario_Hexadecimal DBHX(.Binario(X), .Hexadecimal(X_Display));
	DecodificadorBinario_Hexadecimal DBHY(.Binario(Y), .Hexadecimal(Y_Display));
	DecodificadorBinario_Hexadecimal DBHR(.Binario(Resultado), .Hexadecimal(Resultado_Display));
	
	
endmodule //Fin del módulo
