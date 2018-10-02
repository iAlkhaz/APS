n = -20 : 20; n(21) = 0.001; h = sin((pi/2)*n) ./ (pi*n);
subplot 221; stem(n, h); grid; title('h(n) limitada a 41 muestras');
n = -20 : 20; n(21) = 0.001; h = sin((pi/2)*n) ./ (pi*n);
w = 0 : (pi/1000) : pi; H1 = dtft(h, n, w);
n = -80 : 80; n(81) = 0.001; h = sin((pi/2)*n) ./ (pi*n);
w = 0 : (pi/1000) : pi; H2 = dtft(h, n, w);

plot(w/pi, abs(H1), 'r', w/pi, abs(H2), 'b');
title('Mag [ H(w) ] rojo : 41 m azul : 161 m');
xlabel('w/pi [rad/m]'); grid;