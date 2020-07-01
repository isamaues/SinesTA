# tflite_model_adioset_yamnet_modified
  Slightly modified version of the yamnet and tensorflow implementations used on a audio recognition research project with academic purpose. The project is still on development and tests stages so none of it has been published or presented yet.

Original version's repository:

https://github.com/tensorflow/models/tree/master/research/audioset/yamnet

## Files removed:

Those files are not used on the application.
- README.md
- inference.py
- yamnet_vizualization.ipynb
- yamnet_test.py
- features.py


All those files can still be found on the original repository as mentioned above.

## Files added:
- inference6.py:

  Changes were made to the original inference.py example file due to dependency problems. Could not install scipy using pip or pip3 because of a compatibility problem with PEP517 that did not allow me to build scipy's wheel. Resampy was then removed because it's not supported on linux armv7l architecture using conda as well and it's only purpose was converting the argument to mono and the sample rate expected by YAMNet which can be set for recording.

- features_tflite.py:

  A modified version of features.py (original code). As exlplained on:
  
  https://medium.com/@antonyharfield/converting-the-yamnet-audio-detection-model-for-tensorflow-lite-inference-43d049bd357c

- yamnet.tflite:

  For compiling the a Lite the YAMNet model on raspberry pi.

# Installation
Check the installation_guide file for a step by step guide to installing and running the application.

