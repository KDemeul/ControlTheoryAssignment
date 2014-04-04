clear all
close all

s = tf('s');
G = 20/((s + 1)*((s/20)^2+s/20+1));
Gd = 10/(s+1);

% wc = 3/0.2; %tr = 0.2s
wc = 10;    %attenuation Gd
phi0 = 60;      %D = 10%

w0 = 1000*wc;

Fy = wc/(s*G);
Fym = w0^2*Fy/(s+w0)^2;

bode(Fy*G);
hold on
bode(Fym*G);
figure
step(Gd*feedback(1,Fy*G));
hold on
step(Gd*feedback(1,Fym*G));