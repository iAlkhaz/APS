clear;
clc;
x = 2 * randn(1,20000);
fprintf('Minimo =%1.5f\n', min(x))
fprintf('Maximo =%1.5f\n', max(x))
fprintf('Medio =%1,5f\n', mean(x))
fprintf('RMS =%1.5f\n', std(x))
n= [0 : 19999];
subplot 221; plot(n, x); title('Ruido normal'); grid
subplot 222; hist(x, 100); title ('Histograma'); grid 
x1= 2* rand(1, 10000)-1;
x2= 2* rand(1, 10000)-1;
x3= 2* rand(1, 10000)-1;
x4= 2* rand(1, 10000)-1;
x5= 2* rand(1, 10000)-1;
sx= x1 + x2 + x3 + x4 + x5;
subplot 223; hist(x1, 100); title('Histograma de x1'); grid
subplot 224; hist(sx, 100); title('Histograma de sx'); grid
