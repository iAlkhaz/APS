int N = 16; /* Número de muestras del bloque (modificable) */
float REX[16]; /* Parte real de datos y resultados */
float IMX[16]; /* Parte imaginaria de datos y resultados */
float Mag[16]; /* Magnitud de resultados */
float PI = 3.14159265;
int I, IP, JM1, K, L, LE, LE2, NM1, ND2, M, J;
float TR, TI, UR, UI, SR, SI;
int main (void)
{
NM1 = N-1;
ND2 = N/2;
M = ceil(log(N)/log(2)); /* log2(N) */
J = ND2;
for(L=0; L<=(N-1); L++) /* Generación de la secuencia de prueba */
{
REX[L] = 2 + 2*cos(2*PI*L/N) + 4*sin(2*PI*3*L/N);
}
for(I=1; I<=N-2; I++) /* Reordenamiento de los datos */
{
if(I>=J)
{
goto L1;
}

TR = REX[J];
TI = IMX[J];
REX[J] = REX[I];
IMX[J] = IMX[I];
REX[I] = TR;
IMX[I] = TI;
L1: K = ND2;
L2: if(K>J)
{
goto L3;
}
J = J-K;
K = K/2;
goto L2;
L3: J = J+K;
}
for(L=1; L<=M; L++) /* Loop de etapas */
{
LE = ceil(pow(2,L));
LE2 = LE/2;
UR = 1;
UI = 0;
SR = cos(PI/LE2);
SI = -sin(PI/LE2);
for(J=1; J<=LE2; J++)
{
JM1 = J-1;

for(I=JM1; I<=NM1; I=I+LE) /* Loop de "mariposas" */
{
IP = I+LE2;
TR = REX[IP]*UR-IMX[IP]*UI;
TI = REX[IP]*UI+IMX[IP]*UR;
REX[IP] = REX[I]-TR;
IMX[IP] = IMX[I]-TI;
REX[I] = REX[I]+TR;
IMX[I] = IMX[I]+TI;
}
TR = UR;
UR = TR*SR-UI*SI;
UI = TR*SI+UI*SR;
}
}
REX[0]=REX[0]/2; /* Normalización de magnitudes */
IMX[0]=IMX[0]/2; /* No es parte de la FFT */
for(L=0; L<=N-1; L++)
{
REX[L] = REX[L]/ND2;
IMX[L] = IMX[L]/ND2;
}
for(L=0; L<=((N/2)-1); L++) /* Cálculo de magnitud espectral */
{
Mag[L] = sqrt(REX[L]*REX[L] + IMX[L]*IMX[L]);
}