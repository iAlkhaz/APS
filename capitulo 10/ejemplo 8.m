N = 1024;
x = randn(1, N);
PT = sum(x .* x) / N; % Pot. en el dominio del tiempo
PSD = pwelch(x, boxcar(N), 0, N, 1); % PSD vía método de Welch
PF = sum(PSD) / N; % Pot. en el dominio de la frec.
fprintf('PT: %1.4f PF = %1.4f \n', PT, PF)