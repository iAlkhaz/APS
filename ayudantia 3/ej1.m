a = [1, -1, 0.9];
b = 1;
[x, n] = escalon(0,-40,200);
h = filter(b, a, x);


a1 = [1, -1, 0.9];
b1 = 1;
[x1, n1] = impulso(0,-40,200);
h1 = filter(b1, a1, x1);


subplot 211; plot(n, h); title('Respuesta Escalon'); xlabel ('n'); grid

subplot 212; plot(n1,h1); title('Respuesta impulso'); xlabel ('n'); grid