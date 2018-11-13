load('ecg_orig.txt')
load('ecg_rdo.txt')
n1 = 1400; % n inicial
n2 = 1800; % n final
n = (n1 : n2);
t = n / 200; % [seg]
t1 = n1 / 200; % t inicial
t2 = n2 / 200; % t final
subplot 221; plot(t, ecg_orig(n));
title('ECG original [mV]')
axis([t1 t2 -1 1.5]);
xlabel('seg.'); grid;
subplot 222; plot(t, ecg_rdo(n));
title('ECG contaminado [mV]')
axis([t1 t2 -1 1.5]);
xlabel('seg.'); grid;