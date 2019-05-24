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
ldi r16, 25
salto:
subi r16, 1
brne salto
ret