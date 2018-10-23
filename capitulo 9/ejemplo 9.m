N = 20480; n = [0 : N-1];
x = 0.08 * cos(2*pi * 490 * n/N) + ...
cos(2*pi * 516 * n/N) + ...
cos(2*pi * 523.6 * n/N) + ...
0.003 * cos(2*pi * 600 * n/N);

% FFT con ventana rectangular
Mr = (2/N) * abs(fft(x));
% FFT con ventana Hamming
xm = x .* hamming(N)';
M = mean(hamming(N)); % factor de atenuación de la ventana
Mm = (1/M) * (2/N) * abs(fft(xm));
% FFT con ventana Hanning
xn = x .* hanning(N)';
M = mean(hanning(N)); % factor de atenuación de la ventana
Mn = (1/M) * (2/N) * abs(fft(xn));
% FFT con ventana Blackman
xb = x .* blackman(N)';
M = mean(blackman(N)); % factor de atenuación de la ventana
Mb = (1/M) * (2/N) * abs(fft(xb));
subplot 221; k = [0 : N-1]; semilogy(k, Mr); axis([400 650 0.001 1]);
grid; title('Rectangular'); ylabel('Mag')
subplot 222; semilogy(k, Mm); axis([400 650 0.001 1]);
grid; title('Hamming'); ylabel('Mag')
subplot 223; semilogy(k, Mn); axis([400 650 0.001 1]);
grid; title('Hanning'); xlabel('k'); ylabel('Mag')
subplot 224; semilogy(k, Mb); axis([400 650 0.001 1]);
grid; title('Blackman'); xlabel('k'); ylabel('Mag')