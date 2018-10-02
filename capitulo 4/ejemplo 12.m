w = 0 : (pi/2000) : pi;
n1 = 0 : 40;
x1 = 2 * cos(0.1*pi * n1) + 3 * sin(0.2*pi * n1);
[X1] = dtft(x1, n1, w);
n2 = 0 : 200;
x2 = 2 * cos(0.1*pi * n2) + 3 * sin(0.2*pi * n2);
[X2] = dtft(x2, n2, w);
subplot 331; plot(n1, x1); xlabel('n'); grid
subplot 332; plot(w/pi, abs(X1)); xlabel('w / Pi [rad/m]'); grid
subplot 334; plot(n2, x2); xlabel('n'); grid
subplot 335; plot(w/pi, abs(X2)); xlabel('w / Pi [rad/m]'); grid