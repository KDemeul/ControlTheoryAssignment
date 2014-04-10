close all
clear all
clc

digits(2)

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

RGA0mp = zeros(size(RGAmp,1),size(RGAmp,2));
RGA0nmp = zeros(size(RGAnmp,1),size(RGAnmp,2));

for i=1:size(RGAmp,1)
    for j=1:size(RGAmp,2)
        RGA0mp(i,j) = vpa(poly2sym(cell2mat(RGAmp(i,j).num),0)/poly2sym(cell2mat(RGAmp(i,j).den),0));
        RGA0nmp(i,j) = vpa(poly2sym(cell2mat(RGAnmp(i,j).num),0)/poly2sym(cell2mat(RGAnmp(i,j).den),0));
    end
end
