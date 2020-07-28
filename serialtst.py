import serial
ser = serial.Serial("/dev/ttyAMA0") #bluetooth pin raspberry pi 3 b
print(ser.name)
print(ser.is_open) #True
ser.write(b"hello")
ser.close()
print(ser.is_open) #False
