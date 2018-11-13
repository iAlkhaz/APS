N = 1000; n = [1 : N];
R = 2 * randn(1, N); % ruido
S = cos(2*pi * 8 * n/N); % sinusoide
Q = S + R; % ruido + sinusoide
ACr = xcorr(R); ACs = xcorr(S); ACq = xcorr(Q);
subplot 321; plot(R); grid; ylabel('R')
subplot 322; plot(ACr); grid; ylabel('AC[R]')
subplot 323; plot(S); grid; ylabel('S')
subplot 324; plot(ACs); grid; ylabel('AC[S]')
subplot 325; plot(Q); grid; ylabel('S+R')
subplot 326; plot(ACq); grid; ylabel('AC[S+R]')