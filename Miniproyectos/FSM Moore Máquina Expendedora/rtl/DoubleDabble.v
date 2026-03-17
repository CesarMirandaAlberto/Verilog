/*
					**** ALGORITMO DOUBLE DABBLE ****
					
	El presente código del diseño de un módulo que implementa el algoritmo doubble dabble para
	un número bcd de 8 bits.
	El código consta de 1 entrada de 8 bits y 3 salidas de 4 bits, se implementa una señal
	auxiliar de 20 bits la cual será la encargada de alojar los 8 bits de la entrada en binario
	posteriormente se hacen las comparaciones correspondientes y se almacenan los 4 bits
	correspondientes de las 3 salidas 8 + 4 + 4 + 4.
	Mediante ciclo for se implementa desplazamiento de bits para analizar si el número en binario es 
	Mayor o igual a 5 de ser este el caso se incrementan 3 bits, habiendose terminado de realizar las 
	comparaciones se concatenan todos los bits y se asignan los bits correspondientes a cada salida
	Centenas, Decenas y Unidades.
	
*/

// Definición del módulo y lista de puertos
module DoubleDabble(
	input [7:0] X,
	output reg [3:0] Centenas,
	output reg [3:0] Decenas,
	output reg [3:0] Unidades
);

	
	integer i; // Para iteraciones del ciclo for
	reg [19:0] Desplazamiento; // Señal auxiliar
	
	//Lista sensitiva
	always@(*) begin
		
		//Inicialización de señales
		Desplazamiento = 20'd0; 
		Desplazamiento[7:0] = X;
		
		// Ciclo for y desplazamiento de bits
		for(i=0; i< 8; i=i+1) begin
			if(Desplazamiento[11:8] >= 5) begin
				Desplazamiento[11:8] = Desplazamiento[11:8] + 3;
			end
			if(Desplazamiento[15:12] >= 5) begin
				Desplazamiento[15:12] = Desplazamiento[15:12] + 3;
			end
			
			if(Desplazamiento[19:16] >= 5) begin
				Desplazamiento[19:16] = Desplazamiento[19:16] + 3;
			end

			Desplazamiento = {Desplazamiento[18:0], 1'b0};
		end
				//Asignación de bits correspondientes
		//  7 a 0 valor original
		//  8 a 11 Unidades
		//  12 a 15 Decenas
		//  16 a 19 Centenas
		
			Centenas = Desplazamiento[19:16];
			Decenas = Desplazamiento [15:12];
			Unidades = Desplazamiento[11:8];
			
	end // Fin de la lista sensitiva
	

endmodule // Fin del módulo
