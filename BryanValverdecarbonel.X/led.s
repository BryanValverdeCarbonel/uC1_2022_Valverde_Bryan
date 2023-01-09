PROCESSOR 18F57Q84
#include "Bit_Config.inc"  /*config statements should precede project file includes.*/
#include <xc.inc>
#include "Retardos_Delay.inc"

    
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE 
Main:
    CALL Config_OSC,1
    CALL Config_Port,1
    CALL Delay_10us
    CALL Delay_25us
    CALL Delay_50us
    CALL Delay_100us
    CALL Delay_200us
    CALL Delay_250us
    CALL Delay_500us
    CALL Delay_1ms
    CALL Delay_5ms
    CALL Delay_10ms
    CALL Delay_25ms
    CALL Delay_50ms
    CALL Delay_100ms
    CALL Delay_200ms
    CALL Delay_250ms
    NOP
    
Led_on:
    BCF    LATF,3,1    ;Led on
    CALL Delay_200ms
    CALL Delay_200ms
    
Led_off:
    BSF    LATF,3,1   ;Led off}
    CALL Delay_200ms
    CALL Delay_200ms
    goto   Led_on
    
 Config_OSC:
    ;Configuracion del oscilador interno a una frecuencia de 4MHz
    BANKSEL OSCCON1 
    MOVLW 0x60     ; Seleccionamos el bloque del osc con un div:1
    MOVWF OSCCON1,1
    MOVLW 0x02     ; Seleccionamos una frecuencia de 4MHz
    MOVWF OSCFRQ,1
    RETURN
    
Config_Port:            ;PART-LAT-ANSEL-TRIS LED:RF3, BUTTON:RA3
    ;Config Led
    BANKSEL PORTF      
    CLRF    PORTF,1     ;PORTF=0
    BSF     LATF,3,1    ;LATF<3>=1 - Led off
    CLRF    ANSELF,1    ;ANSEL<7:0> = 0 - Port f digital
    BCF     TRISF,3,1   ;TRISF<3>  = 0 -RF3 como salida 
    
    ;Config Button
    BANKSEL PORTA
    CLRF    PORTA,1      ;PORTA <7:0> = 0
    CLRF    ANSELA,1     ;PortA digital
    BSF     TRISA,3,1    ;RA3 como entrada
    BSF     WPUA,3,1     ;Activamos la resistencia RA3    
    RETURN

END resetVect





