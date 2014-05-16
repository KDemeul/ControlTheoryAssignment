function sys = minphase
%
% sys = minphase
%
% computes a state-space model for the linearized model of the
% quadruple-tank process for a minimum phase case
% 

% Magnus �kerblad 2000-01-20
% This file was changed by Jonas Wijk 2003-01-07, to work with the new watertanks.
g = 981;

% Operating levels of tanks
% h10 = 18;      % i cm (nedre v�nstra tanken)
% h20 = 18;      % i cm (nedre h�gra tanken)
% h30 = 14;      % i cm (�vre v�nstra tanken)
% h40 = 19;      % i cm (�vre h�gra tanken)

% Operating voltage of pumps
u10 = 7.5;     % i V
u20 = 7.5;     % i V

% Operating actuator proportional constants
k1 = 4.0674;     % i cm^3/(Vs)
k2 = 3.7167;     % i cm^3/(Vs)

% Outlet areas
a1 = 0.2234;   % i cm^2
a2 = 0.1567;   % i cm^2
a3 = 0.0840;  % i cm^2
a4 = 0.0817;  % i cm^2

% Valve settings
gam1 = 0.625;
gam2 = 0.625;

HU = [[gam1*k1/(a1*sqrt(2*g))     (1-gam1)*k2/(a1*sqrt(2*g))];
     [(1-gam1)*k1/(a2*sqrt(2*g))  gam1*k2/(a2*sqrt(2*g))];
     [0                               ((1-gam1)*k2/a3)/sqrt(2*g)];
     [((1-gam1)*k1/a4)/sqrt(2*g)  0]];
h = (HU*[u10; u20]).^2;

h10 = h(1)
h20 = h(2)
h30 = h(3)
h40 = h(4)

% Compute state-space model for linearized model
sys = linmodel(a1,a2,a3,a4,h10,h20,h30,h40,u10,u20,k1,k2,gam1,gam2);