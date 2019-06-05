; Frecuencia del reloj 12MHz = 12,000,000 Hz (12,000,000 ciclos por segundo)
; Necesitamos que la frecuencia del puerto sea  de 10,000Hz ()
; 5,000 ciclos prendidio y 5,0000 ciclos apagado
; 6,000,000/5,000 = 1200
; Gastar 600 ciclos en el delay
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
rcall delay
cbi PortB, 1
rcall delay
rjmp loop

delay:
ldi r16, 16  ; 1 Clock 40/2.5 = 16
loop2:
ldi r17, 12  ; 1 Clock  30/2.5 = 12

loop3:
dec r17      ; 1 Clock
brne loop3      ; 1/2 Clock

dec r16       ; 1 Clock
brne loop2      ; 1/2 Clock
ret   