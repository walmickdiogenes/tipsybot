
_main:

;tipsybot.c,32 :: 		void main() {
;tipsybot.c,35 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;tipsybot.c,38 :: 		TRISB0_bit = 1;          //botao 1
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;tipsybot.c,39 :: 		TRISB1_bit = 1;          //botao 2
	BSF         TRISB1_bit+0, BitPos(TRISB1_bit+0) 
;tipsybot.c,40 :: 		TRISB2_bit = 1;          //botao 3
	BSF         TRISB2_bit+0, BitPos(TRISB2_bit+0) 
;tipsybot.c,43 :: 		TRISD0_bit = 0;         //passo 1
	BCF         TRISD0_bit+0, BitPos(TRISD0_bit+0) 
;tipsybot.c,44 :: 		TRISD1_bit = 0;         //direção 1
	BCF         TRISD1_bit+0, BitPos(TRISD1_bit+0) 
;tipsybot.c,45 :: 		TRISD2_bit = 0;         //passo 2
	BCF         TRISD2_bit+0, BitPos(TRISD2_bit+0) 
;tipsybot.c,46 :: 		TRISD3_bit = 0;         //direção 2
	BCF         TRISD3_bit+0, BitPos(TRISD3_bit+0) 
;tipsybot.c,49 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;tipsybot.c,52 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       4
	MOVWF       SPBRGH+0 
	MOVLW       225
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;tipsybot.c,55 :: 		opcoes();
	CALL        _opcoes+0, 0
;tipsybot.c,56 :: 		drink_1p();
	CALL        _drink_1p+0, 0
;tipsybot.c,59 :: 		while(1){
L_main0:
;tipsybot.c,60 :: 		if (Button(&PORTB, 0, 50, 1)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;tipsybot.c,61 :: 		azul();
	CALL        _azul+0, 0
;tipsybot.c,62 :: 		drink_1g();
	CALL        _drink_1g+0, 0
;tipsybot.c,63 :: 		}
L_main2:
;tipsybot.c,64 :: 		if (Button(&PORTB, 1, 50, 1)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;tipsybot.c,65 :: 		amarelo();
	CALL        _amarelo+0, 0
;tipsybot.c,66 :: 		drink_2g();
	CALL        _drink_2g+0, 0
;tipsybot.c,67 :: 		}
L_main3:
;tipsybot.c,68 :: 		if (Button(&PORTB, 2, 50, 1)){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       50
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;tipsybot.c,69 :: 		verde();
	CALL        _verde+0, 0
;tipsybot.c,70 :: 		drink_1p();
	CALL        _drink_1p+0, 0
;tipsybot.c,71 :: 		drink_2p();
	CALL        _drink_2p+0, 0
;tipsybot.c,72 :: 		}
L_main4:
;tipsybot.c,74 :: 		}
	GOTO        L_main0
;tipsybot.c,75 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_msg_inicial:

;tipsybot.c,77 :: 		void msg_inicial(){
;tipsybot.c,78 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,80 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,81 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,82 :: 		Lcd_OUT_CP(" SEJA BEM VINDO");
	MOVLW       ?lstr1_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr1_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,83 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,84 :: 		Lcd_OUT_CP("  AO TIPSYBOT!");
	MOVLW       ?lstr2_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,85 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_msg_inicial5:
	DECFSZ      R13, 1, 1
	BRA         L_msg_inicial5
	DECFSZ      R12, 1, 1
	BRA         L_msg_inicial5
	DECFSZ      R11, 1, 1
	BRA         L_msg_inicial5
	NOP
	NOP
;tipsybot.c,87 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,88 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,89 :: 		UART1_Write_Text("SEJA BEM VINDO AO TIPSYBOT!");
	MOVLW       ?lstr3_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,90 :: 		}
L_end_msg_inicial:
	RETURN      0
; end of _msg_inicial

_opcoes:

;tipsybot.c,92 :: 		void opcoes(){
;tipsybot.c,93 :: 		while(1){
L_opcoes6:
;tipsybot.c,94 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,95 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,96 :: 		Lcd_OUT_CP("ESCOLHA UM DRINK");
	MOVLW       ?lstr4_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,97 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,98 :: 		Lcd_OUT_CP("-> 1: AZUL");
	MOVLW       ?lstr5_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,99 :: 		Delay_ms(1300);
	MOVLW       80
	MOVWF       R11, 0
	MOVLW       36
	MOVWF       R12, 0
	MOVLW       134
	MOVWF       R13, 0
L_opcoes8:
	DECFSZ      R13, 1, 1
	BRA         L_opcoes8
	DECFSZ      R12, 1, 1
	BRA         L_opcoes8
	DECFSZ      R11, 1, 1
	BRA         L_opcoes8
	NOP
;tipsybot.c,101 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,102 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,103 :: 		Lcd_OUT_CP("ESCOLHA UM DRINK");
	MOVLW       ?lstr6_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,104 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,105 :: 		Lcd_OUT_CP("-> 2: AMARELO");
	MOVLW       ?lstr7_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,106 :: 		Delay_ms(1300);
	MOVLW       80
	MOVWF       R11, 0
	MOVLW       36
	MOVWF       R12, 0
	MOVLW       134
	MOVWF       R13, 0
L_opcoes9:
	DECFSZ      R13, 1, 1
	BRA         L_opcoes9
	DECFSZ      R12, 1, 1
	BRA         L_opcoes9
	DECFSZ      R11, 1, 1
	BRA         L_opcoes9
	NOP
;tipsybot.c,108 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,109 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,110 :: 		Lcd_OUT_CP("ESCOLHA UM DRINK");
	MOVLW       ?lstr8_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,111 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,112 :: 		Lcd_OUT_CP("-> 3: VERDE");
	MOVLW       ?lstr9_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr9_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,113 :: 		Delay_ms(1300);
	MOVLW       80
	MOVWF       R11, 0
	MOVLW       36
	MOVWF       R12, 0
	MOVLW       134
	MOVWF       R13, 0
L_opcoes10:
	DECFSZ      R13, 1, 1
	BRA         L_opcoes10
	DECFSZ      R12, 1, 1
	BRA         L_opcoes10
	DECFSZ      R11, 1, 1
	BRA         L_opcoes10
	NOP
;tipsybot.c,115 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,116 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,117 :: 		UART1_Write_Text("Escolha um drink");
	MOVLW       ?lstr10_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr10_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,118 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,119 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,120 :: 		UART1_Write_Text("-> 1: AZUL");
	MOVLW       ?lstr11_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,121 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,122 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,123 :: 		UART1_Write_Text("-> 2: AMARELO");
	MOVLW       ?lstr12_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,124 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,125 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,126 :: 		UART1_Write_Text("-> 3: VERDE");
	MOVLW       ?lstr13_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,127 :: 		}
	GOTO        L_opcoes6
;tipsybot.c,128 :: 		}
L_end_opcoes:
	RETURN      0
; end of _opcoes

_azul:

;tipsybot.c,130 :: 		void azul(){
;tipsybot.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,132 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,133 :: 		Lcd_OUT_CP("  ::: AZUL :::");
	MOVLW       ?lstr14_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr14_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,134 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,135 :: 		Lcd_OUT_CP("-> 50 ml");
	MOVLW       ?lstr15_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr15_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,137 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,138 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,139 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,140 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,141 :: 		UART1_Write_Text("-------- AZUL --------");
	MOVLW       ?lstr16_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,142 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,143 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,144 :: 		UART1_Write_Text("::: INGREDIENTES :::");
	MOVLW       ?lstr17_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,145 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,146 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,147 :: 		UART1_Write_Text("-> 50 mls da bebida azul");
	MOVLW       ?lstr18_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,148 :: 		}
L_end_azul:
	RETURN      0
; end of _azul

_amarelo:

;tipsybot.c,150 :: 		void amarelo(){
;tipsybot.c,151 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,152 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,153 :: 		Lcd_OUT_CP("::: AMARELO :::");
	MOVLW       ?lstr19_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr19_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,154 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,155 :: 		Lcd_OUT_CP("-> 50 ml");
	MOVLW       ?lstr20_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr20_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,157 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,158 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,159 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,160 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,161 :: 		UART1_Write_Text("-------- AMARELO --------");
	MOVLW       ?lstr21_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr21_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,162 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,163 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,164 :: 		UART1_Write_Text("::: INGREDIENTES :::");
	MOVLW       ?lstr22_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr22_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,165 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,166 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,167 :: 		UART1_Write_Text("-> 50 mls da bebida amarela");
	MOVLW       ?lstr23_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr23_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,168 :: 		}
L_end_amarelo:
	RETURN      0
; end of _amarelo

_verde:

;tipsybot.c,170 :: 		void verde(){
;tipsybot.c,172 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,173 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,174 :: 		Lcd_OUT_CP(" ::: VERDE :::");
	MOVLW       ?lstr24_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr24_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,175 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tipsybot.c,176 :: 		Lcd_OUT_CP("-> 50 mls");
	MOVLW       ?lstr25_tipsybot+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr25_tipsybot+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;tipsybot.c,178 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,179 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,180 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,181 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,182 :: 		UART1_Write_Text("-------- VERDE -------");
	MOVLW       ?lstr26_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr26_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,183 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,184 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,185 :: 		UART1_Write_Text("::: INGREDIENTES :::");
	MOVLW       ?lstr27_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr27_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,186 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,187 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,188 :: 		UART1_Write_Text("-> 25 mls da bebida azul");
	MOVLW       ?lstr28_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr28_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,189 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,190 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;tipsybot.c,191 :: 		UART1_Write_Text("-> 25 mls da bebida amarela");
	MOVLW       ?lstr29_tipsybot+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr29_tipsybot+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;tipsybot.c,192 :: 		}
L_end_verde:
	RETURN      0
; end of _verde

_drink_1g:

;tipsybot.c,195 :: 		void drink_1g(){
;tipsybot.c,198 :: 		LATD1_bit = 1;
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
;tipsybot.c,199 :: 		for(i =0; i<21250; i++){
	CLRF        R1 
	CLRF        R2 
L_drink_1g13:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       83
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__drink_1g46
	MOVLW       2
	SUBWF       R1, 0 
L__drink_1g46:
	BTFSC       STATUS+0, 0 
	GOTO        L_drink_1g14
;tipsybot.c,200 :: 		LATD0_bit = 1;
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,201 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_1g16:
	DECFSZ      R13, 1, 1
	BRA         L_drink_1g16
	DECFSZ      R12, 1, 1
	BRA         L_drink_1g16
	NOP
;tipsybot.c,202 :: 		LATD0_bit = 0;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,203 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_1g17:
	DECFSZ      R13, 1, 1
	BRA         L_drink_1g17
	DECFSZ      R12, 1, 1
	BRA         L_drink_1g17
	NOP
;tipsybot.c,199 :: 		for(i =0; i<21250; i++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;tipsybot.c,204 :: 		}
	GOTO        L_drink_1g13
L_drink_1g14:
;tipsybot.c,206 :: 		}
L_drink_1g12:
;tipsybot.c,207 :: 		}
L_end_drink_1g:
	RETURN      0
; end of _drink_1g

_drink_1p:

;tipsybot.c,209 :: 		void drink_1p(){
;tipsybot.c,212 :: 		LATD1_bit = 1;
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
;tipsybot.c,213 :: 		for(i =0; i<10625; i++){
	CLRF        R1 
	CLRF        R2 
L_drink_1p20:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       41
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__drink_1p48
	MOVLW       129
	SUBWF       R1, 0 
L__drink_1p48:
	BTFSC       STATUS+0, 0 
	GOTO        L_drink_1p21
;tipsybot.c,214 :: 		LATD0_bit = 1;
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,215 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_1p23:
	DECFSZ      R13, 1, 1
	BRA         L_drink_1p23
	DECFSZ      R12, 1, 1
	BRA         L_drink_1p23
	NOP
;tipsybot.c,216 :: 		LATD0_bit = 0;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,217 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_1p24:
	DECFSZ      R13, 1, 1
	BRA         L_drink_1p24
	DECFSZ      R12, 1, 1
	BRA         L_drink_1p24
	NOP
;tipsybot.c,213 :: 		for(i =0; i<10625; i++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;tipsybot.c,218 :: 		}
	GOTO        L_drink_1p20
L_drink_1p21:
;tipsybot.c,220 :: 		}
L_drink_1p19:
;tipsybot.c,221 :: 		}
L_end_drink_1p:
	RETURN      0
; end of _drink_1p

_drink_2g:

;tipsybot.c,223 :: 		void drink_2g(){
;tipsybot.c,226 :: 		LATD1_bit = 1;
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
;tipsybot.c,227 :: 		for(i =0; i<21250; i++){
	CLRF        R1 
	CLRF        R2 
L_drink_2g27:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       83
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__drink_2g50
	MOVLW       2
	SUBWF       R1, 0 
L__drink_2g50:
	BTFSC       STATUS+0, 0 
	GOTO        L_drink_2g28
;tipsybot.c,228 :: 		LATD0_bit = 1;
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,229 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_2g30:
	DECFSZ      R13, 1, 1
	BRA         L_drink_2g30
	DECFSZ      R12, 1, 1
	BRA         L_drink_2g30
	NOP
;tipsybot.c,230 :: 		LATD0_bit = 0;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,231 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_2g31:
	DECFSZ      R13, 1, 1
	BRA         L_drink_2g31
	DECFSZ      R12, 1, 1
	BRA         L_drink_2g31
	NOP
;tipsybot.c,227 :: 		for(i =0; i<21250; i++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;tipsybot.c,232 :: 		}
	GOTO        L_drink_2g27
L_drink_2g28:
;tipsybot.c,234 :: 		}
L_drink_2g26:
;tipsybot.c,235 :: 		}
L_end_drink_2g:
	RETURN      0
; end of _drink_2g

_drink_2p:

;tipsybot.c,237 :: 		void drink_2p(){
;tipsybot.c,240 :: 		LATD1_bit = 1;
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
;tipsybot.c,241 :: 		for(i =0; i<10625; i++){
	CLRF        R1 
	CLRF        R2 
L_drink_2p34:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       41
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__drink_2p52
	MOVLW       129
	SUBWF       R1, 0 
L__drink_2p52:
	BTFSC       STATUS+0, 0 
	GOTO        L_drink_2p35
;tipsybot.c,242 :: 		LATD0_bit = 1;
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,243 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_2p37:
	DECFSZ      R13, 1, 1
	BRA         L_drink_2p37
	DECFSZ      R12, 1, 1
	BRA         L_drink_2p37
	NOP
;tipsybot.c,244 :: 		LATD0_bit = 0;
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
;tipsybot.c,245 :: 		Delay_us(1000);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_drink_2p38:
	DECFSZ      R13, 1, 1
	BRA         L_drink_2p38
	DECFSZ      R12, 1, 1
	BRA         L_drink_2p38
	NOP
;tipsybot.c,241 :: 		for(i =0; i<10625; i++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;tipsybot.c,246 :: 		}
	GOTO        L_drink_2p34
L_drink_2p35:
;tipsybot.c,248 :: 		}
L_drink_2p33:
;tipsybot.c,249 :: 		}
L_end_drink_2p:
	RETURN      0
; end of _drink_2p
