close all
clear all
clc

% Définition des constantes

A = 15.52e-4; %15.52 cm²
gamma_mp = 0.625;
gamma_nmp = 0.375;
kc = 0.2e-2; %0.2 V/cm

% Mesures

u1 = [];
u2 = [];
h1 = [];
h2 = [];
h3 = [];
h4 = [];

% Estimation des inconnues

M1 = u1*h1';
M1t = M1';
M2 = u2*h1';
M2t = M2';

M = [gamma*(M1(:)-M1t(:));(1-gamma)*(M2t(:)-M2(:))];

[U, S, V] = svd(M);

k = V(:,end);

