/*
				**** MÓDULO TOP (HARDWARE) PWM ****
				
		El presente código implementa el diseño del módulo top (hardware) del pwm 
		el módulo meramente instancia al TOP rtl para mapear los puertos a los
		pines físicos del FPGA.
		
*/

// Definición del módulo y lista de puertos
module Top(
	input CLK_50MHZ,
	input RST,
	input BTN_AUMENTAR,
	input BTN_DISMINUIR,
	output DUTY,
	output [6:0] DISPLAYCENTENAS,
	output [6:0] DISPLAYDECENAS,
	output [6:0] DISPLAYUNIDADES
);

	// Instanciación del Módulo TOP RTL 
	Modulo_TOP IMT(.clk_top(CLK_50MHZ), .rst_top(RST), .Aumentar(BTN_AUMENTAR),.Disminuir(BTN_DISMINUIR),
				   .SalidaPWM_Top(DUTY), .DisplayCentenas(DISPLAYCENTENAS), .DisplayDecenas(DISPLAYDECENAS), 
				   .DisplayUnidades(DISPLAYUNIDADES));

endmodule // Fin del módulo
