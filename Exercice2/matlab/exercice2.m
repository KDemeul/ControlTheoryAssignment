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

step(Gmp);
figure
step(Gnmp);
