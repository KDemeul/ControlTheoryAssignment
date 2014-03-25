clear all
close all

s = tf('s');
G = 3*(-s + 1) / ( (5*s + 1)*(10*s + 1) ) * 1 / s;

omegaC = 0.4;

% figure
% hold on

% bode(G)
grid
% line('XData', [0.4 0.4], 'YData', [-1000 1000], 'LineStyle', '-.','LineWidth', 2, 'Color','black');

[m,p] = bode(G,omegaC)
p = p - 360;
[Gm,Pm,wp,wc] = margin(G)

%--------------------
% Phase-lead action
%--------------------

phim = 30 - (180+p)
a = (1 - sin(phim*pi/180))/(1 + sin(phim*pi/180))
T = 1 / (omegaC * sqrt(a))
K = sqrt(a)/m;

F = K*(1+T*s)/(1 + a*T*s);
% margin(F)
% margin(F*G);

figure
hold on
step(G);
step(feedback(F*G,1));

figure
hold on
margin(G)
margin(F)
margin(F*G)