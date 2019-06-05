; Frecuencia del reloj 12MHz = 12,000,000 Hz (12,000,000 ciclos por segundo)
; Necesitamos que la frecuencia del puerto sea  de 1000Hz ()
; Y se apague durante 500Hz
; 6,000,000/500 
; Gastar 12,000 ciclos en el delay
; for(int i=0; i<n; i++) n veces 125  ldi r12, 0
;                                     ldi r13, 124
;                                     subi r12, 1
;                                     rjmp con_for1
;                                     
;   for(int j=0; j<m; j++) m veces 96
; 
.include "m8def.inc"
.org 0x0000
rjmp main
 
main:
ldi r16, low(RAMEND)
out SPL, r16
ldi r16, high(RAMEND)
out SPH, r16
 
ldi r16, 0xFF
out DDRB, r16

loop_main:
sbi PortB, 1
rcall delay
cbi PortB, 1
rcall delay
rjmp loop_main

delay:
ldi r16, 50  ; 1 Clock 125/2.5 = 50
outer_loop:
ldi r17, 38  ; 1 Clock  96/2.5 = 38

inner_loop:
dec r17      ; 1 Clock
brne inner_loop      ; 1 o 2 Clock

dec r16       ; 1 Clock
brne outer_loop       ; 1 o 2 Clock
ret             ; 4 Clocks
