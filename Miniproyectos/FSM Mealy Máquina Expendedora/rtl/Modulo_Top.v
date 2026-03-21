/*
					**** MÓDULO TOP (RTL) FSM MEALY MÁQUINA EXPENDEDORA ****

	El presente código implementa el desarrollo del módulo TOP (RTL) de la máquina expendedora 
	
	!! ACERCA DEL CÓDIGO !!
		* Se implementan sseñales internas para las instanciaciones de los módulos externos.
		*  /* * / PARA IMPLEMENTAR TESTBENCH REEMPLAZAR LOS VALORES ORIGINALES POR LOS QUE ESTAN EN LOS COMENTARIOS
		
	!! PARA TESTBEN !!
	Comentar las instanciaciones de los módulos dado que si se incluyen en el mismo el tiempo de la simulación seria 
	bastante elevado, ejemplo en el módulo presionar boton el cual elimina rebotes tarda demasiado tiempo en completarse.
	
*/

// DEFINICIÓN DEL MÓDULO Y LISTA DE PUERTOS
module Modulo_Top(
	input clk_top,
	input rst_top,
	input [1:0] Monedas_top,
	input BComprar_top,
	output Entrega_top,
	output Cambio_top,
	output [6:0 /*3:0*/] Display_Unidades, 
	output [6:0/*3:0*/] Display_Decenas
);

	// ** SEÑALES AUXILIARES ** 
	wire [3:0] BinarioUnidades;
	wire [3:0] BinarioDecenas;
	wire [3:0] BinarioCentenas;
	wire [7:0] DineroAcum;
	
	// ELIMINAR REBOTES Y DETECCIÓN DE FLANCOS
	wire Moneda5;
	wire Moneda10;
	wire BComprar_SR;
	reg [1:0] MONEDAS_SINREBOTE;
	
	// PARÁMETROS PARA CONTADOR DE ARRANQUE 
	parameter FRECUENCIACLK = 50_000_000 /*5*/;

	reg Flag_Arranque;
	reg [$clog2(FRECUENCIACLK+1)-1:0] Contador_Arranque = 0;
	
	//COMBINACIONES DE BOTONES 
	always@(*) begin
		MONEDAS_SINREBOTE = 2'b00;
		
		if(Moneda5) begin
			MONEDAS_SINREBOTE = 2'b01;
		end 
		else if(Moneda10) begin
			MONEDAS_SINREBOTE = 2'b10;
		end
		else begin
			MONEDAS_SINREBOTE = 2'b00;
		end
	end 
	
	// * ESPERA PARA INICIO DEL SISTEMA *
	always@(posedge clk_top or posedge rst_top) begin
		
		if(rst_top) begin
			Contador_Arranque <= 0;
			Flag_Arranque <= 1'b0;
		end
		else begin
			if(Contador_Arranque < 1_000_000)/* FRECUENCIACLK*/begin
				Contador_Arranque <= Contador_Arranque + 1'b1;
				Flag_Arranque <= 1'b0;
			end
			else begin
				Flag_Arranque <= 1'b1;
			end
		end
	end 
	
	// ** INSTANCIACIONES
	
	
	// * MÁQUINA DE ESTADOS *
	FSM_Expendedora IFSM(.clk(clk_top), .rst(rst_top), .Enable(Flag_Arranque), .Moneda(MONEDAS_SINREBOTE/*Monedas_top*/),
						 .BComprar(BComprar_SR/*BComprar_top*/), .Entrega(Entrega_top), .Cambio(Cambio_top), .DAcumulado(DineroAcum));

	
	// * ALGORITMO DOUBBLE DABBLE *
	
	DoubleDabble IADD(.X(DineroAcum), .Centenas(BinarioCentenas), .Decenas(BinarioDecenas/*Display_Decenas*/), .Unidades(BinarioUnidades/* Display_Unidades*/));
	
	
	// PARA SIMULACIÓN COMENTAR LAS SIGUIENTES INSTANCIACIONES
	
	// * DECODIFICADOR *
	DecoderBCD_7Seg ID7S1(.Binario(BinarioDecenas), .Decimal(Display_Decenas));
	DecoderBCD_7Seg ID7S2(.Binario(BinarioUnidades), .Decimal(Display_Unidades));
	
	
	// ** ANTIRREBOTE Y DETECCIÓN DE FLANCOS **
	
	// MONEDA 5 
	PresionarBoton IPBM5(.clk(clk_top), .rst(rst_top), .Boton_CR(Monedas_top[0]), .BotonEstable(Moneda5));
	
	// MONEDA 10
	PresionarBoton IPBM10(.clk(clk_top), .rst(rst_top), .Boton_CR(Monedas_top[1]), .BotonEstable(Moneda10));
	
	// BOTON COMPRAR PRODUCTO
	PresionarBoton IPBC(.clk(clk_top), .rst(rst_top), .Boton_CR(BComprar_top), .BotonEstable(BComprar_SR));
	
	
endmodule // FIN DEL MÓDULO
