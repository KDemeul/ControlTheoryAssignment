close all
clear all
clc


s = tf('s');
G = 1e4*(s+2)/(s+3)/(s+100)^2;
G0 = 10e4*(s+2)/(s+3)/(s+100)^2*(s-1)/(s + 2);

Hinf(G);


% Fsim=F;
% Gsim=G;
% % Edit parameters in macro.m
% macro