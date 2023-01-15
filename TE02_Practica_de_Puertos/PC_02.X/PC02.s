#include "Bit_Config.inc" /*config statements should precede project file includes.*/
#include <xc.inc>
#include "Retardos_Delay.inc"

    
PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
 
Main:
    CALL Config_OSC,1
    CALL Button
    CALL Display
    CALL Loop
    NOP
Loop:
    BTFSS PORTA,3,1
    goto Letters
    
    
 Numbers:
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BSF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSS PORTA,3,1
    goto Letters
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    goto Loop
    
 Letters:
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numbers
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numbers
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BSF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numbers
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BSF LATD,0,0
    BCF TRISD,1,0
    BCF LATD,1,0
    BCF TRISD,2,0
    BCF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BSF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numbers
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BSF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BCF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,0
    BTFSC PORTA,3,1
    goto Numbers
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    BCF TRISD,0,0
    BCF LATD,0,0
    BCF TRISD,1,0
    BSF LATD,1,0
    BCF TRISD,2,0
    BSF LATD,2,0
    BCF TRISD,3,0
    BSF LATD,3,0
    BCF TRISD,4,0
    BCF LATD,4,0
    BCF TRISD,5,0
    BCF LATD,5,0
    BCF TRISD,6,0
    BCF LATD,6,0
    BCF TRISD,7,0
    BSF LATD,7,1
    BTFSC PORTA,3,1
    goto Numbers
    
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    CALL Delay_250ms,1
    goto Loop
    
Button:
    BANKSEL PORTA
    CLRF PORTA,1
    CLRF ANSELA,1
    BSF TRISA,3,1
    BSF LATA,3,1
    BSF WPUA,3,1
    RETURN
     
Config_OSC:
    BANKSEL OSCCON1
    MOVLW 0x60
    MOVWF OSCCON1,1
    MOVLW 0x02
    MOVWF OSCFRQ,1
    RETURN
    
    
Display:
    BANKSEL PORTD
    CLRF PORTD,0
    CLRF ANSELD,0
    RETURN
    
    END resetVect


