function [promedio, desvstd] = estadistica(x)
% Retorna el promedio y la desviación estándar del vector x
N = length(x);
promedio = sum(x) / N;
desvstd = sqrt(sum((x - promedio) .^ 2) / (N - 1));