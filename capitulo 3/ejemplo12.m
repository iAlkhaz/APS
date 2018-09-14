h = 1 : 1000; % inventa h(n)
x = 1 : 500000; % inventa x(n)
tic; % registra instante inicial
[y] = conv(x, h); % convuelve
s = toc; % tiempo de cálculo [seg]
N = 2 * length(h) * length(x); % num. OPF
MFps = 1E-6 * N / s; % mega flops
fprintf('Millones ops. : %5.0f\n', 1E-6 * N)
fprintf('Tiempo [seg] : %2.2f\n', s)
fprintf('Veloc. MFLOPS : %5.0f\n\n', MFps)