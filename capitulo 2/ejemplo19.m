x = 2 * randn(1, 20000); % val RMS = 2
fprintf('Minimo = %1.5f\n', min(x))
fprintf('Maximo = %1.5f\n', max(x))
fprintf('Medio = %1.5f\n', mean(x))
fprintf('RMS = %1.5f\n\n', std(x))
n = [0 : 19999];
subplot 211; plot(n, x)
subplot 212; hist(x, 100)
soundsc(x, 20000)