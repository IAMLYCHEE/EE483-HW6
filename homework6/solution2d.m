clear
fs = 10;
t = 0 : 1/fs : 40-1/fs;
N = length(t);
index = t * fs;
signal = cos(3 * pi * t) .* (t < 10) +...
    1/2 * sin(3.5 * pi * t) .* (t >= 10 & t < 20)+...
    1/6 * cos(4 * pi * t) .* (t >= 20 & t < 30) +...
    sin(4.75 * pi * t) .* (t >= 30 & t < 40);
tWindow  = 1;
windowLength = fs * tWindow;
window = hamming(windowLength)';
yAmount = length(0:0.05:2*pi);
result = zeros(yAmount, N-windowLength + 1); 
for m = 0 : N - windowLength
    k = 1;
    for omega = 0 : 0.05 : 2 * pi
        index = m + 1 : m + windowLength;
        result(k,m+1)=sum(signal(index) .* window .* exp(-1i*omega*index));
        k = k + 1; %put less frequency down the axis
    end
end
imagesc(abs(result));
ytickLabels = linspace(0,2*pi,length(1:5:size(result,1)));
set(gca, 'YTick',1:5:126 , 'YTickLabel', ytickLabels)

    