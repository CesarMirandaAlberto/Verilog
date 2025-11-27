/*
					**** SUMADOR COMPLETO 1 BIT ****
					
		El presente código implementa el desarrollo de un sumador completo de 1 bit
		a nivel estructural por lo que se instancia el Medio Sumador en dos ocaciones
		para construir el sumador completo.
		
			NIVEL ESTRUCTURAL:
				* Medio_Sumador.v
				* Sumador_Completo.v
			MS : MedioSumador
			!!NOTA!!
			SE DEBEN COMPILAR TODOS LOS ARCHIVOS .V EN EL ORDEN DEL NIVEL ESTRUCTURAL
		Se implementan "señales internas" wire para conectar los medios sumadores en cascada
		el módulo top consta de 3 entradas y 2 Salidas de un bit. Se implementa asignamiento
		continuo para realizar la suma de los acarreos de los medios sumadores.
*/
//Declaración del módulo y su lista de puertos
module Sumador_Completo(
		input X,
		input Y,
		input AcarreoEntrada,
		output AcarreoSalida,
		output Salida
	);
	
	// Señales internas del Sumador completo
	wire Suma1;
	wire Acarreo1;
	wire Acarreo2;
	
	//Instanciaciones y mapeo de señales "conexión en cascada"
	Medio_Sumador MS1(.X(X), .Y(Y), .Salida(Suma1), .CarrieSalida(Acarreo1));
	Medio_Sumador MS2(.X(Suma1), .Y(AcarreoEntrada), .Salida(Salida), .CarrieSalida(Acarreo2));
	
	//Suma de acarreos de los medios sumadores
	assign AcarreoSalida = Acarreo1 | Acarreo2;
	
endmodule
