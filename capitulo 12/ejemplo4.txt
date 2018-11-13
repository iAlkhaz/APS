fc = 0.05; % frecuencia de corte deseada [c/m]
k = exp(-2 * pi * fc) % constante 'a' del filtro
a = [1, -k]; % coeficientes de y(n)
b = [(1+k)/2, -(1+k)/2]; % coeficientes de x(n)

[ ( ) ( 1)] ( 1)
2
1
( ) × - - + × -

+
= x n x n a y n
a

y n

% Respuesta de frecuencia
w = [0 : 0.01 : 1] * pi; % rango de frecuencia
M = abs(freqz(b, a, w)); % mag. resp. frec
plot(w/(2*pi), M); title('Mag(H)'); xlabel('f [c/m]'); grid