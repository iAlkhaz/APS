% N = 256. Genera y grafica s, r, s+r, y la mag[DFT(s+r)]
N = 256; n = [0 : N-1]; k = 20;
s = cos(2*pi*k*n/N); r = 2*randn(1,N); sr = s + r;
x = sr .* hanning(N)';
subplot 321; plot(n, s); title('s'); axis([1 N -10 10]); grid;
subplot 323; plot(n, r); title('r'); axis([1 N -10 10]); grid;
subplot 325; plot(n,sr); title('s+r'); axis([1 N -10 10]); grid;
[X] = fft(x); M = 2 * (2/N) * abs(X(1:N/2));
subplot 322; k = [0 : N/2-1]; plot(k, M); grid;
title('|S+R| N=256 k=20'); axis([0 N/2-1 0 1.2]);
% N = 1024. Genera s+r, y grafica la mag[DFT(s+r)]
N = 1024; n = [0 : N-1]; k = 80;
x = (cos(2*pi*k*n/N) + 2*randn(1,N)) .* hanning(N)';
[X] = fft(x); M = 2 * (2/N) * abs(X(1:N/2));
subplot 324; k = [0 : N/2-1]; plot(k, M); grid;
title('|S+R| N=1024 k=80'); axis([0 N/2-1 0 1.2]);
% N = 4096. Genera s+r, y grafica la mag[DFT(s+r)]
N = 4096; n = [0 : N-1]; k = 320;
x = (cos(2*pi*k*n/N) + 2*randn(1,N)) .* hanning(N)';
[X] = fft(x); M = 2 * (2/N) * abs(X(1:N/2));
subplot 326; k = [0 : N/2-1]; plot(k, M); grid;
title('|S+R| N=4096 k=320'); axis([0 N/2-1 0 1.2]);