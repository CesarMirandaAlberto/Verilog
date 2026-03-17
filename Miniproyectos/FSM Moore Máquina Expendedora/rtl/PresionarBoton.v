/*
					**** ELIMINAR REBOTES Y DETECTOR DE FLANCOS ****
	
	El presente código implementa el diseño de un módulo eliminador de rebotes y detector de flancos para 
	el uso correcto de push buttons.
	
	!! ACERCA DEL CÓDIGO !!
	 * LIMITE : Se genera un limite para un contador el cual tendrá el control de lectura del push button 
	 * RESET : Reinicia todas las señales del módulo.
	 * SINCRONIZADOR : sincroniza señal asíncrona del boton con el reloj implementando flip flops 
	 * REBOTES : Si se detecta el mismo valor entre sincronizador 1 y pulso estable se reinicia el contador
				en caso contrario el contador comienza a incrementar y al llegar al limite.
	 * DETECTOR DE FLANCOS : Genera un pulso cuando se detecta un flanco de subida en la señal estable.
	 
*/

//DEFINICIÓN DEL MÓDULO
module PresionarBoton
	#(	// DEFINICIÓN DE PARÁMETROS
		parameter FRECUENCIA_CLK = 50_000_000,
		parameter TIEMPO_ESPERA = 10
	)
	( //LISTA DE PUERTOS
		input clk,
		input rst,
		input Boton_CR,
		output reg BotonEstable
	);
	
	parameter LIMITE = (FRECUENCIA_CLK / 1000) *  TIEMPO_ESPERA;
	
	// PARA SINCRONIZAR
	reg Sincronizador1;
	reg Sincronizador2;
	
	// PARA EL ANTIRREBOTE
	reg PulsoEstable;
	reg [$clog2(LIMITE+1)-1:0] Contador;
	
	//DETECTOR DE FLANCOS
	reg DetectorFlanco;
	
	//LISTA SENSITIVA
	always@(posedge clk or posedge rst) begin
			if(rst) begin //RESETEO DE SEÑALES
				Sincronizador1 <= 1'b0;
				Sincronizador2 <= 1'b0;
				BotonEstable <= 1'b0;
				Contador <= 1'b0;
				DetectorFlanco <= 1'b0;
				PulsoEstable <= 1'b0;
			end
			else begin
				// SINCRONIZADOR
				Sincronizador1 <= Boton_CR;
				Sincronizador2 <= Sincronizador1;
				
				// REBOTES
				if(Sincronizador2 == PulsoEstable) begin
					Contador <= 0;
				end
				else begin
					if(Contador < LIMITE) begin //CONTADOR EN ACCIÓN
						Contador <= Contador +1;
					end
					else begin //REINICIO DE CONTADOR Y ASIGNACIÓN DE SINCRONIZADOR A PULSO ESTABLE
						PulsoEstable <= Sincronizador2;
						Contador <= 1'b0;
					end
				end
				
				// DETECTOR DE FLANCOS
				BotonEstable <=  PulsoEstable && (! DetectorFlanco);
				DetectorFlanco <= PulsoEstable;
			end
	end 
	
endmodule //FIN DEL MÓDULO 
