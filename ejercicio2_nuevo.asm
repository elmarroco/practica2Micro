.include "m8def.inc"   
.org $0000

ldi     r16,low(ramend) 
out     spl, r16 
ldi     r16,high(ramend) 
out     sph, r16 
ldi     r16, 0b00111110      ;Coloca FF en el registro R16
out     ddrb, r16            ;Configura el Puerto B como SALIDAS 
out     ddrc, r16            ;Configura el Puerto D como SALIDAS 

ldi r16, 0
out ADMUX, r16              ;Configura ADMUX como b0000000 Para seleccionar el voltaje de referencia
                            ;no ajustar a la izquierda y seleccionar ADC0 como canal de entrada
ldi ADCSRA, 0b11000000      ;Configurar ADCSRA para Habilitar ADC, iniciar conversion 
                            ;y dividir el reloj entre 128
; Comienza la conversion
loop:
in r16, ADCL
in r17, ADCH
out PortB, r16
out PortD, r17
rjmp loop