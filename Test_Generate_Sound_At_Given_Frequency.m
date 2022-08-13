Fs = 44100;        % Samples per second. 48000 is also a good choice
toneFreq = 1100;  % Tone frequency, in Hertz. must be less than .5 * Fs.
nSeconds = 10;      % Duration of the sound
a = sin(linspace(0, nSeconds*toneFreq*2*pi, round(nSeconds*Fs)));
sound(a,Fs); % Play sound at sampling rate Fs