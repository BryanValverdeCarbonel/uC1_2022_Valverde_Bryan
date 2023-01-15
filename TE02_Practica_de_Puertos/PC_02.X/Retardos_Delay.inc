;--------------------------------------
    ;file:      Retardos_Delay.inc
    ;@version:	MPLAB X IDE v6.05
    ;@fecha:	2023/01/09
    ;@descripción: "Libreria para implementacion de retardos"
    ;@autor:	Bryan Alexander Valverde Carbonel
    
    ;Descripcion general del programa:
    ;Frecuencia = 4MHz
    ;TCY	= 1us
;--------------------------------
    

PSECT udata_acs
Valor1: DS 1      ;reserva 1 Byte en access ram
Valor2: DS 1      ;reserva 1 Byte en access ram
  
PSECT code

;----------------------------------------------------------------------
;Desarrollo de libreria para implementación de los siguientes retardos:
;10us	-> Retardo 01
;25us	-> Retardo 02
;50us	-> Retardo 03
;100us	-> Retardo 04
;200us	-> Retardo 05
;250us	-> Retardo 06
;500us	-> Retardo 07
;1ms	-> Retardo 08
;5ms	-> Retardo 09
;10ms	-> Retardo 10
;25ms	-> Retardo 11
;50ms	-> Retardo 12
;100ms	-> Retardo 13
;200ms	-> Retardo 14
;250ms	-> Retardo 15
;----------------------------------------------------------------------
 
; Retardo 01   -> 10us, T=(6+4b1)*TCY = (6+4(1))us = 10us
    
Delay_10us:                  ;  2TCY---CALL
    MOVLW  1                 ;  1 TCY
    MOVWF  Valor1,0          ;  1 TCY
    
Circulo1:   
    NOP                      ;  b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo1          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY

;--------------------------------    
; Retardo 02   -> 25us, T=(6+4b1)*TCY =  (6+4(5))us = 25us
    
Delay_25us:                  ;  2TCY---CALL
    MOVLW  5                 ;  1TCY
    MOVWF  Valor1,0          ;  1TCY
    
Circulo2:   
    NOP                      ;  b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo2          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY
    
;--------------------------------
; Retardo 03   -> 50us, T=(6+4b1)*TCY = (6+4(11))us = 50us 
    
Delay_50us:                  ;  2TCY---CALL
    MOVLW  11                ;  1TCY
    MOVWF  Valor1,0          ;  1TCY
    
Circulo3:   
    NOP                      ;  b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo3          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY
                                  
;--------------------------------                                 
; Retardo 04   -> 100us, T=(6+4b1)*TCY = (6+4(24))us = 100us
    
Delay_100us:                 ;  2TCY---CALL
    MOVLW  24                ;  1TCY
    MOVWF  Valor1,0          ;  1TCY
    
Circulo4:   
    NOP                      ;  b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo4          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY
                                  
;--------------------------------    
; Retardo 05   -> 200us, T=(6+4b1)*TCY = (6+4(49))us = 200us
    
Delay_200us:                 ;  2TCY---CALL
    MOVLW  49                ;  1TCY
    MOVWF  Valor1,0          ;  1TCY
    
Circulo5:   
    NOP                      ;   b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo5          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY
                                  
;--------------------------------
; Retardo 06   -> 250us, T=(6+4b1)*TCY = (6+4(61))us = 250us
    
Delay_250us:                 ;  2TCY---CALL
    MOVLW  61                ;  1TCY
    MOVWF  Valor1,0          ;  1TCY
    
Circulo6:   
    NOP                      ;   b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo6          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY
                                  
;--------------------------------   
; Retardo 07   -> 500us, T=(6+4b1)*TCY = (6+4(124))us = 500us
    
Delay_500us:                 ;  2TCY---CALL
    MOVLW  124               ;  1TCY
    MOVWF  Valor1,0          ;  1TCY
    
Circulo7:   
    NOP                      ;   b1*TCY
    DECFSZ Valor1,1,0        ;  (b1-1) + 3*TCY
    GOTO   Circulo7          ;  (b1-1)*2TCY
    RETURN                   ;  2*TCY
    
;--------------------------------    
; Retardo 08   -> 1ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 1*(1ms) + 1(1us) + 6us = 1.007ms
      
Delay_1ms:                    ;  2TCY---Call
    MOVLW  1                  ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter1:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter1:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter1     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter1     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY

;--------------------------------  
; Retardo 09   -> 5ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 5*(1ms) + 5(1us) + 6us = 5.011ms
      
Delay_5ms:                    ;  2TCY---Call
    MOVLW  5                  ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter2:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter2:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter2     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter2     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY
    
;--------------------------------    
; Retardo 10   -> 10ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 10*(1ms)+ 10(1us)+ 6us = 10.016ms
    
Delay_10ms:                   ;  2TCY---Call
    MOVLW  10                 ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter3:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter3:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter3     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter3     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY  
   
;--------------------------------    
; Retardo 11   -> 25ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 25*(1ms) + 25(1us) + 6us = 25.031ms
    
Delay_25ms:                   ;  2TCY---Call
    MOVLW  25                 ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter4:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter4:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter4     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter4     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY    
    
;--------------------------------    
; Retardo 12   -> 50ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 50*(1ms)+ 50(1us)+ 6us = 50.056ms}
    
Delay_50ms:                   ;  2TCY---Call
    MOVLW  50                 ;  1TCY
    MOVWF  Valor2,0          ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter5:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter5:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter5     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter5     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY  
      
;--------------------------------    
; Retardo 13   -> 100ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 100*(1ms) + 100(1us) + 6us = 100.106ms
    
Delay_100ms:                  ;  2TCY---Call
    MOVLW  100                ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter6:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter6:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter6     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter6     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY                              
   
;--------------------------------    
; Retardo 14   -> 200ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 200*(1ms) + 200(1us) + 6us = 200.106ms   
    
Delay_200ms:                  ;  2TCY---Call
    MOVLW  200                ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter7:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter7:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter7     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter7     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY 
    
;--------------------------------    
; Retardo 15   -> 250ms, T= (b2*(6+4(b1)us)) + b2*(1us) + 6*(1us) = (b2*(6+4(249)us)) + b2*(1us) + 6us = 250*(1ms) + 250(1us) + 6us = 250.256ms  
    
Delay_250ms:                  ;  2TCY---Call
    MOVLW  250                ;  1TCY
    MOVWF  Valor2,0           ;  1TCY
    ; T= (6+4b1)us = (6+4*(249)) = 1ms 
    
Circulo_Exter8:  
    MOVLW  249                ;  b2*TCY
    MOVWF  Valor1,0           ;  b2*TCY
    
Circulo_Inter8:
    Nop                       ;  b2*b1*TCY
    DECFSZ Valor1,1,0         ;  b2*((b1-1) + 3*TCY)
    GOTO   Circulo_Inter8     ;  b2((b1-1)*2TCY)
    DECFSZ Valor2,1,0         ;  (b2-1) + 3*TCY
    GOTO   Circulo_Exter8     ;  (b2-1)*2TCY
    RETURN                    ;  2*TCY

;--------------------------------
