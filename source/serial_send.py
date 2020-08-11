import serial
import time
import sys
def main(argv):
    ser = serial.Serial('/dev/rfcomm0', 9600)
    time.sleep(3)
    temp = '[' + argv[0] + ']'
    ser.write(temp.encode('utf-8'))
    ser.close()
if __name__ == '__main__':
  main(sys.argv[1:])
