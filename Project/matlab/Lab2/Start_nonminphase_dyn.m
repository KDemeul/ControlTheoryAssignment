clear all;
close all;
clc;

I = eye(2);
s = tf('s');
F = ss(I);
G = nonminphase;
wc = 0.02;
phim = pi/3;

Ftf = tf(F);
Gtf = tf(G);

% ===== PAIRING ANALYSIS =====
if 0
    RGA = freqresp(Gtf.*(I/Gtf)',0)
end
% CONCLUSION: pairing u1 -> y1, u2 -> y2

% ===== DYNAMIC DECOUPLING =====
w11 = -Gtf(2,2)/Gtf(2,1);
w22 = -Gtf(1,1)/Gtf(1,2);

w12 = 1;
w21 = 1;

Wtf = [[w11, w12];[w21, w22]] * (10*wc/(s+10*wc));
W = ss(Wtf);

Gtiltf = minreal(Gtf*Wtf);
Gtil = minreal(G*W);
if 0
    bode(Gtil);
end
% ===== PI-CONTROLER DESIGN =====
if 1
    phi1 = - phase(freqresp(Gtil(1,1),wc)) - pi + phim; % Phase for the PI controller at wc
    Ti1 = 1/wc * tan(phi1 + pi/2);
    Faux = 1+1/(Ti1*s);
    K1 = 1/norm(freqresp(Gtil(1,1)*Faux,wc));
    
    phi2 = - phase(freqresp(Gtil(2,2),wc)) - pi + phim; % Phase for the PI controller at wc
    Ti2 = 1/wc * tan(phi2 + pi/2);
    Faux = 1+1/(Ti2*s);
    K2 = 1/norm(freqresp(Gtil(2,2)*Faux,wc));
    
    Ftiltf = [[K1*(1+1/(Ti1*s)), 0];[0, K2*(1+1/(Ti2*s))]];
    Ftil = ss(Ftiltf);
    F = minreal(W * Ftil);
end
if 0
    margin(Gtiltf(1,1)*Ftiltf(1,1));
    margin(Gtiltf(2,2)*Ftiltf(2,2));
end

% ===== S AND T ANALYSIS =====
if 0
    S = (I+G*F)\I;
    T = (I+G*F)\G*F;
    figure(H1),sigma(S,{0.001,10});
    figure(H2),sigma(T,{0.001,10});
end

if 1
    sim('closedloop');
    figure,
    plot(y.time,y.signals.values);
    figure,
    plot(u.time,u.signals.values);
end

[A,By,C,Dy] = ssdata(F);
save reg3.MAT A By C Dy