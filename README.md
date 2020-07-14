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
- inference8.py:

  Changes were made to the original inference.py example file to be used with TFLite instead of the regular version of Tensorflow.

- features_tflite.py:

  A modified version of features.py (original code). As exlplained on:
  
  https://medium.com/@antonyharfield/converting-the-yamnet-audio-detection-model-for-tensorflow-lite-inference-43d049bd357c

- yamnet.tflite:

  For compiling the a Lite the YAMNet model on raspberry pi.

# Installation
Check the INSTALLATION_GUIDE file for a step by step guide to installing and running the application.

