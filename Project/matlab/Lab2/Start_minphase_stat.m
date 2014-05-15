% clear all;
% close all;
clc;

I = eye(2);
s = tf('s');
F = ss(I);
G = minphase;
Ftf = tf(F);
Gtf = tf(G);

% ===== PAIRING ANALYSIS =====
if 0
    RGA = freqresp(Gtf.*(I/Gtf)',0)
end
% CONCLUSION: pairing u1 -> y1, u2 -> y2

% ===== STATIC DECOUPLING =====
G0 = freqresp(G,0);
Gtil = minreal(G/G0);

% ===== PI-CONTROLER DESIGN =====
wc = 0.1;
phim = pi/3;

phi1 = - phase(freqresp(Gtil(1,1),wc)) - pi + phim; % Phase for the PI controller at wc
Ti1 = 1/wc * tan(phi1 + pi/2);
Faux = 1+1/(Ti1*s);
K1 = 1/norm(freqresp(Gtil(1,1)*Faux,wc));

phi2 = - phase(freqresp(Gtil(2,2),wc)) - pi + phim; % Phase for the PI controller at wc
Ti2 = 1/wc * tan(phi2 + pi/2);
Faux = 1+1/(Ti2*s);
K2 = 1/norm(freqresp(Gtil(2,2)*Faux,wc));

Ftiltf = [[K1*(1+1/(Ti1*s)), 0];[0, K2*(1+1/(Ti2*s))]];
F = ss(G0\Ftiltf);

if 0
    margin(Gtf(1,1)*Ftiltf(1,1));
    margin(Gtf(2,2)*Ftiltf(2,2));
end

% ===== S AND T ANALYSIS =====
if 1
    S = (I+G*F)\I;
    T = (I+G*F)\G*F;
    H1 = figure,sigma(S,{0.001,10});
    hold on;
    H2 = figure,sigma(T,{0.001,10});
    hold on;
end

sim('closedloop');





