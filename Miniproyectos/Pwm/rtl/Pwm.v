/*
				**** MÓDULO GENERADOR DE PWM ****
				
		El presente código implementa el desarrollo del módulo PWM:
		
		!! ACERCA DEL CÓDIGO !!
			* Se implementan parámetros en el módulo para modificar los valores del DUTY
			* LISTA SENSITIVA : Mediante el flanco de subida de reloj se incrementa el 
				contador el cual se controla el duty.
				Se implementa un reset para reiniciar en 0 el contador.
				dependiendo del contador se establece el estado de la salida del PWM,(duty)
				el duty cycle es acorde a la resolución cuando se instancia.
*/

// Definición del módulo
module Pwm#( // Parametros para el DUTY
	parameter RESOLUCION = 100, 
	parameter TR = $clog2(RESOLUCION+1)
)
(
	// Lista de puertos
	input clk,
	input rst,
	input [TR-1:0] dutyCy,
	output reg SalidaPwm
);

	// Señal auxiliar 
	reg [TR-1:0] ContadorPWM = 0;
	
	// Lista sensitiva
	always@(posedge clk or posedge rst) begin
		if (rst) begin // Reset del contador y señal duty
			ContadorPWM <= 0;
			SalidaPwm <= 1'b0;
		end 
		else begin
			// Reset e incremento del contador
			if (ContadorPWM == RESOLUCION) begin
				ContadorPWM <= 0;
			end
			else begin
				ContadorPWM <= ContadorPWM + 1;
			end
			// Estado de la señal duty
			if (ContadorPWM < dutyCy) begin
				SalidaPwm <= 1'b1;
			end
			else begin
				SalidaPwm <= 1'b0;
			end
		end
	end 
	
endmodule // Fin del módulo
