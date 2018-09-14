h = [0.2 0.2 0.2 0.2 0.2];
nh = [-2 -1 0 1 2];
[x, nx] = escalon(0, -10, 10);
[y, ny] = convol(x, nx, h, nh);
subplot 311; stem(nx, x); grid
axis([-5 5 0 1]); title('x(n)');
subplot 312; stem(nh, h); grid
axis([-5 5 0 1]); title('h(n)');
subplot 313; stem(ny, y); grid
axis([-5 5 0 1]); title('y(n)');