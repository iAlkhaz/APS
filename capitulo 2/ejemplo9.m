n = [-20 : 1 : 20]; a = -0.1 + 0.3j; x = exp(a * n);
subplot 221; stem(n, real(x)); title('parte real'); xlabel('n')
subplot 222; stem(n, imag(x)); title('part imag'); xlabel('n')
subplot 223; stem(n, abs(x)); title('magnitud'); xlabel('n')
subplot 224; stem(n,(180/pi)*angle(x)); title('fase [°]'); xlabel('n')