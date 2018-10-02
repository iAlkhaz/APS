b = [1];
a = [1 -0.9]; % notar signo de 0.9
w = [0 : 0.001 : 1] * pi;
H = freqz(b, a, w); M = abs(H); A = (180/pi) * angle(H);
subplot 221; plot(w/pi, M); title('Magnitud');
xlabel('w / Pi [rad/m]'); grid;
subplot 222; plot(w/pi, A); title('Angulo');
xlabel('w / Pi [rad/m]'); grid;