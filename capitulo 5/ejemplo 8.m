n = 0 : 100; b = 0.9 .^ n; % h(n) -> b
a = 1; w = [0 : 0.001 : 1] * pi; % 1 -> a
H = freqz(b, a, w); % DTFT [h(n)]