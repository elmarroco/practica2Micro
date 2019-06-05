; Frecuencia del reloj 12MHz = 12,000,000 Hz (12,000,000 ciclos por segundo)
; Necesitamos que la frecuencia del puerto sea  de 1000Hz ()
; Y se apague durante 500Hz
; 6,000,000/500 
; Gastar 24,000 ciclos en el delay
; Gastar 18,000 prendidio
; Gastar 6,000 apagado
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
rcall delay_on
cbi PortB, 1
rcall delay_of
rjmp loop

delay_on:
ldi r16, 60       ; 1 Clock 150/2.5 = 60
loop2_1:
ldi r17, 48       ; 1 Clock  120/2.5 = 80

loop3_1:
dec r17           ; 1 Clock
brne loop3_1      ; 1/2 Clock

dec r16           ; 1 Clock
brne loop2_1      ; 1/2 Clock
ret               ; 4 Clocks

delay_of:
ldi r16, 40       ; 1 Clock 100/2.5 = 40
loop2_2:
ldi r17, 24       ; 1 Clock  60/2.5 = 24

loop3_2:
dec r17           ; 1 Clock
brne loop3_2      ; 1/2 Clock

dec r16           ; 1 Clock
brne loop2_2      ; 1/2 Clock
ret               ; 4 Clocks