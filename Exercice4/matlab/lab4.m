close all
clear all
clc

s = tf('s');
sysmp = minphase;
sysnmp = nonminphase;
Gmp = tf(sysmp);
Gnmp = tf(sysnmp);

RGAmp = Gmp.*(Gmp^-1)';
RGAnmp = Gnmp.*(Gnmp^-1)';

wc_mp = 0.1;
wc_nmp = 0.02;
phim = pi/3;

w11 = 1;
w22 = 1;
w12 = minreal(-Gnmp(1,2)/Gnmp(1,1));
w21 = minreal(-Gnmp(2,1)/Gnmp(2,2));

W1 = -[[w11 w12];[w21 w22]];
Gt_nmp = minreal(Gnmp*W1);
% bode(Gt_nmp)
% grid

Ti_nmp = 1/(2*wc_nmp);

f11 = (1+Ti_nmp*s)/(Ti_nmp*s);
f22 = (1+Ti_nmp*s)/(Ti_nmp*s);

K11_nmp = 10^(-3.62/20);
K22_nmp = 10^(-2.87/20);

f11_nmp = K11_nmp*f11;
f22_nmp = K22_nmp*f22;

Ft_nmp = [[f11_nmp 0];[0 f22_nmp]];
% bode(Ft_nmp*Gt_nmp)
% grid

F_nmp = W1*Ft_nmp;
% figure
% bode(F_nmp*Gnmp)
% grid

F = F_nmp;
G = Gnmp;

L0 = G*W1*Ft_nmp;
[Fr,gam] = rloop(L0,1.1);

F = W1*Ft_nmp*Fr;