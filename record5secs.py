import pyaudio
import wave 

CHUNK = 8192
FORMAT = pyaudio.paInt24
CHANNELS = 1
RATE = 44100
RECORD_SECONDS = 10
dev_index = 2
WAVE_OUTPUT_FILENAME = "dog.wav"

p = pyaudio.PyAudio()

stream = p.open(
		format = FORMAT,
		channels = CHANNELS,
		rate = RATE,
		input_device_index = dev_index,
		input = True,
		frames_per_buffer = CHUNK)

print("* recording")

frames = []

for i in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
	data = stream.read(CHUNK)
	frames.append(data)

print("* done recording")

stream.stop_stream()
stream.close()
p.terminate()

wf = wave.open(WAVE_OUTPUT_FILENAME, 'wb')
wf.setnchannels(CHANNELS)
wf.setsampwidth(p.get_sample_size(FORMAT))
wf.setframerate(RATE)
wf.writeframes(b''.join(frames))
wf.close()

