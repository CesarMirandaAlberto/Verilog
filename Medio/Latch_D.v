/*
							**** LATCH D ****
							
		El presente código implementa el desarrollo de un latch d con 2 entradas y 2 salidas
		E = Enable, D = Datos, Salida=  Q negada QN.
		El funcionamiento es que mientras E sea 1 q recibira los valores de D, en caso contrario 
		se mantiene, en el caso de Qn se implementa asignamiento continuo para negar el valor de 
		Q.
*/

//Modulo y lista de puertos
module Latch_D(
	input E,
	input D,
	output reg Q,
	output  QN
);

	//Lista sensitiva *(todas las señales)
	always@(*) begin
		if(E == 1'b1) 
			Q = D; //Asignamiento
	end
	
	assign QN = ~Q; //Negación de Q
	
endmodule // Fin del módulo
