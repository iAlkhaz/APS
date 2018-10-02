clear;
A=1 ; B=9 ; C=2 ; D=8 ; E=2 ; F=9 ; G=9 ; H=0 ; I=9 ;
t = 0 : 0.3 : 30; 
v = exp(-((B+A)/(2*C*(D+E)))* t) .* sin(t);
subplot 121; plot(t, v); title('PLOT');
xlabel('Tiempo [seg]'); ylabel('Volts'); grid;
subplot 122; stem(t, v); title('STEM');
xlabel('Tiempo [seg]'); ylabel('Volts'); grid; 