#include <xc.h>
#define _XTAL_FREQ 8000000


void main(void) {
    TRISD = 0;         
        
    int i;
    while(1){
        LATDbits.LATD1 = 1;
        for (i=0; i<200; i++){
            LATDbits.LATD0 = 1;
            __delay_ms(1000);
            LATDbits.LATD0 = 0;
            //delay
            
        }
    }
}
