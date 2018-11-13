a = [1, -0.849]; % coeficientes de y(n)
b = 0.151; % coeficientes de x(n)
% Respuesta de frecuencia
w = [0 : 0.001 : 1] * pi; % rango de frecuencia
M = abs(freqz(b, a, w)); % magnitud de respuesta de frecuencia
f = 192 * w / (2 * pi); % frecuencia en kHz

subplot 221; plot(f, M); grid;
title('(a) Mag(H)'); xlabel('f [kHz]')
subplot 222; plot(f, M); grid; axis([4 6 0.66 0.76]);
title('(b) Ampliación'); xlabel('f [kHz]')