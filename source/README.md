# About the files presented in this folder

## Naming Conventions
- Variable naming convention:

  my_variable

- Repository naming convention:

  my_repository

- File naming convention:

  my_file
  
## Example files
The examples above tests 2 scenarios of usage for this application; single interation with a pre-recorded audio and in a loop. 

- example1.py

Uses an audio example file and makes a single interation of the inference code.

- example2.py

Records the enviroment and makes an inference 5 times.

## Audio Examples files (.wav)

- Use the audios to make a few tests before running the application as for adjusting your microphone.

- The audios have 0,975 seconds of duration recorded on mono at 16000 Hz resulting in 15600 samples. Variations of those values may affect the result or not run at all since the original spectogram generation function was changed and it's not as flexible as the previous one. If you try to use other pre-recorded audio examples for personal purpose tests, keep those values in mind and edit your audio file to attend those inconvenient requirements.
