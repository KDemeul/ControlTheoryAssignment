clear all
close all

s = tf('s');
G = 3*(-s + 1) / ( (5*s + 1)*(10*s + 1) );

omegaC = 0.4;
phi0 = 50;

%--------------------
% Phase-lag action
%--------------------

gamma = 0;
Ti = 10;

Flag = (Ti*s+1)/(Ti*s+gamma);

%--------------------
% Phase-lead action
%--------------------

[m,p] = bode(G*Flag,omegaC);
p = p - 360;
[Gm,Pm,wp,wc] = margin(G*Flag);

phim = phi0 - (180+p);
a = (1 - sin(phim*pi/180))/(1 + sin(phim*pi/180));
T = 1 / (omegaC * sqrt(a));
K = sqrt(a)/m;

Flead = K*(1+T*s)/(1 + a*T*s);

Gc = G*Flag*Flead;

figure
hold on
step(G);
step(feedback(Gc,1));

figure
hold on
margin(G*Flag)
margin(Flag*Flead)
margin(Gc)

S = stepinfo(feedback(Gc,1));

figure
bode(feedback(Gc,1));
