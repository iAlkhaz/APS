w = [0.099 : 0.00001 : 0.101] * pi;
MT = 1 ./ sqrt(1.81 - 1.8*cos(w));
AT = - (180/pi) * atan((0.9 * sin(w)) ./ (1 - (0.9 * cos(w))));
subplot 221; plot(w/pi, MT); xlim([0.099, 0.101]);
xlabel('w / Pi [rad/m]'); title('Magnitud'); grid;
subplot 222; plot(w/pi, AT); xlim([0.099, 0.101]);
xlabel('w / Pi [rad/m]'); title('Angulo [°]'); grid;