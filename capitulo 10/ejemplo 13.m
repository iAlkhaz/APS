s = audioread('se�al.wav');
specgram(s, 256, 44100) % default: window: Hanning noverlap: nfft/2