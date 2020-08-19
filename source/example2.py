#application example 2 (5 times)
import os
for i in range(5):
  os.system("arecord -D hw:1,0 -f S16_LE -c1 -r44100 -s 43000 test.wav")
  os.system("python3 inference9.py test.wav")
