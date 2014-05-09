close all
clear all
clc

% Définition des constantes

A = 15.52; %15.52 cm²
gamma_mp = 0.625;
gamma_nmp = 0.375;
kc = 0.2; %0.2 V/cm
g = 981;

% Systeme

k1 = 8.95;
k2 = 12.6;
a1 = sym('a1');
a2 = sym('a2');
a3 = sym('a3');
a4 = sym('a4');
HU = [[gamma_mp*k1/(a1*sqrt(2*g))     (1-gamma_mp)*k2/(a1*sqrt(2*g))];
     [(1-gamma_mp)*k1/(a2*sqrt(2*g))  gamma_mp*k2/(a2*sqrt(2*g))];
     [0                               ((1-gamma_mp)*k2/a3)/sqrt(2*g)];
     [((1-gamma_mp)*k1/a4)/sqrt(2*g)  0]];
h0 = (HU*[7.5; 7.5]).^2;
T1 = A/a1*sqrt(2*h0(1))*g;
T2 = A/a2*sqrt(2*h0(2))*g;
T3 = A/a3*sqrt(2*h0(3))*g;
T4 = A/a4*sqrt(2*h0(4))*g;
Amp = [[-1/T1 0 1/T3 0];[0 -1/T2 0 1/T4];[0 0 -1/T3 0];[0 0 0 -1/T4]];

% Mesures

u1 = 7.5;
u2 = 7.5;
m1 = (HU*[7.5; 7.5]).^2;
h1 = 2.9;
h2 = 12.1;
h3 = 0.5;
h4 = 4.4;
h = [h1;h2;h3;h4];
S = solve(m1==h);


a1_m =  double(S.a1(1));
a2_m =  double(S.a2(1));
a3_m =  double(S.a3(1));
a4_m =  double(S.a4(1));
a_m = [a1_m;a2_m;a3_m;a4_m]
% % Estimation des inconnues
% 
% M1 = u1*sqrt(h1)';
% M1t = M1';
% M2 = u2*sqrt(h1)';
% M2t = M2';
% 
% M = [gamma_mp*(M1(:)-M1t(:)),(1-gamma_mp)*(M2(:)-M2t(:))];
% 
% [U, S, V] = svd(M);
% 
% k = V(:,end);

