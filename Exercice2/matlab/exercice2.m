close all
clear all
clc

digits(7)

sysmp = minphase;
sysnmp = nonminphase;

[Amp,Bmp,Cmp,Dmp] = ssdata(sysmp);
[Anmp,Bnmp,Cnmp,Dnmp] = ssdata(sysnmp);

Gmp = tf(sysmp);
Gnmp = tf(sysnmp);

Zmp = cell(2);
Znmp = cell(2);
Pmp = cell(2);
Pnmp = cell(2);
for i=1:2
    for j=1:2
        Zmp{i,j} = zero(Gmp(i,j));
        Znmp{i,j} = zero(Gnmp(i,j));
        Pmp{i,j} = pole(Gmp(i,j));
        Pnmp{i,j} = pole(Gnmp(i,j));
    end
end

zmp = tzero(Gmp);
znmp = tzero(Gnmp);

pmp = pole(Gmp);
pnmp = pole(Gnmp);

sigmamp = sigma(Gmp);
sigmanmp = sigma(Gnmp);

Ginfmp = norm(Gmp,'Inf');
Ginfnmp = norm(Gnmp,'Inf');

RGAmp = Gmp.*(Gmp^-1)';
RGAnmp = Gnmp.*(Gnmp^-1)';

RGA0mp =  freqresp(RGAmp,0);
RGA0nmp =  freqresp(RGAnmp,0);

% step(Gmp);
% figure
% step(Gnmp);

phim = pi/3;
wcmp = 0.1;
wcnmp = 0.02;
syms Ti


T1mp = double(solve(phase(freqresp(Gmp(1,1),wcmp)) + atan(wcmp*Ti) - phim == -pi/2,Ti));
K1mp = 1/(abs(freqresp(Gmp(1,1),wcmp))*abs(freqresp(tf([T1mp 1],[T1mp 0]),wcmp)));
F1mp = tf([K1mp*T1mp K1mp],[T1mp 0]);

T2mp = double(solve(phase(freqresp(Gmp(2,2),wcmp)) + atan(wcmp*Ti) - phim == -pi/2,Ti));
K2mp = 1/(abs(freqresp(Gmp(2,2),wcmp))*abs(freqresp(tf([T2mp 1],[T2mp 0]),wcmp)));
F2mp = tf([K2mp*T2mp K2mp],[T2mp 0]);


T1nmp = double(solve(phase(freqresp(Gnmp(1,2),wcnmp)) + atan(wcnmp*Ti) - phim == -pi/2,Ti));
K1nmp = 1/(abs(freqresp(Gnmp(1,2),wcnmp))*abs(freqresp(tf([T1nmp 1],[T1nmp 0]),wcnmp)));
F1nmp = tf([K1nmp*T1nmp K1nmp],[T1nmp 0]);

T2nmp = double(solve(phase(freqresp(Gnmp(2,1),wcnmp)) + atan(wcnmp*Ti) - phim == -pi/2,Ti));
K2nmp = 1/(abs(freqresp(Gnmp(2,1),wcnmp))*abs(freqresp(tf([T2nmp 1],[T2nmp 0]),wcnmp)));
F2nmp = tf([K2nmp*T2nmp K2nmp],[T2nmp 0]);



F = [F1mp,0;0,F2mp];
G = Gmp;

F = [0 F1nmp;F2nmp 0];
G = Gnmp;

L = F*G; 

I = tf(eye(size(G*F)));
S = (I+G*F)^-1;
T = S*G*F;
% 
% sigma(S);
% hold on
% sigma(T);