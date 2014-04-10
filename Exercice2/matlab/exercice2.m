close all
clear all
clc

sysmp = minphase;
sysnmp = nonminphase;

[Amp,Bmp,Cmp,Dmp] = ssdata(sysmp);
[Anmp,Bnmp,Cnmp,Dnmp] = ssdata(sysnmp);

Gmp = tf(ssdata(sysmp));



% sigma(sysmp)
% hold on
% sigma(sysnmp)