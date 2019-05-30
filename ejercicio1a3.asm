; Frecuencia del reloj 12MHz = 12,000,000 Hz (12,000,000 ciclos por segundo)
; Necesitamos que la frecuencia del puerto sea  de 1000Hz ()
; Y se apague durante 500Hz
; 6,000,000/500 
; Gastar 12,000 ciclos en el delay
; Gastar 9,000 prendidio
; Gastar 3,000 apagado
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
rcall delay_of
cbi PortB, 1
rcall delay_on
rjmp loop

delay_on:
ldi r16, 50       ; 1 Clock 75/1.5 = 50
loop2_1:
ldi r17, 80       ; 1 Clock  120/1.5 = 80

loop3_1:
dec r17           ; 1 Clock
brne loop3_1      ; 1/2 Clock

dec r16           ; 1 Clock
brne loop2_1      ; 1/2 Clock
ret               ; 4 Clocks

delay_of:
ldi r16, 33       ; 1 Clock 50/1.5 = 33
loop2_2:
ldi r17, 40       ; 1 Clock  60/1.5 = 40

loop3_2:
dec r17           ; 1 Clock
brne loop3_2      ; 1/2 Clock

dec r16           ; 1 Clock
brne loop2_2      ; 1/2 Clock
ret               ; 4 Clocks