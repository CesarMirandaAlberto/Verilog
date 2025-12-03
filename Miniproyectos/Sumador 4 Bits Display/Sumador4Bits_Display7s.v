module Sumador4Bits_Display7s(
	input [3:0] X,
	input [3:0] Y,
	output CarriSalida,
	output [6:0] Salida_Hexadecimal
);

	wire [3:0] Acarreos;
	wire [3:0] Salida;
	assign Acarreos[0] = 1'b0;
	
		
	Sumador_Completo SC1(.X(X[0]), . Y(Y[0]), .AcarreoEntrada(Acarreos[0]), .AcarreoSalida(Acarreos[1]), .Salida(Salida[0]));
	Sumador_Completo SC2(.X(X[1]), . Y(Y[1]), .AcarreoEntrada(Acarreos[1]), .AcarreoSalida(Acarreos[2]), .Salida(Salida[1]));
	Sumador_Completo SC3(.X(X[2]), . Y(Y[2]), .AcarreoEntrada(Acarreos[2]), .AcarreoSalida(Acarreos[3]), .Salida(Salida[2]));
	Sumador_Completo SC4(.X(X[3]), . Y(Y[3]), .AcarreoEntrada(Acarreos[3]), .AcarreoSalida(CarriSalida), .Salida(Salida[3]));
	
	DecodificadorBinario_Hexadecimal SH(.Binario(Salida), .Hexadecimal(Salida_Hexadecimal));
	
endmodule