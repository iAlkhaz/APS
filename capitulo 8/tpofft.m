function [] = tpofft(N)
% Mide y despliega el tiempo de c�lculo de la FFT
% Uso: tpofft(N)
% Dato: N (n�mero de puntos)

x = rand(1, N); % inventa datos aleatorios
M = int32(1); % n�mero de FFT a calcular (inicializado en 1)
k = int32(1); % contador de FFT calculadas (inicializado en 1)
s = 0; % tiempo de c�lculo en seg
while s < 1, % tiempo m�nimo de medici�n [seg]
tic; % registra instante inicial
for k = 1: M, % repite la FFT M veces
fft(x);
end
s = toc; % registra el tiempo de c�lculo
M = M * 2; % incrementa M exponencialmente
end
t = s * 1E6 / (single(M)/2); % calcula tiempo de 1 FFT en useg
fprintf('t = %6.2f us \n \n',t); % despliega el tiempo calculado