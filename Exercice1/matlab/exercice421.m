clear all
close all

s = tf('s');
G = 20/((s + 1)*((s/20)^2+s/20+1));
Gd = 10/(s+1);

% wc = 3/0.2; %tr = 0.2s
wc = 10;    %attenuation Gd
phi0 = 60;      %D = 10%

w0 = 100*wc;

Fy = wc/(s*G);
Fym = w0^2*Fy/(s+w0)^2;

bode(Fy*G);
hold on
bode(Fym*G);
figure
step(feedback(Gd,Fy*G));
hold on
step(feedback(Gd,Fym*G));

% S = 10^(66/20)*wc/(s*(s^2+2*ksi*w0*s+w0^2));
% Gdc = minreal(feedback(Gd,S));


% 
% %--------------------
% % Phase-lag action
% %--------------------
% gamma = 0;
% Ti = 10;
% 
% Flag = (Ti*s+1)/(Ti*s+gamma);
% 
% %--------------------
% % Phase-lead action
% %--------------------
% 
% [m,p] = bode(G*Flag,omegaC);
% p = p - 360;
% [Gm,Pm,wp,wc] = margin(G*Flag);
% 
% phim = phi0 - (180+p);
% a = (1 - sin(phim*pi/180))/(1 + sin(phim*pi/180));
% T = 1 / (omegaC * sqrt(a));
% K = sqrt(a)/m;
% 
% Flead = K*(1+T*s)/(1 + a*T*s);
% % margin(F)
% % margin(F*G);
% 
% Gc = G*Flag*Flead;
% 
% figure
% hold on
% step(G);
% step(feedback(Gc,1));
% 
% figure
% hold on
% margin(G*Flag)
% margin(Flag*Flead)
% margin(Gc)
% 
% S = stepinfo(feedback(Gc,1));
% 
% figure
% bode(feedback(Gc,1));
