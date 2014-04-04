clear all
close all

s = tf('s');
G = 20/((s + 1)*((s/20)^2+s/20+1));
Gd = 10/(s+1);

%% DESIGN PROPER FY
Color = {'r','blue','black','green','yellow','magenta'};
figure
hold on

omegaI = 5;
p = 50;
Fy = p^2 / ((s+p)^2) * (s+omegaI)/s * G^(-1) * Gd ;
step((1+Fy*G)^(-1)*Gd);
step(feedback(Fy*G,1));

% Disturbance criteria
plot([0.5 0.5],[-.1 .1],'LineStyle','--');
plot([0 100],[-.1 -.1],'LineStyle','--');
plot([0 100],[.1 .1],'LineStyle','--');

% Response criteria
% plot([0.2 0.2],[-1 2],'LineStyle','--','Color','r');
plot([0 100],[1.1 1.1],'LineStyle','--','Color','r');
plot([0 100],[0.9 0.9],'LineStyle','--','Color','r');

grid

%% DESIGN LEAD LAG

omegaC = 3/0.2;
phi0 = 50;

[m,p] = bode(Fy*G,omegaC);

phim = phi0 - (180+p);
a = (1 - sin(phim*pi/180))/(1 + sin(phim*pi/180));
T = 1 / (omegaC * sqrt(a));
K = sqrt(a)/m;

Flead = K*(1+T*s)/(1 + a*T*s);

Fy = Flead*Fy;

figure
hold on
step((1+Fy*G)^(-1)*Gd);
step(feedback(Fy*G,1));

% Disturbance criteria
plot([0.5 0.5],[-.1 .1],'LineStyle','--');
plot([0 100],[-.1 -.1],'LineStyle','--');
plot([0 100],[.1 .1],'LineStyle','--');

% Response criteria
% plot([0.2 0.2],[-1 2],'LineStyle','--','Color','r');
plot([0 100],[1.1 1.1],'LineStyle','--','Color','r');
plot([0 100],[0.9 0.9],'LineStyle','--','Color','r');
grid

%% Design Fr

tau = 0.14;
Fr = 1 / (1 + tau*s);

stepInfo = stepinfo(Fr*feedback(Fy*G,1));
risetime = stepInfo.RiseTime
overshoot = stepInfo.Overshoot

figure
hold on
step((1+Fy*G)^(-1)*Gd);
step(Fr*feedback(Fy*G,1));

% Disturbance criteria
plot([0.5 0.5],[-.1 .1],'LineStyle','--');
plot([0 100],[-.1 -.1],'LineStyle','--');
plot([0 100],[.1 .1],'LineStyle','--');

% Response criteria
% plot([0.2 0.2],[-1 2],'LineStyle','--','Color','r');
plot([0 100],[1.1 1.1],'LineStyle','--','Color','r');
plot([0 100],[0.9 0.9],'LineStyle','--','Color','r');
grid

%% Control

S = (1 + Fy*G)^(-1);
s1 = step(Fr*Fy*S);
s2 = step(Gd*Fy*S);
U = max(s1)+max(s2)

T = 1 - S;
figure
hold on
bode(S);
bode(T);
grid
