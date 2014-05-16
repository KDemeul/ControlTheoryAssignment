clear all;
close all;
clc;


load('nonmin');

tdeb = 2450;
tfin = 2750;

ind_deb = find(t>tdeb);
ind_deb = ind_deb(1);
ind_fin = find(t<tfin);
ind_fin = ind_fin(end);


tsel = t(ind_deb:ind_fin);
Rsel = R(ind_deb:ind_fin,:);
Ysel = Y(ind_deb:ind_fin,:);
Usel = U(ind_deb:ind_fin,:);

%%%%%%%%%%%%%%%%%%%%%%%%
ymin1 = 35;
ymax1 = 50;
figure,
plot(tsel,[Rsel(:,2) Ysel(:,1)]);
axis([tdeb, tfin, ymin1, ymax1]);

ymin2 = 80;
ymax2 = 84;
figure,
plot(tsel,[Rsel(:,1) Ysel(:,2)]);
axis([tdeb, tfin, ymin2, ymax2]);

umin = 40;
umax = 70;
figure,
plot(tsel, Usel);
axis([tdeb, tfin, umin, umax]);
%%%%%%%%%%%%%%%%%%%%%%%%

figure,
subplot(3,1,1)
plot(tsel,[Rsel(:,2) Ysel(:,1)]);
axis([tdeb, tfin, ymin1, ymax1]);

subplot(3,1,2)
plot(tsel,[Rsel(:,1) Ysel(:,2)]);
axis([tdeb, tfin, ymin2, ymax2]);

subplot(3,1,3)
plot(tsel, Usel);
axis([tdeb, tfin, umin, umax]);