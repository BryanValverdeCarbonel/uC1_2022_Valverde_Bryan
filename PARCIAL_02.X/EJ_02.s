PROCESSOR 18F57Q84
#include "BitC.inc"
#include <xc.inc>
#include "Retardos.inc"
    
;Vector de Reset    
PSECT resectVect,class=CODE,reloc=2
resectVect:
     GOTO Main
    
; Vector de Interrupción de Baja Prioridad    
PSECT ISRVectLowPriority, class=CODE,reloc=2
    
    BTFSS PIR1,0,0          ;Comprueba si se ha producido la interrupcion INT0
    GOTO EXIT0		    ;Si no se ha producido, salta a Exit0
    BCF PIR1,0,0            ;Limpia el flag de INT0
    GOTO Encend_Led	    ;Salta a la función Enced_Led

    EXIT0:		    ;La etiqueta para saltar si no se ha producido la interrupción INT0
    RETFIE		    ;Regresa a la interrupción
    
; Vector de Interrupción de Prioridad Alta 1    
PSECT ISRVectHigh1Priority, class=CODE,reloc=2
    
    BTFSS PIR6,0,0          ;Comprueba si se ha producido la interrupción INT1
    GOTO EXIT1		    ;Si no se ha producido la interrupción INT1, salta a EXIT1
    
    BCF PIR6,0,0            ;Limpiam el flag de INT1
    CLRF    LATC,1	    ;Pone en cero el bit 1 del registro LATC.
    CALL Delay_250ms,1	    
    CALL Delay_250ms,1	    ;Llama a la función de retardo de 250ms dos veces.
     
    EXIT1:		    ;La etiqueta para saltar si no se ha producido la interrupción INT1.
    BCF PIR6,0,0            ;Limpiamos el flag de INT1
    RETFIE		    ;Regresa a la interrupcion 

; Vector de Interrupción de Prioridad Alta 2
PSECT ISRVectHigh2Priority, class=CODE,reloc=2
    
    BTFSS PIR10,0,0          ;¿Se ha producido la INT2?
    GOTO EXIT2 
    BCF PIR10,0,0            ;;Comprueba si se ha producido la interrupción INT2
    
    EXIT2:
    RETFIE


; Variables de usuario    
PSECT udata_acs		    ;define tres variables: Offset, Counter1 y Counter2.
    Offset: DS 1
    Counter1: DS 1
    Counter2: DS 1
    
; Sección de código principal    
PSECT CODE
 
 Main:			    ;llammado de varias funciones de configuracion 
    CALL Config_osc,1
    CALL Config_port,1
    CALL Config_pps,1
    CALL Config_INT,1
   
Encend_Led:
    BTFSC PORTA,3,0	    ;PORTA <3> = 0? - Button press?  
    GOTO Encend_Led
    
REPETICIONES:
    CALL Config_INT0,1
    MOVLW 0x05
    MOVWF Counter2,0      ;Carga el contador2 con el número de REPETICIONES
    GOTO Reload
 
Dec_Counter2:
    DECFSZ Counter2,1,0   ;Restamos 1 al contador2
    GOTO Reload
    GOTO LED_OFF
    
    Reload:
      MOVLW 0x0A
      MOVWF Counter1,0  ;Carga el contador2 con el número de OFFSETS
      MOVLW 0x00
      MOVWF Offset,0   ;Definimos el valor de OFFSET inicial

        Loop:
         BANKSEL PCLATU
         MOVLW low highword(Table)
         MOVWF PCLATU,1                ;Escribo el byte superior en PCLATU
         MOVLW high(Table)  
         MOVWF PCLATH,1                ;Escribo el byte alto en PCLTH
         RLNCF Offset,0,0
         CALL Table
         MOVWF LATC,0
         CALL Delay_250ms,1
         DECFSZ Counter1,1,0
         GOTO Next_seq 
         GOTO LED1
     
        Table:
         ADDWF   PCL,1,0
         RETLW   10000001B	; offset: 0
         RETLW   01000010B	; offset: 1
         RETLW   00100100B	; offset: 2
         RETLW   00011000B	; offset: 3
         RETLW   00000000B	; offset: 4
         RETLW   00011000B	; offset: 5
         RETLW   00100100B	; offset: 6
         RETLW   01000010B	; offset: 7
         RETLW   10000001B	; offset: 8
         RETLW   00000000B	; offset: 8
   
        Next_seq:
         INCF Offset,1,0
         GOTO Loop
     RETURN
     
     LED1:
	 GOTO Dec_Counter2
RETURN
	 
LED_OFF:
  CLRF    LATC,1
	 
  
