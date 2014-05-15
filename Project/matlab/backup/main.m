% h1 = dat.signals(1,1).values(:,1);
% h2 = dat.signals(1,1).values(:,2);
% t = dat.time;
% u = 7.5;
% 
% 
% [a1,b1] = polyfit(t(200:end),h1(200:end),1);
% [a2,b2] = polyfit(t(200:end),h2(200:end),1);
% 
% gamma = 0.625;
% A = 15.52;
% 
% k1 = a1(1)/gamma*A/u;
% k2 = a2(1)/gamma*A/u;

% u = 15;
% 
% h1 = 14.2;
% h2 = 21.3;
% h3 = 4.4;
% h4 = 5.8;
% gamma = 0.375;
% k1 = 16.2694*25/100;
% k2 = 14.8668*25/100;
% u1 = 0.5*u;
% u2 = 0.5*u;
% g = 981;
% 
% syms a1 a2 a3 a4
% 
% S = solve(-a1*sqrt(2*g*h1)+a3*sqrt(2*g*h3)+gamma*k1*u1 == 0 , -a2*sqrt(2*g*h2)+a4*sqrt(2*g*h4)+gamma*k2*u2 == 0 , -a3*sqrt(2*g*h3)+(1-gamma)*k2*u2 == 0 , -a4*sqrt(2*g*h4)+(1-gamma)*k1*u1 == 0);
% 
% a1 = double(S.a1)
% a2 = double(S.a2)
% a3 = double(S.a3)
% a4 = double(S.a4)

h1 = 0.6*25;
h2 = 0.6*25;
gamma = 0.375;
k1 = 16.2694*25/100;
k2 = 14.8668*25/100;
g = 981;

a1 = 0.1729;
a2 = 0.1444;
a3 = 0.1875;
a4 = 0.1787;

syms u1 u2 h3 h4
S = solve(-a1*sqrt(2*g*h1)+a3*sqrt(2*g*h3)+gamma*k1*u1 == 0 , -a2*sqrt(2*g*h2)+a4*sqrt(2*g*h4)+gamma*k2*u2 == 0 , -a3*sqrt(2*g*h3)+(1-gamma)*k2*u2 == 0 , -a4*sqrt(2*g*h4)+(1-gamma)*k1*u1 == 0);

u1 = double(S.u1)/15
u2 = double(S.u2)/15
h3 = double(S.h3)
h4 = double(S.h4)









