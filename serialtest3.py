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
    #print('argv: ',str(argv))
    temp = '[' + argv[0] + ']'
    #print('temp: ', temp)
    ser.write(temp.encode('utf-8'))
    ser.close()
    #print(ser.is_open) #False
if __name__ == '__main__':
  main(sys.argv[1:])
