clear all
close all

mat = load('backup/manualcontrol_minphase_15cm_u1_59_u2_34.mat');

time = mat.dat.time;
y1 = mat.dat.signals(1,1).values(:,1);
y2 = mat.dat.signals(1,1).values(:,2);
u1 = mat.dat.signals(1,2).values(:,1);
u2 = mat.dat.signals(1,2).values(:,2);

figure
hold on
plot(time,y1,'LineWidth',2,'Color','blue');
plot(time,y2,'LineWidth',2,'Color','red');
plot(time,u1,'LineWidth',2,'Color','cyan');
plot(time,u2,'LineWidth',2,'Color','magenta');
grid
xlabel('t (s)');
ylabel('y');
title('Step response, non-minimum case');
legend('y_1','y_2','u_1','u_2');


plot([0 max(time)],[0.9*max(y1) 0.9*max(y1)],'b');
plot([0 max(time)],[1.1*max(y1) 1.1*max(y1)],'b');


plot([0 max(time)],[0.9*max(y2) 0.9*max(y2)],'r');
plot([0 max(time)],[1.1*max(y2) 1.1*max(y2)],'b');

% hold on
% grid
% p2 = plot(time,y2,'LineWidth',2,'Color','b');
% leg = legend([p1,p2],'y1','y2');
% set(leg,'Location','NorthWest')

% subplot(2,1,2)
% plot(Y)
% grid
% ylabel 'Y'
% subplot(2,1,1)
% plot(U)
% grid
% ylabel 'U'
