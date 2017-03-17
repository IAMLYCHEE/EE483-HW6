clear
%a
fs = 100;
t = 0 : 1/fs : 40-1/fs;
N = length(t);
index = t * fs;
signal = cos(3 * pi * t) .* (t < 10) +...
    1/2 * sin(3.5 * pi * t) .* (t >= 10 & t < 20)+...
    1/6 * cos(4 * pi * t) .* (t >= 20 & t < 30) +...
    sin(4.75 * pi * t) .* (t >= 30 & t < 40);
X = fft(signal);
t = (index - N/2)/ N * fs * 2;
plot(t,log(abs(fftshift(X))))
xlabel('\times \pi')
title('rect')
%b
%hamming
window = hamming(N);
x = signal .* window';
X = fft(x);
t = (index - N/2)/ N * fs * 2;
figure
plot(t,log(abs(fftshift(X))))
xlabel('\times \pi')
title('Hamming')

%hann
window = hann(N);
x = signal .* window';
X = fft(x);
t = (index - N/2)/ N * fs * 2;
figure
plot(t,log(abs(fftshift(X))))
xlabel('\times \pi')
title('Hann')

%blackman
window = blackman(N);
x = signal .* window';
X = fft(x);
t = (index - N/2)/ N * fs * 2;
figure
plot(t,log(abs(fftshift(X))))
xlabel('\times \pi')
title('blackman')