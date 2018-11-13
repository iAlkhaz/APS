N = 25 / 2; % constante de tiempo deseada
k = exp(-1/N); % constante "a" del filtro
[x, n] = impulso(0, 0, 50); % entrada impulso
a = [1, -k]; % coeficientes de y(n)
b = [1-k]; % coeficientes de x(n)
h = filter(b, a, x); % filtraje: resuelve la ED
stem(n, h); title('h(n)'); xlabel('n'); grid;