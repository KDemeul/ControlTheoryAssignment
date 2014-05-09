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
w12 = minreal(-Gmp(1,2)/Gmp(1,1));
w21 = minreal(-Gmp(2,1)/Gmp(2,2));

W1 = [[w11 w12];[w21 w22]];
Gt_mp = Gmp*W1;
% bode(Gt_mp)
% grid

Ti_mp = 1/(2*wc_mp);

f11 = (1+Ti_mp*s)/(Ti_mp*s);
f22 = (1+Ti_mp*s)/(Ti_mp*s);

K11_mp = 10^(3.4/20);
K22_mp = 10^(4.53/20);

f11_mp = K11_mp*f11;
f22_mp = K22_mp*f22;

Ft_mp = [[f11_mp 0];[0 f22_mp]];
% bode(Ft_mp*Gt_mp)

F_mp = W1*Ft_mp;
% figure
% bode(F_mp*Gmp)
% grid

F = F_mp;
G = Gmp;

L0 = G*W1*Ft_mp;
[Fr,gam] = rloop(L0,1.1);

F = W1*Ft_mp*Fr;