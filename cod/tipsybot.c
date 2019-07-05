 // Lcd pinout settings
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// LCD Pin direction
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

//var globais
char registro;
int counter = 0;                    //variavel na interrupção

//prototipos
void msg_inicial();
void opcoes();
void azul();
void verde();
void amarelo();
void drink_1g();
void drink_1p();
void drink_2g();
void drink_2p();

void main() {

     //configurando saida como digital
     ADCON1 = 0x0F;

     //configurando as portas dos botões como entradas.
     TRISB0_bit = 1;          //botao 1
     TRISB1_bit = 1;          //botao 2
     TRISB2_bit = 1;          //botao 3

     //configurando os pinos do motor como saida
     TRISD0_bit = 0;         //passo 1
     TRISD1_bit = 0;         //direção 1
     TRISD2_bit = 0;         //passo 2                                                       //////
     TRISD3_bit = 0;         //direção 2

     //INICIALIZA LCD
     Lcd_Init();

     //INICIALIZA COMUNICAÇÃO SERIAL
     UART1_Init(9600);

     msg_inicial();
     //opcoes();
     drink_1p();

     //loop
     while(1){
              if (Button(&PORTB, 0, 50, 1)){
                 azul();
                 drink_1g();
              }
              if (Button(&PORTB, 1, 50, 1)){
                 amarelo();
                 drink_2g();
              }
              if (Button(&PORTB, 2, 50, 1)){
                 verde();
                 drink_1p();
                 drink_2p();
              }

     }
}

void msg_inicial(){
     Lcd_Cmd(_LCD_CURSOR_OFF);

     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_FIRST_ROW);
     Lcd_OUT_CP(" SEJA BEM VINDO");
     Lcd_Cmd(_LCD_SECOND_ROW);
     Lcd_OUT_CP("  AO TIPSYBOT!");
     Delay_ms(1000);

     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("SEJA BEM VINDO AO TIPSYBOT!");
}

void opcoes(){
     while(1){
              Lcd_Cmd(_LCD_CLEAR);
              Lcd_Cmd(_LCD_FIRST_ROW);
              Lcd_OUT_CP("ESCOLHA UM DRINK");
              Lcd_Cmd(_LCD_SECOND_ROW);
              Lcd_OUT_CP("-> 1: AZUL");
              Delay_ms(1300);

              Lcd_Cmd(_LCD_CLEAR);
              Lcd_Cmd(_LCD_FIRST_ROW);
              Lcd_OUT_CP("ESCOLHA UM DRINK");
              Lcd_Cmd(_LCD_SECOND_ROW);
              Lcd_OUT_CP("-> 2: AMARELO");
              Delay_ms(1300);

              Lcd_Cmd(_LCD_CLEAR);
              Lcd_Cmd(_LCD_FIRST_ROW);
              Lcd_OUT_CP("ESCOLHA UM DRINK");
              Lcd_Cmd(_LCD_SECOND_ROW);
              Lcd_OUT_CP("-> 3: VERDE");
              Delay_ms(1300);

              UART1_Write(10);
              UART1_Write(13);
              UART1_Write_Text("Escolha um drink");
              UART1_Write(10);
              UART1_Write(13);
              UART1_Write_Text("-> 1: AZUL");
              UART1_Write(10);
              UART1_Write(13);
              UART1_Write_Text("-> 2: AMARELO");
              UART1_Write(10);
              UART1_Write(13);
              UART1_Write_Text("-> 3: VERDE");
     }
}

void azul(){
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_FIRST_ROW);
     Lcd_OUT_CP("  ::: AZUL :::");
     Lcd_Cmd(_LCD_SECOND_ROW);
     Lcd_OUT_CP("-> 50 ml");

     UART1_Write(10);
     UART1_Write(13);
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-------- AZUL --------");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("::: INGREDIENTES :::");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-> 50 mls da bebida azul");
}

void amarelo(){
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_FIRST_ROW);
     Lcd_OUT_CP("::: AMARELO :::");
     Lcd_Cmd(_LCD_SECOND_ROW);
     Lcd_OUT_CP("-> 50 ml");

     UART1_Write(10);
     UART1_Write(13);
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-------- AMARELO --------");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("::: INGREDIENTES :::");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-> 50 mls da bebida amarela");
}

void verde(){

     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_FIRST_ROW);
     Lcd_OUT_CP(" ::: VERDE :::");
     Lcd_Cmd(_LCD_SECOND_ROW);
     Lcd_OUT_CP("-> 50 mls");

     UART1_Write(10);
     UART1_Write(13);
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-------- VERDE -------");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("::: INGREDIENTES :::");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-> 25 mls da bebida azul");
     UART1_Write(10);
     UART1_Write(13);
     UART1_Write_Text("-> 25 mls da bebida amarela");
}
//50mls: 42.5 segundos      21250 passos
//25mls: 21.2 segundos      10625 passos
void drink_1g(){
     int i;
     while(1){
          LATD1_bit = 1;
          for(i =0; i<21250; i++){
                LATD0_bit = 1;
                Delay_us(1000);
                LATD0_bit = 0;
                Delay_us(1000);
          }
             break;
     }
}

void drink_1p(){
     int i;
     while(1){
          LATD1_bit = 1;
          for(i =0; i<10625; i++){
                LATD0_bit = 1;
                Delay_us(1000);
                LATD0_bit = 0;
                Delay_us(1000);
          }
             break;
     }
}

void drink_2g(){
     int i;
     while(1){
          LATD1_bit = 1;
          for(i =0; i<21250; i++){
                LATD0_bit = 1;
                Delay_us(1000);
                LATD0_bit = 0;
                Delay_us(1000);
          }
             break;
     }
}

void drink_2p(){
     int i;
     while(1){
          LATD1_bit = 1;
          for(i =0; i<10625; i++){
                LATD0_bit = 1;
                Delay_us(1000);
                LATD0_bit = 0;
                Delay_us(1000);
          }
             break;
     }
}