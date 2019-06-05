.org 0x0000
 
rjmp reset
 
.org 0x000E
rjmp ADC_ISR
reset:
ldi r16, low(RAMEND)
out SPL, r16
ldi r16, high(RAMEND)
out SPH, r16
 
ldi r16, 0xFF
out DDRD, r16
 
ldi r16, 0
out ADMUX, r16
ldi r16, 0b11101101
out ADCSR, r16
 
sei
 
loop:
rjmp loop
 
ADC_ISR:
push r16
in r16, SRE0G
push r16
push r17
 
in r16, ADCL
in r17, ADCH
lsr r17
ror r16
lsr r17
ror r16

com r16
out PortD, r16

pop r17
pop r16
out SREG, r16
pop r16
ret