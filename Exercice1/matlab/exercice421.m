clear all
close all

s = tf('s');
G = 20/((s + 1)*((s/20)^2+s/20+1));
Gd = 10/(s+1);

% wc = 3/0.2; %tr = 0.2s
wc = 10;    %attenuation Gd
% phi0 = 60;      %D = 10%

Fy = wc/(s*G);

w0 = 1000*wc;

Fym = w0^2*Fy/(s+w0)^2;

figure
hold on
step((1+Fy*G)^(-1)*Gd,10);
step(feedback(Fy*G,1),10);
step((1+Fym*G)^(-1)*Gd,10);
step(feedback(Fym*G,1),10);

% Disturbance criteria
plot([0.5 0.5],[-.1 .1],'LineStyle','--');
plot([0 100],[-.1 -.1],'LineStyle','--');
plot([0 100],[.1 .1],'LineStyle','--');

% Response criteria
% plot([0.2 0.2],[-1 2],'LineStyle','--','Color','r');
plot([0 100],[1.1 1.1],'LineStyle','--','Color','r');
plot([0 100],[0.9 0.9],'LineStyle','--','Color','r');
grid
axis([0 10 -0.2 1.2])



% bode(Fy*G);
% hold on
% bode(Fym*G);
% figure
% step(Gd*feedback(1,Fy*G));
% hold on
% step(Gd*feedback(1,Fym*G));