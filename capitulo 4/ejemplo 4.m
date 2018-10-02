fx = 0.05; % frecuencia [c/m] de x
fs = 0.05; % frecuencia [c/m] de las sinusoides de la DTFT
for pxg = -180 : 30 : 180, % fase de x en grados
px = (pi/180) * pxg; % fase de x en rad

n = [0 : 1 : 19]; % vector n
x = cos(2*pi * fx * n - px); % secuencia x
c = cos(2*pi * fs * n); % componente coseno de la DTFT
s = sin(2*pi * fs * n); % componente seno de la DTFT
PrCos = x .* c; % producto punto a punto con comp. coseno
PrSen = x .* s; % producto punto a punto con comp. seno
SPC = sum(PrCos); % sumatoria de productos con comp. coseno
SPS = sum(PrSen); % sumatoria de productos con comp. seno
pcxg = (180/pi) * atan2(SPS, SPC); % calcula fase de x en grados
fprintf('pxg: %3.0f SPC = %2.2f SPS = %2.2f pcxg = %3.1f \n'...
, pxg, SPC, SPS, pcxg)
end