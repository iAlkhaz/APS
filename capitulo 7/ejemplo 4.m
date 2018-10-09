N = 16;
n = [0 : 1 : N-1];
x = 2 + 2 * cos(2*pi * 1 * n/N) + 4 * sin(2*pi * 3 *n/N);
[X] = dft(x);