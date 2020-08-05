#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
 
import serial
import time
import sys
def main(argv):
    ser = serial.Serial('/dev/rfcomm0', 9600)
    #ser.open()
    #print(ser.is_open) #True
    #print(ser)
    time.sleep(3)
    if (argv[0] == 'A'):
        ser.write(b'[A]')
    elif (argv[0] == 'B'):
        ser.write(b'[B]')
    elif (argv[0] == 'C'):
        ser.write(b'[C]')
    elif (argv[0] == 'D'):
        ser.write(b'[D]')
    elif (argv[0] == 'E'):
        ser.write(b'[E]')
    ser.close()
    #print(ser.is_open) #False
if __name__ == '__main__':
  main(sys.argv[1:])
