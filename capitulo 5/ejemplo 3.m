nx = 0 : 60; x = sin(0.1*pi * nx); % entrada
nh = 0 : 100; h = 0.9 .^ nh; % h(n)
[y, ny] = convol(x, nx, h, nh); % salida
stem(nx, x, 'b'); hold on; stem(ny, y, 'r');
axis([0 70 -5 5]); grid; title('azul: x(n) rojo: y(n)')