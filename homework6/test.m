%a
fs = 10;
t = 0 : 1/fs : 40-1/10;
N = length(t);
index = t * fs;
x = cos(3 * pi * t) .* (t < 40) ;
X = fft(x);
t = (index - 200)/ N * fs * 2;
plot(t,abs(fftshift(X)))
xlabel('\times \pi')

%b
window = hamming(400);
x = cos(3 * pi * t) .* (t < 40);
x = x .* window';
X = fft(x);
t = (index - 200)/ N * fs * 2;
figure
plot(t,abs(fftshift(X)))
xlabel('\times \pi')