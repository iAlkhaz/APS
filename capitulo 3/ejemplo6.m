a = [1, -1, 0.9];
b = 1;
[x, n] = impulso(0,-20,100);
h = filter(b, a, x);
plot(n, h);
title('Respuesta Impulso')
xlabel('n'); grid