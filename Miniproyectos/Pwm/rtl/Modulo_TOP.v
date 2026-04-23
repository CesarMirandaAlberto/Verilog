/*
								**** MÓDULO TOP (RTL) PWM ****
								
		El presente código implementa el diseño del módulo top a nivel RTL del generador de PWM.
		
		!! ACERCA DEL CÓDIGO !!
		
		 * PARA EL TESTBENCH : Los valores en las señales y/o parámetros se especifican en comentarios
							   para una correcta simulación.
		 * $clog2 : Para calcular el ancho de la señal cuando no se tenga un tamaño conocido.
		 
		 * CONTADOR DE ARRANQUE : Establece un tiempo para que el módulo pueda trabajar de manera optima,
								  en caso de no utilizarse se generan valores desconocidos o por defecto 
								  aunque no se hayan presionado los botones.
*/

// Definición del módulo y lista de puertos
module Modulo_TOP(
	input clk_top,
	input rst_top,
	input Aumentar,
	input Disminuir,
	output SalidaPWM_Top,
	output [/*3:0*/ 6:0] DisplayCentenas,
	output [/*3:0*/ 6:0] DisplayDecenas,
	output [/*3:0*/ 6:0] DisplayUnidades
);

	// DEFINICIÓN DE PARÁMETROS
	parameter FRECUENCIA = 50_000_000;
	
	parameter  RESOLUCIONPWM =$clog2(100+1);
	
	// SEÑALES INTERNAS PARA CONECTAR MÓDULOS INSTANCIADOS
	
	// SEÑAL DUTY
	reg [RESOLUCIONPWM-1:0] DUTY = 50; 
	
	// ALGORITMO DOUBLE DABBLE
	wire [7:0] DutyBin;
	wire [3:0] BufferCentenas, BufferDecenas, BufferUnidades;
	
	
	// BOTONES SIN REBOTE
	wire BSRAumentar, BSRDisminuir;
	
	// PARA ESPERA DEL RESET
	reg [$clog2(/*10-1*/ FRECUENCIA + 1) : 0] ContadorArranque;
	reg Flag_Arranque = 1'b0;
	
	
	// ** CONTADOR DE ARRANQUE DEL SISTEMA **
	always@(posedge clk_top or posedge rst_top) begin
	
		if(rst_top) begin // RESET DE VALORES
			ContadorArranque <= 0;
			Flag_Arranque <= 1'b0;
		end
		else begin // INCREMENTO EN EL CONTADOR
			if(ContadorArranque < /*5*/ 1_000_000 ) begin
				ContadorArranque <= ContadorArranque + 1'b1;
				Flag_Arranque <= 1'b0;
			end
			else begin
				Flag_Arranque <= 1'b1;
			end
			
		end
		
	end 
	
	assign DutyBin = DUTY;
	
	/* INSTANCIACIONES */

	// **** PARA EL TESTBENCH **** //
	
	// PWM 
	Pwm IPWM(.clk(clk_top), .rst(rst_top), .dutyCy(DUTY), .SalidaPwm(SalidaPWM_Top));
	
	// ALGORITMO DOUBLE DABBLE
	DoubleDabble IADD(.X(DutyBin), .Centenas(BufferCentenas/*DisplayCentenas*/), .Decenas(BufferDecenas/*DisplayDecenas*/), .Unidades(BufferUnidades/*DisplayUnidades*/));
	
	// **** SOLO ESTAS 2 INSTANCIACIONES IPWM, IADD **** //
	
	//*** PARA BAJAR AL FPGA ***//
	
	// PRESIONAR BOTONES 
	
		// Aumentar
	PresionarBoton IBA(.clk(clk_top), .rst(rst_top), .Boton_CR(Aumentar), .BotonEstable(BSRAumentar));
	
		// Disminuir
	PresionarBoton IBD(.clk(clk_top), .rst(rst_top), .Boton_CR(Disminuir), .BotonEstable(BSRDisminuir));
	
	// DECODIFICADORES
	DecoderBCD_7Seg IDC(.Binario(BufferCentenas), .Decimal(DisplayCentenas));
	DecoderBCD_7Seg IDD(.Binario(BufferDecenas), .Decimal(DisplayDecenas));
	DecoderBCD_7Seg IDU(.Binario(BufferUnidades), .Decimal(DisplayUnidades));
	
	// MODIFICACIÓN DEL DUTY
	always@(posedge clk_top or posedge rst_top) begin
		if(rst_top) begin // RESET DE VALOR DE DUTYCYCLE
			DUTY <= 0;
		end
		else if(Flag_Arranque) begin // INCREMENTO DEL DUTY
			if(BSRAumentar && DUTY <100) begin
				DUTY <= DUTY +10;
			end
			else if(BSRDisminuir && DUTY >0) begin
				DUTY <= DUTY -10;
			end
		end
	end
	
endmodule // FIN DEL MÓDULO