Config_osc:
    
    ;Configuracion del Oscilador Interno a una frecuencia de 4MHz
    BANKSEL OSCCON1
    MOVLW   0x60    ;seleccionamos el bloque del osc interno(HFINTOSC) con DIV=1
    MOVWF   OSCCON1,1 
    MOVLW   0x02    ;seleccionamos una frecuencia de Clock = 4MHz
    MOVWF   OSCFRQ,1
    RETURN
    
Config_port:
    
    ;Configuracion del led  - PORT-LAT-ANSEL-TRIS
    BANKSEL PORTF
    CLRF    PORTF,1	;PORTF = 0
    BSF	    LATF,3,1	;LATF<3> = 1	- LED OFF
    CLRF    ANSELF,1	;ANSEL<7,0> = 0 - PORTF DIGITAL
    BCF	    TRISF,3,1	;TRISF<3> = 0	- RF3 como salida 
    
    ;Configuracion del PORTC
    BANKSEL PORTC	
    CLRF    PORTC,1	;PORTF = 0	    
    CLRF    LATC,1	
    CLRF    ANSELC,1	;ANSEL<7,0> = 0 - PORTF DIGITAL
    CLRF    TRISC,1     ;PORTC.0 como SALIDA
    RETURN
    
    ;Configuracion INT0
    BANKSEL PORTA
    CLRF    PORTA,1	;PORTA<7,0> = 0
    CLRF    ANSELA,1	;PORTA DIGITAL
    BSF	    TRISA,3,1	;PORTA <3> COMO ENTRADA
    BSF	    WPUA,3,1	;ACTIVAMOS LA RESISTENCIA PULLUP
    
    ;Configuracion INT1
    BANKSEL PORTB
    CLRF    PORTB,1	;PORTB<7,0> = 0
    CLRF    ANSELB,1	;PORTB DIGITAL
    BSF	    TRISB,4,1	;PORTB <4> COMO ENTRADA
    BSF	    WPUB,4,1	;ACTIVAMOS LA RESISTENCIA PULLUP
   
    ;Configuracion INT2
    BANKSEL PORTF
    CLRF    PORTF,1	;PORTF<7,0> = 0
    CLRF    ANSELF,1	;PORTF DIGITAL
    BSF	    TRISF,2,1	;PORTF <2> COMO ENTRADA
    BSF	    WPUF,2,1	;ACTIVAMOS LA RESISTENCIA PULLUP
      
Config_pps:
    
    ;Config INT1
    BANKSEL INT1PPS
    MOVLW 0x0C
    MOVWF INT1PPS,1   ;INT1--->RB4
    
    ;Config INT2
    BANKSEL INT2PPS
    MOVLW 0x2A
    MOVWF INT2PPS,1   ;INT2--->RF2
    RETURN
    
Config_INT:
    ;Config Prioridades
    BSF INTCON0,5,0	;INTCON0<IPEN>=1  --- Se habilita las prioridades
    BANKSEL IPR1
    BSF IPR6,0,1      ;IPR6<INT1IP>=1   --- INT1 de alta prioridad
    BSF IPR10,0,1     ;IP10<INT2IP>=1   --- INT2 de alta prioridad
    
    
    ;Config de INT1
    BCF INTCON0,0,0   ;INTCON0<INT1EDG>=0   --- INT1 por flanco de bajada
    BCF PIR6,0,0      ;PIR6<INT1IF>=0	    --- Limpiamos el flag de interupción
    BSF PIE6,0,0      ;PIE6<INT1IE>=1	    --- Habilitamos la interrupción ext1

    ;Config de INT2
    BCF INTCON0,0,0   ;INTCON0<INT2EDG>=0   --- INT2 por flanco de bajada
    BCF PIR10,0,0      ;PIR10<INT2IF>=0	    --- Limpiamos el flag de interupción
    BSF PIE10,0,0      ;PIE10<INT2IE>=1	    ---	Habilitamos la interrupción ext2
    
    BSF INTCON0,7,0   ;INTCON0<GIE/GIEH>=1  --- Habilitamos las interrupciones de forma global
    
    RETURN
    
Config_INT0:

    ;PPS INT0
    BANKSEL INT0PPS
    MOVLW 0x03
    MOVWF INT0PPS,1   ;INT0-->RA3
    
    BCF IPR1,0,1      ;IPR1<INT0IP>=0   --- INT0 de baja prioridad
    BANKSEL IPR1
    BCF INTCON0,0,0   ;INTCON0<INT0EDG>=0 --- INT0 por flanco de bajada
    BCF PIR1,0,0      ;PIR1<INT0IF>=0 --- Limpiamos el flag de interupción
    BSF PIE1,0,0      ;PIE1<INT0IE>=1 ---Habilitamos la interrupción ext0
    BSF INTCON0,6,0   ;INTCON0<GIEL>=1 --- Habilitamos las interrupciones de baja prioridad
  

    RETURN


 
 
End resectVect
