/*
				**** MULTIPLICADOR DE 4 BITS ****	
				
		El presente código implementa el diseño de un módulo multiplicador de 4 bits
		a nivel estructural.
			** ESTRUCTURA DEL DISEÑO **
				* Medio_Sumador.v
				* Sumador_Completo.v
				* Multiplicador4_Bits.v
		el código implementa las multiplicaciones utilizando compuertas and mientras que 
		como toda Multiplicacion de mas de dos digitos se necesita sumar los resultados 
		esto se hace con la ayuda del sumador completo de 1 bit.
		El módulo consta de 2 entradas de 4 Bits pero la salida que generará el módulo
		tendrá un ancho de 8 bits. Se implementan señales internas en el módulo para conectar
		los módulos instanciados con el módulo top, se implementa asignamiento continuo para 
		las multiplicaciones (and) ademas que los sumadores completos estan conectados en 
		cascada para generar los resultados.
		
			** NOTAS ***
			Es necesario compilar todos los módulos de la estructura del diseño
			SC = SumadorCompleto
*/

//Definición de módulo y lista de puertos
module Multiplicador4_Bits(
		input [3:0] X,
		input [3:0] Y,
		output [7:0] Salida
);
	//Señales internas
	wire [15:0] Multiplicacion;
	wire [5:0]SumaParcial;
	wire [11:0] Acarreos;
	wire AcarreoFinal;
	
	//Constante
	localparam TIERRA = 1'b0;
	//Primer acarreo va a tierra
	assign Acarreos[0] = TIERRA;
	
	//Multiplicacion de bits
	assign Multiplicacion[0] = X[0] & Y[0];
	assign Multiplicacion[1] = X[1] & Y[0];
	assign Multiplicacion[2] = X[2] & Y[0];
	assign Multiplicacion[3] = X[3] & Y[0];
	assign Multiplicacion[4] = X[0] & Y[1];
	assign Multiplicacion[5] = X[1] & Y[1];
	assign Multiplicacion[6] = X[2] & Y[1];
	assign Multiplicacion[7] = X[3] & Y[1];
	assign Multiplicacion[8] = X[0] & Y[2];
	assign Multiplicacion[9] = X[1] & Y[2];
	assign Multiplicacion[10] = X[2] & Y[2];
	assign Multiplicacion[11] = X[3] & Y[2];
	assign Multiplicacion[12] = X[0] & Y[3];
	assign Multiplicacion[13] = X[1] & Y[3];
	assign Multiplicacion[14] = X[2] & Y[3];
	assign Multiplicacion[15] = X[3] & Y[3];
	
	assign Salida[0] = Multiplicacion[0];
	
	//Instanciación de sumadores completos
	Sumador_Completo SC1(.X(Multiplicacion[1]), .Y(Multiplicacion[4]), .AcarreoEntrada(Acarreos[0]), .AcarreoSalida(Acarreos[1]), .Salida(Salida[1]));
	Sumador_Completo SC2(.X(Multiplicacion[2]), .Y(Multiplicacion[5]), .AcarreoEntrada(Acarreos[1]), .AcarreoSalida(Acarreos[2]), .Salida(SumaParcial[0]));
	Sumador_Completo SC3(.X(Multiplicacion[6]), .Y(Multiplicacion[3]), .AcarreoEntrada(Acarreos[2]), .AcarreoSalida(Acarreos[3]), .Salida(SumaParcial[1]));
	Sumador_Completo SC4(.X(TIERRA), .Y(Multiplicacion[7]), .AcarreoEntrada(Acarreos[3]), .AcarreoSalida(Acarreos[4]), .Salida(SumaParcial[2]));
	
	Sumador_Completo SC5(.X(SumaParcial[0]), .Y(Multiplicacion[8]), .AcarreoEntrada(Acarreos[4]), .AcarreoSalida(Acarreos[5]), .Salida(Salida[2]));
	Sumador_Completo SC6(.X(SumaParcial[1]), .Y(Multiplicacion[9]), .AcarreoEntrada(Acarreos[5]), .AcarreoSalida(Acarreos[6]), .Salida(SumaParcial[3]));
	Sumador_Completo SC7(.X(SumaParcial[2]), .Y(Multiplicacion[10]), .AcarreoEntrada(Acarreos[6]), .AcarreoSalida(Acarreos[7]), .Salida(SumaParcial[4]));
	Sumador_Completo SC8(.X(Multiplicacion[11]), .Y(Acarreos[3]), .AcarreoEntrada(Acarreos[7]), .AcarreoSalida(Acarreos[8]), .Salida(SumaParcial[5]));
	
	Sumador_Completo SC9(.X(SumaParcial[3]), .Y(Multiplicacion[12]), .AcarreoEntrada(TIERRA), .AcarreoSalida(Acarreos[9]), .Salida(Salida[3]));
	Sumador_Completo SC10(.X(SumaParcial[4]), .Y(Multiplicacion[13]), .AcarreoEntrada(Acarreos[9]), .AcarreoSalida(Acarreos[10]), .Salida(Salida[4]));
	Sumador_Completo SC11(.X(SumaParcial[5]), .Y(Multiplicacion[14]), .AcarreoEntrada(Acarreos[10]), .AcarreoSalida(Acarreos[11]), .Salida(Salida[5]));
	Sumador_Completo SC12(.X(Acarreos[8]), .Y(Multiplicacion[15]), .AcarreoEntrada(Acarreos[11]), .AcarreoSalida(AcarreoFinal), .Salida(Salida[6]));

	assign Salida[7] = AcarreoFinal; // El acarreo final es parte de la salida
	
endmodule //Fin del módulo
