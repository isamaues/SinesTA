#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
 
import serial
import time
 
ser = serial.Serial('/dev/rfcomm0', 9600)
#ser.open()
print(ser.is_open) #True
print(ser)
time.sleep(3)
#textoSaida = str(input('o que você quer enviar para o arduino? '))
#ser.write(textoSaida.encode('ascii')) 
ser.write('A')
print('ok')
'''
print(" Olha o que chegou ")
textoEntrada = ser.readline()
print(textoEntrada.decode('utf-8'))
'''
ser.close()
print(ser.is_open) #False
