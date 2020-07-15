#application example
import os
#os.system("command")
#os.system("arecord -D hw:1,0 -d 8 -f cd campainha.wav -c1")
#os.system("aplay campainha.wav")
os.system("python3 inference8.py DogWavMono0975secs1600hz15600samples.wav")
