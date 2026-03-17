/*
					**** FSM MEALY MÁQUINA EXPENDEDORA ****
					
	El presente código implementa el diseño del una máquina de estados finitos de tipo mealy para 
	una máquina expendedora de productos.
	
	!! ACERCA DEL CÓDIGO !!
		* ACTUALIZACIÓN DE ESTADOS : A través de un flip flop d se realiza la actualización de los mismos.
		* TRANSICIÓN DE ESTADOS : A través de enable se determina cuando la fsm inicie a realizar tranciones acorde 
		  a las entradas (monedas).
		* SALIDAS : Dependiendo de los estados se determinan las salidas.
		* CONTEO DE DINERO : Acorde al estado se asina la cantidad de dinero acumulado.
*/


//DEFINICIÓN DEL MÓDULO Y LISTA DE PUERTOS
module FSM_Expendedora(
	input clk,
	input rst,
	input Enable,
	input [1:0] Moneda,
	input BComprar,
	output reg Entrega,
	output reg Cambio,
	output reg [7:0]DAcumulado
);

	// DEFINICIÓN DE ESTADOS
	parameter S0 = 3'b000, S5 = 3'b001, S10 = 3'b010, S15 = 3'b011, S20 = 3'b100;
	
	parameter [1:0] CINCO = 2'b01;
	parameter [1:0] DIEZ = 2'b10;
	
	reg [2:0] EstadoActual, SiguienteEstado; 
	
	// ACTUALIZACIÓN DE ESTADOS
	always@(posedge clk or posedge rst) begin
		if (rst) begin
			EstadoActual <= S0;
		end 
		else begin
			EstadoActual <= SiguienteEstado;
		end
		
	end 
	
	// TRANSICIÓN DE ESTADOS
	always@(*) begin
		// ESTADO POR DEFECTO
		SiguienteEstado = EstadoActual;
		
		if(Enable == 1'b0)begin
			SiguienteEstado = S0;
		end
		else begin
			case(EstadoActual) // EVALUACIÓN DEL ESTADO ACTUAL 
				S0 : begin
					if (Moneda == CINCO) begin
						SiguienteEstado = S5;
					end
					else if (Moneda == DIEZ) begin
						SiguienteEstado = S10;
					end
					else begin
						SiguienteEstado = S0;
					end
				end
				S5 : begin
					if(Moneda == CINCO) begin
						SiguienteEstado = S10;
					end
					else if(Moneda == DIEZ) begin
						SiguienteEstado = S15;
					end
					else begin
						SiguienteEstado = S5;
					end
				end
				S10 : begin
					if(Moneda == CINCO) begin
						SiguienteEstado = S15;
					end
					else if(Moneda == DIEZ) begin
						SiguienteEstado = S20;
					end
					else begin
						SiguienteEstado = S10;
					end
				end
				S15 : begin
					if (BComprar) begin
						SiguienteEstado = S0;
					end
					else begin
						SiguienteEstado = S15;
					end
				end
				S20 : begin
					if (BComprar) begin
						SiguienteEstado = S0;
					end
					else begin
						SiguienteEstado = S20;
					end
				end
				default : SiguienteEstado = S0;
			endcase;
		end
	end // FIN DE LAS TRANSICIONES
	
	//SALIDAS
	always@(*) begin 
		//VALORES POR DEFECTO
		Cambio = 1'b0;
		Entrega = 1'b0;
		
			//ASIGNACIÓN DE VALORES A LAS SALIDAS ACORDE A LOS ESTADOS
			case (EstadoActual)
				S15 : begin
					if (BComprar) begin
						Entrega = 1'b0;
					end
					else begin
						Entrega = 1'b1;
					end
				end
				
				S20 : begin
					if (BComprar) begin
						Entrega = 1'b0;
						Cambio = 1'b0;
					end
					else begin
						Cambio = 1'b1;
						Entrega = 1'b1;
					end
				end
				
				default	: begin
					Cambio = 1'b0; 
					Entrega = 1'b0;
				end 
		endcase;
		
	end
	
	// CONTEO DE DINERO
	always@(*) begin
		
		case (EstadoActual)
			
			S0 :  begin
				DAcumulado = 8'b00000000;
			end
			S5 : begin
				DAcumulado = 8'b00000101;
			end
			S10 : begin
				DAcumulado = 8'b00001010;
			end
			S15 : begin
				DAcumulado = 8'b00001111;
			end
			S20 : begin
				DAcumulado = 8'b00010100;
			end
			default : begin
				DAcumulado = 8'b00000000;
			end
		endcase;
	end
	
endmodule //FIN DEL MÓDULO
