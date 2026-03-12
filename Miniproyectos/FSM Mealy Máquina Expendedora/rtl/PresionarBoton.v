module PresionarBoton
	#(
		parameter FRECUENCIA_CLK = 50_000_000,
		parameter TIEMPO_ESPERA = 10
	)
	(
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
	
	always@(posedge clk or posedge rst) begin
		if(clk) begin
			if(rst) begin
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
					if(Contador < LIMITE) begin
						Contador <= Contador +1;
					end
					else begin
						PulsoEstable <= Sincronizador2;
						Contador <= 1'b0;
					end
				end
				
				// DETECTOR DE FLANCOS
				BotonEstable <=  PulsoEstable && (! DetectorFlanco);
				DetectorFlanco <= PulsoEstable;
			end
			
		end
	end 
	
endmodule
