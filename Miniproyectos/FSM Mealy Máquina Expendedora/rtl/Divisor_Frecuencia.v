/*
					**** DIVISOR DE FRECUENCIA	****
					
	El presente código implementa el diseño de un módulo divisor de frecuencia, el cual
	esta diseñado para un oscilador con una frecuencia de 50 Mhz, el divisor generará una
	señal de salida de 1 hz .
	El módulo consta de 2 entradas clk(señal de reloj), rst(reset), y 1 salida (clk salida).
	Se implementa un contador para llegar a 50M equivalente  al llegar a la cuenta
	se genera un pulso de 1hz y se reinicia el contador, en caso contrario sigue incrementando
	el contador y se mantiene el estado bajo del pulso de 1hz
	
*/

// Definición del módulo y lista de puertos
module Divisor_Frecuencia(
	input clk_Entrada,
	input rst,
	output reg clk_Salida
);

	// Parámetros para el divisor de frecuencia
	parameter VMaximo = 50_000_000;
	//parameter VMaximo = 5; // ESTE VALOR PARA SIMULACIÓN
	reg [24:0] Contador;
	
	// Lista sensitiva
	always@(posedge clk_Entrada or posedge rst) begin
		if(rst) begin // reset de contador y salida
			Contador <= 25'd0;
			clk_Salida <= 1'b0;
		end
		else begin
				if(Contador == VMaximo-1) begin // Reinicio de la cuenta 
					Contador <= 25'd0;
					clk_Salida <= 1'b1; 
				end
				else begin // Incremento del contador
					Contador <= Contador + 1'b1;	
					clk_Salida <= 1'b0;
				end
		end
	end // Fin de la lista sensitiva
	
endmodule // Fin del módulo
