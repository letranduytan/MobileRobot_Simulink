clc, clear all, close all
Vin = 12;
Kt = 1.1882;
Ra = 0.1557;
La = 0.82;
Jm = 0.271;
bm = 0.271;
Kb = 1.185;
n = 3;
r = 0.075;
Kp=36.55;
Ki=8.33;
Kd=8.73;
Ki1=50;
Kp1=22;
Z=Ki1/Kp1;
chair_height = 0.920;
chair_width = 0.580;
Dist_wheels = 0.40; % m, distance between wheels
JLoad = (chair_width * (chair_height)^3) / 12;
bLoad = 1.091;
Jequiv = Jm + JLoad / (n)^2;
bequiv = bm + bLoad / (3)^2;
desired_linear_speed = 0.5; % m/s
desired_angular_speed = (desired_linear_speed) / r;
Ktach = Vin / desired_angular_speed;
num = [Kt / n];
% Corrected denominator: coefficients of the polynomial
den = [La*Jequiv, Ra*Jequiv + bequiv*La, Ra*bequiv + Kt*Kb];
G_robot_open = tf(num, den);
step(12 * G_robot_open)
sisotool(G_robot_open)