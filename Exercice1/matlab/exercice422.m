clear all
close all

s = tf('s');
G = 20/((s + 1)*((s/20)^2+s/20+1));
Gd = 10/(s+1);

bode(G);
hold on
bode(Gd);

wc = 10;    %attenuation Gd

wi = wc;

w0 = 75;
w1 = 0;

Fy = (s+wi)/s*G^(-1)*Gd;
Fym = w0*Fy/(s+w0)/(s+w1);

hold on
bode(Fy);

S = (1+Fy*G)^(-1);
T = 1-S;

figure
bode(S);
hold on
bode(T);

figure
step(Gd*feedback(1,Fy*G));
hold on
step(Gd*feedback(1,Fym*G));

%--------------------
% Phase-lead action
%--------------------

omegaC = 15;
phi0 = 70;

[m,p] = bode(G*Fym,omegaC);
p = p;
[Gm,Pm,wp,wc] = margin(G*Fym);

phim = phi0 - (180+p);
a = (1 - sin(phim*pi/180))/(1 + sin(phim*pi/180));
T = 1 / (omegaC * sqrt(a));
K = sqrt(a)/m;

Flead = K*(1+T*s)/(1 + a*T*s);

figure
step(feedback(Fym*G,1));
hold on
step(feedback(Flead*Fym*G,1));

figure
margin(Flead*Fym*G);

tau = 0.21;

Fr = 1/(1+tau*s);

figure
step(feedback(Flead*Fym*G,1));
hold on
step(Fr*feedback(Flead*Fym*G,1));
hold on
step(Gd*feedback(1,Flead*Fym*G));

Sinfo = stepinfo(Fr*feedback(Flead*Fym*G,1))

figure
s1 = step(Flead*Fym*Fr*(1+Flead*Fym*G)^-1,1);
s2 = step(Fym*Flead*Gd*(1+Flead*Fym*G)^-1,1);
plot(s1);
hold on
plot(s2);

U = max(s1)+max(s2)