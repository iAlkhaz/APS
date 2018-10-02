w = [0 : 0.001 : 1] * pi;
% Mag y Ang Teóricos
MT = 1 ./ sqrt(1.81 - 1.8*cos(w));
AT = - (180/pi) * atan((0.9 * sin(w)) ./ (1 - (0.9 * cos(w))));
% Mag y Ang Numéricos
n = 0 : 20; h = 0.9 .^ n;
H = dtft(h, n, w);
MN = abs(H); AN = (180/pi) * angle(H);

subplot 221; plot(w/pi, MT, 'b', w/pi, MN, 'r');
title('MAGNITUD Azul: teórica Rojo: numérica')
xlabel('w / Pi [rad/m]'); grid;
subplot 222; plot(w/pi, AT, 'b', w/pi, AN, 'r');
title('ANGULO [°] Azul: teórico Rojo: numérico')
xlabel('w / Pi [rad/m]'); grid;