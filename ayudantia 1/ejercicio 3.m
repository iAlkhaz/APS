clear;
A=1;B=9;C=2;D=8;E=2;F=9;G=9;H=0;I=9;
%mi rut es AB.CDE.FGH-I
%y(n)= 0.1 x(n) + 0.9 y(n-1)
vi= 1;%voltaje de la entrada
a = 0.9;% constante del filtro
dt = 10e-3; %1/100 Hz = 10 mseg
t(1)= 0; % incide l => t = 0
vf(1) = 0; % incide l => t = 0
for i = 2: 41;
    t(i)= (i-1)* dt;
    vf(i) = (1-a) * vi + a * vf(i-1);
end
close; stem(t, vf); %grafico
xlabel('seg');grid