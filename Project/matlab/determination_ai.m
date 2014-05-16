A = 15.52;
g = 981;
gamma1 = 0.375;
gamma2 = gamma1;
k1 = 4.0674;
k2 = 3.7167;
% a1 = .1726;
% a2 = .1479;
% a3 = .1875;
% a4 = .1787;

h1=7.2;
h2=20.6;
h3=3.9;
h4=5.5;
u1 = 7.5;
u2 = 7.5;

matA = [[-1/A*sqrt(2*g*h1) 0 1/A*sqrt(2*g*h3) 0];
[0 -1/A*sqrt(2*g*h2) 0 1/A*sqrt(2*g*h4)];
[0 0 -1/A*sqrt(2*g*h3) 0];
[0 0 0 -1/A*sqrt(2*g*h4)]]

matB = [gamma1*k1/A*u1;gamma2*k2/A*u2;(1-gamma2)*k2/A*u2;(1-gamma1)*k1/A*u1] 

linsolve(matA,-matB)

% h1=15;
% h2=15;
% 
% 
% mat1 = [[gamma1*k1 0 a3*sqrt(2*g) 0];
%         [0 gamma2*k2 0 a4*sqrt(2*g)];
%         [0 (1-gamma2)*k2 -a3*sqrt(2*g) 0];
%         [(1-gamma1)*k1 0 0 -a4*sqrt(2*g)]];
% 
% mat2 = [a1*sqrt(2*g*h1);a2*sqrt(2*g*h2);0;0];
% 
% linsolve(mat1,mat2)/15*100