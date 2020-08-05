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
    if (argv == 'A'):
        ser.write(b'[A]')
    elif (argv == 'B'):
        ser.write(b'[B]')
    elif (argv == 'C'):
        ser.write(b'[C]')
    elif (argv == 'D'):
        ser.write(b'[D]')
    elif (argv == 'E'):
        ser.write(b'[E]')
    ser.close()
    #print(ser.is_open) #False
if __name__ == '__main__':
  main(sys.argv[0])
