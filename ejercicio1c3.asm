; Frecuencia del reloj 12MHz = 12,000,000,000 Hz (12,000,000,000 ciclos por segundo)
; Necesitamos que la frecuencia del puerto sea  de 10,000Hz ()
; 90 ciclos prendidio y 30 ciclos apagado
; Gastar 900 ciclos en el delay
; for(int i=0; i<n; i++) n veces 125  ldi r12, 0
;                                     ldi r13, 124
;                                     subi r12, 1
;                                     rjmp con_for1
;                                     
;   for(int j=0; j<m; j++) m veces 96
;     a+b
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

loop:
sbi PortB, 1
rcall delay_off
cbi PortB, 1
rcall delay_on
rjmp loop

delay_on:
ldi r16, 25     ; 1 Clock 90/1.5 = 60
loop2:
dec r16         ; 1 Clock
brne loop2      ; 1/2 Clock
ret 

delay_off:
ldi r16, 8     ; 1 Clock 30/1.5 = 20
loop2:
dec r16         ; 1 Clock
brne loop2      ; 1/2 Clock
ret