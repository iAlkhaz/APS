[x, n] = escalon(0, 0, 20); % entrada escalón
w = [0 : 0.01 : 1] * pi; % rango de frecuencia
% Filtro con a = 0.8
a = [1, -0.8]; b = 1 - 0.8;
s1 = filter(b, a, x); % resp. escalón
M1 = abs(freqz(b, a, w)); % mag. resp. frec.
% Filtro con a = 0.9
a = [1, -0.9]; b = 1 - 0.9;
s2 = filter(b, a, x); % resp. escalón
M2 = abs(freqz(b, a, w)); % mag. resp. frec.
subplot 221; stem(n, s1); grid;
title('Rpta. escalón a = 0.8'); xlabel('n')
subplot 223; stem(n, s2); grid;
title('Rpta. escalón a = 0.9'); xlabel('n')
subplot 222; plot(w/pi,M1); grid;
title('Magnitud(H) a = 0.8'); xlabel('w/pi')
subplot 224; plot(w/pi,M2); grid;
title('Magnitud(H) a = 0.9'); xlabel('w/pi')