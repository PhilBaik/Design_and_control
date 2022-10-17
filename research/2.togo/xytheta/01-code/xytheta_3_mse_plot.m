clc;
clear;
close all;
addpath("post_data_1008")
addpath("post_data_1009")

%% rect_10,3 & air
figure(301)
hold on;
load("rect_10,3.mat")
rect10_3.mse_vec10 = [];
rect10_3.mse_vec15 = [];
rect10_3.mse_vec20 = [];
rect10_3.mag_vec10 = [];
rect10_3.mag_vec15 = [];
rect10_3.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));

for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect10_3.mag_vec10 = [rect10_3.mag_vec10, table_total(i,2)];
        rect10_3.mse_vec10 = [rect10_3.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect10_3.mag_vec15 = [rect10_3.mag_vec15, table_total(i,2)];
        rect10_3.mse_vec15 = [rect10_3.mse_vec15, table_total(i,5)];
    else
        rect10_3.mag_vec20 = [rect10_3.mag_vec20, table_total(i,2)];
        rect10_3.mse_vec20 = [rect10_3.mse_vec20, table_total(i,5)];
    end
end

plot(rect10_3.mag_vec10,rect10_3.mse_vec10,'LineWidth',2)
plot(rect10_3.mag_vec15,rect10_3.mse_vec15,'LineWidth',2)
plot(rect10_3.mag_vec20,rect10_3.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 10*3','FontName','times','FontSize',20)

hold off;

figure(302)
hold on;
load("rect_10,3_air.mat")
rect10_3_air.mse_vec10 = [];
rect10_3_air.mse_vec15 = [];
rect10_3_air.mse_vec20 = [];
rect10_3_air.mag_vec10 = [];
rect10_3_air.mag_vec15 = [];
rect10_3_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));

for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect10_3_air.mag_vec10 = [rect10_3_air.mag_vec10, table_total(i,2)];
        rect10_3_air.mse_vec10 = [rect10_3_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect10_3_air.mag_vec15 = [rect10_3_air.mag_vec15, table_total(i,2)];
        rect10_3_air.mse_vec15 = [rect10_3_air.mse_vec15, table_total(i,5)];
    else
        rect10_3_air.mag_vec20 = [rect10_3_air.mag_vec20, table_total(i,2)];
        rect10_3_air.mse_vec20 = [rect10_3_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect10_3_air.mag_vec10,rect10_3_air.mse_vec10,'LineWidth',2)
plot(rect10_3_air.mag_vec15,rect10_3_air.mse_vec15,'LineWidth',2)
plot(rect10_3_air.mag_vec20,rect10_3_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 10*3 air ','FontName','times','FontSize',20)

hold off;

%% 10.5 metal

figure(303)
hold on;
load("rect_10,5.mat")
rect10_5.mse_vec10 = [];
rect10_5.mse_vec15 = [];
rect10_5.mse_vec20 = [];
rect10_5.mag_vec10 = [];
rect10_5.mag_vec15 = [];
rect10_5.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect10_5.table_total = table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect10_5.mag_vec10 = [rect10_5.mag_vec10, table_total(i,2)];
        rect10_5.mse_vec10 = [rect10_5.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect10_5.mag_vec15 = [rect10_5.mag_vec15, table_total(i,2)];
        rect10_5.mse_vec15 = [rect10_5.mse_vec15, table_total(i,5)];
    else
        rect10_5.mag_vec20 = [rect10_5.mag_vec20, table_total(i,2)];
        rect10_5.mse_vec20 = [rect10_5.mse_vec20, table_total(i,5)];
    end
end

plot(rect10_5.mag_vec10,rect10_5.mse_vec10,'LineWidth',2)
plot(rect10_5.mag_vec15,rect10_5.mse_vec15,'LineWidth',2)
plot(rect10_5.mag_vec20,rect10_5.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 10*5 metal','FontName','times','FontSize',20)
hold off;

figure(304)
hold on;
load("rect_10,5_air.mat")
rect10_5_air.mse_vec10 = [];
rect10_5_air.mse_vec15 = [];
rect10_5_air.mse_vec20 = [];
rect10_5_air.mag_vec10 = [];
rect10_5_air.mag_vec15 = [];
rect10_5_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect10_5_air.table_total = table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect10_5_air.mag_vec10 = [rect10_5_air.mag_vec10, table_total(i,2)];
        rect10_5_air.mse_vec10 = [rect10_5_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect10_5_air.mag_vec15 = [rect10_5_air.mag_vec15, table_total(i,2)];
        rect10_5_air.mse_vec15 = [rect10_5_air.mse_vec15, table_total(i,5)];
    else
        rect10_5_air.mag_vec20 = [rect10_5_air.mag_vec20, table_total(i,2)];
        rect10_5_air.mse_vec20 = [rect10_5_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect10_5_air.mag_vec10,rect10_5_air.mse_vec10,'LineWidth',2)
plot(rect10_5_air.mag_vec15,rect10_5_air.mse_vec15,'LineWidth',2)
plot(rect10_5_air.mag_vec20,rect10_5_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 10*5 air','FontName','times','FontSize',20)
hold off;
%% 10_3 vs 10_5
figure(305)
hold on;
plot(rect10_3_air.mag_vec10,rect10_3_air.mse_vec10,'r','LineWidth',2)
plot(rect10_3_air.mag_vec15,rect10_3_air.mse_vec15,'r','LineWidth',2)
plot(rect10_3_air.mag_vec20,rect10_3_air.mse_vec20,'r','LineWidth',2)
plot(rect10_5_air.mag_vec10,rect10_5_air.mse_vec10,'b','LineWidth',2)
plot(rect10_5_air.mag_vec15,rect10_5_air.mse_vec15,'b','LineWidth',2)
plot(rect10_5_air.mag_vec20,rect10_5_air.mse_vec20,'b','LineWidth',2)

title('air : red = 10*3, blue = 10*5 ','FontName','times','FontSize',20)

figure(306)
hold on;
plot(rect10_3.mag_vec10,rect10_3.mse_vec10,'r','LineWidth',2)
plot(rect10_3.mag_vec15,rect10_3.mse_vec15,'r','LineWidth',2)
plot(rect10_3.mag_vec20,rect10_3.mse_vec20,'r','LineWidth',2)
plot(rect10_5.mag_vec10,rect10_5.mse_vec10,'b','LineWidth',2)
plot(rect10_5.mag_vec15,rect10_5.mse_vec15,'b','LineWidth',2)
plot(rect10_5.mag_vec20,rect10_5.mse_vec20,'b','LineWidth',2)

title('M-19 : red = 10*3, blue = 10*5 ','FontName','times','FontSize',20)

%% 25*3 

figure(307)
hold on;
load("rect_25,3.mat")
rect25_3.mse_vec10 = [];
rect25_3.mse_vec15 = [];
rect25_3.mse_vec20 = [];
rect25_3.mag_vec10 = [];
rect25_3.mag_vec15 = [];
rect25_3.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect25_3.table_total =  table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect25_3.mag_vec10 = [rect25_3.mag_vec10, table_total(i,2)];
        rect25_3.mse_vec10 = [rect25_3.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect25_3.mag_vec15 = [rect25_3.mag_vec15, table_total(i,2)];
        rect25_3.mse_vec15 = [rect25_3.mse_vec15, table_total(i,5)];
    else
        rect25_3.mag_vec20 = [rect25_3.mag_vec20, table_total(i,2)];
        rect25_3.mse_vec20 = [rect25_3.mse_vec20, table_total(i,5)];
    end
end

plot(rect25_3.mag_vec10,rect25_3.mse_vec10,'LineWidth',2)
plot(rect25_3.mag_vec15,rect25_3.mse_vec15,'LineWidth',2)
plot(rect25_3.mag_vec20,rect25_3.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 25*3 M-19','FontName','times','FontSize',20)
hold off;

figure(308)
hold on;
load("rect_25,3_air.mat")
rect25_3_air.mse_vec10 = [];
rect25_3_air.mse_vec15 = [];
rect25_3_air.mse_vec20 = [];
rect25_3_air.mag_vec10 = [];
rect25_3_air.mag_vec15 = [];
rect25_3_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect25_3_air.table_total = table_total;
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect25_3_air.mag_vec10 = [rect25_3_air.mag_vec10, table_total(i,2)];
        rect25_3_air.mse_vec10 = [rect25_3_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect25_3_air.mag_vec15 = [rect25_3_air.mag_vec15, table_total(i,2)];
        rect25_3_air.mse_vec15 = [rect25_3_air.mse_vec15, table_total(i,5)];
    else
        rect25_3_air.mag_vec20 = [rect25_3_air.mag_vec20, table_total(i,2)];
        rect25_3_air.mse_vec20 = [rect25_3_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect25_3_air.mag_vec10,rect25_3_air.mse_vec10,'LineWidth',2)
plot(rect25_3_air.mag_vec15,rect25_3_air.mse_vec15,'LineWidth',2)
plot(rect25_3_air.mag_vec20,rect25_3_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 25*3 air','FontName','times','FontSize',20)
hold off;

%% 25_3 vs 25_3 air
figure(309)
hold on;
plot(rect25_3.mag_vec10,rect25_3.mse_vec10,'LineWidth',2)
plot(rect25_3.mag_vec15,rect25_3.mse_vec15,'LineWidth',2)
plot(rect25_3.mag_vec20,rect25_3.mse_vec20,'LineWidth',2)
plot(rect25_3_air.mag_vec10,rect25_3_air.mse_vec10,'LineWidth',2)
plot(rect25_3_air.mag_vec15,rect25_3_air.mse_vec15,'LineWidth',2)
plot(rect25_3_air.mag_vec20,rect25_3_air.mse_vec20,'LineWidth',2)
legend('sensor space M19 = 10','sensor space M19 = 15','sensor space M19 = 20','sensor space air = 10','sensor space air = 15','sensor space air = 20','Fontname','times')
title('IPM 25*3 Air vs M19','FontName','times','FontSize',20)
hold off;

%% 40,5
figure(310)
hold on;
grid on;
box on;
load("rect_40,5.mat")
rect40_5.mse_vec10 = [];
rect40_5.mse_vec15 = [];
rect40_5.mse_vec20 = [];
rect40_5.mag_vec10 = [];
rect40_5.mag_vec15 = [];
rect40_5.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect40_5.mag_vec10 = [rect40_5.mag_vec10, table_total(i,2)];
        rect40_5.mse_vec10 = [rect40_5.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect40_5.mag_vec15 = [rect40_5.mag_vec15, table_total(i,2)];
        rect40_5.mse_vec15 = [rect40_5.mse_vec15, table_total(i,5)];
    else
        rect40_5.mag_vec20 = [rect40_5.mag_vec20, table_total(i,2)];
        rect40_5.mse_vec20 = [rect40_5.mse_vec20, table_total(i,5)];
    end
end

plot(rect40_5.mag_vec10,rect40_5.mse_vec10,'LineWidth',2)
plot(rect40_5.mag_vec15,rect40_5.mse_vec15,'LineWidth',2)
plot(rect40_5.mag_vec20,rect40_5.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 40*5 M-19','FontName','times','FontSize',20)
hold off;


figure(311)
hold on;
grid on;
box on;
load("rect_40,5_air.mat")
rect40_5_air.mse_vec10 = [];
rect40_5_air.mse_vec15 = [];
rect40_5_air.mse_vec20 = [];
rect40_5_air.mag_vec10 = [];
rect40_5_air.mag_vec15 = [];
rect40_5_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect40_5_air.table_total = table_total;
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect40_5_air.mag_vec10 = [rect40_5_air.mag_vec10, table_total(i,2)];
        rect40_5_air.mse_vec10 = [rect40_5_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect40_5_air.mag_vec15 = [rect40_5_air.mag_vec15, table_total(i,2)];
        rect40_5_air.mse_vec15 = [rect40_5_air.mse_vec15, table_total(i,5)];
    else
        rect40_5_air.mag_vec20 = [rect40_5_air.mag_vec20, table_total(i,2)];
        rect40_5_air.mse_vec20 = [rect40_5_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect40_5_air.mag_vec10,rect40_5_air.mse_vec10,'LineWidth',2)
plot(rect40_5_air.mag_vec15,rect40_5_air.mse_vec15,'LineWidth',2)
plot(rect40_5_air.mag_vec20,rect40_5_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 40*5 air','FontName','times','FontSize',20)
hold off;

figure(312)
hold on;
grid on;
box on;
plot(rect40_5.mag_vec10,rect40_5.mse_vec10,'LineWidth',2)
plot(rect40_5.mag_vec15,rect40_5.mse_vec15,'LineWidth',2)
plot(rect40_5.mag_vec20,rect40_5.mse_vec20,'LineWidth',2)
plot(rect40_5_air.mag_vec10,rect40_5_air.mse_vec10,'LineWidth',2)
plot(rect40_5_air.mag_vec15,rect40_5_air.mse_vec15,'LineWidth',2)
plot(rect40_5_air.mag_vec20,rect40_5_air.mse_vec20,'LineWidth',2)
legend('sensor space M-19 = 10','sensor space M-19 = 15','sensor space M-19 = 20','sensor space Air = 10','sensor space Air = 15','sensor space Air = 20','Fontname','times')
title('Rectangle 40*5 Air vs M-19','FontName','times','FontSize',20)
hold off;

%% 15,3 2022.10.9
figure(312)
hold on;
grid on;
box on;
load("rect_15,3.mat")
rect_15_3.mse_vec10 = [];
rect_15_3.mse_vec15 = [];
rect_15_3.mse_vec20 = [];
rect_15_3.mag_vec10 = [];
rect_15_3.mag_vec15 = [];
rect_15_3.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_15_3.table_total = table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_15_3.mag_vec10 = [rect_15_3.mag_vec10, table_total(i,2)];
        rect_15_3.mse_vec10 = [rect_15_3.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_15_3.mag_vec15 = [rect_15_3.mag_vec15, table_total(i,2)];
        rect_15_3.mse_vec15 = [rect_15_3.mse_vec15, table_total(i,5)];
    else
        rect_15_3.mag_vec20 = [rect_15_3.mag_vec20, table_total(i,2)];
        rect_15_3.mse_vec20 = [rect_15_3.mse_vec20, table_total(i,5)];
    end
end

plot(rect_15_3.mag_vec10,rect_15_3.mse_vec10,'LineWidth',2)
plot(rect_15_3.mag_vec15,rect_15_3.mse_vec15,'LineWidth',2)
plot(rect_15_3.mag_vec20,rect_15_3.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 15*3 M-19','FontName','times','FontSize',20)
hold off;


figure(313)
hold on;
grid on;
box on;
load("rect_15,3_air.mat")
rect_15_3_air.mse_vec10 = [];
rect_15_3_air.mse_vec15 = [];
rect_15_3_air.mse_vec20 = [];
rect_15_3_air.mag_vec10 = [];
rect_15_3_air.mag_vec15 = [];
rect_15_3_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_15_3_air.table_total = table_total;
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_15_3_air.mag_vec10 = [rect_15_3_air.mag_vec10, table_total(i,2)];
        rect_15_3_air.mse_vec10 = [rect_15_3_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_15_3_air.mag_vec15 = [rect_15_3_air.mag_vec15, table_total(i,2)];
        rect_15_3_air.mse_vec15 = [rect_15_3_air.mse_vec15, table_total(i,5)];
    else
        rect_15_3_air.mag_vec20 = [rect_15_3_air.mag_vec20, table_total(i,2)];
        rect_15_3_air.mse_vec20 = [rect_15_3_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect_15_3_air.mag_vec10,rect_15_3_air.mse_vec10,'LineWidth',2)
plot(rect_15_3_air.mag_vec15,rect_15_3_air.mse_vec15,'LineWidth',2)
plot(rect_15_3_air.mag_vec20,rect_15_3_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 15*3 air','FontName','times','FontSize',20)
hold off;
%% 20,3
figure(314)
hold on;
grid on;
box on;
load("rect_20,3.mat")
rect_20_3.mse_vec10 = [];
rect_20_3.mse_vec15 = [];
rect_20_3.mse_vec20 = [];
rect_20_3.mag_vec10 = [];
rect_20_3.mag_vec15 = [];
rect_20_3.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_20_3.table_total = table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_20_3.mag_vec10 = [rect_20_3.mag_vec10, table_total(i,2)];
        rect_20_3.mse_vec10 = [rect_20_3.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_20_3.mag_vec15 = [rect_20_3.mag_vec15, table_total(i,2)];
        rect_20_3.mse_vec15 = [rect_20_3.mse_vec15, table_total(i,5)];
    else
        rect_20_3.mag_vec20 = [rect_20_3.mag_vec20, table_total(i,2)];
        rect_20_3.mse_vec20 = [rect_20_3.mse_vec20, table_total(i,5)];
    end
end

plot(rect_20_3.mag_vec10,rect_20_3.mse_vec10,'LineWidth',2)
plot(rect_20_3.mag_vec15,rect_20_3.mse_vec15,'LineWidth',2)
plot(rect_20_3.mag_vec20,rect_20_3.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 20*3 M-19','FontName','times','FontSize',20)
hold off;


figure(315)
hold on;
grid on;
box on;
load("rect_20,3_air.mat")
rect_20_3_air.mse_vec10 = [];
rect_20_3_air.mse_vec15 = [];
rect_20_3_air.mse_vec20 = [];
rect_20_3_air.mag_vec10 = [];
rect_20_3_air.mag_vec15 = [];
rect_20_3_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_20_3_air.table_total = table_total;
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_20_3_air.mag_vec10 = [rect_20_3_air.mag_vec10, table_total(i,2)];
        rect_20_3_air.mse_vec10 = [rect_20_3_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_20_3_air.mag_vec15 = [rect_20_3_air.mag_vec15, table_total(i,2)];
        rect_20_3_air.mse_vec15 = [rect_20_3_air.mse_vec15, table_total(i,5)];
    else
        rect_20_3_air.mag_vec20 = [rect_20_3_air.mag_vec20, table_total(i,2)];
        rect_20_3_air.mse_vec20 = [rect_20_3_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect_20_3_air.mag_vec10,rect_20_3_air.mse_vec10,'LineWidth',2)
plot(rect_20_3_air.mag_vec15,rect_20_3_air.mse_vec15,'LineWidth',2)
plot(rect_20_3_air.mag_vec20,rect_20_3_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 20*3 air','FontName','times','FontSize',20)
hold off;

%% 20,5
figure(316)
hold on;
grid on;
box on;
load("rect_20,5.mat")
rect_20_5.mse_vec10 = [];
rect_20_5.mse_vec15 = [];
rect_20_5.mse_vec20 = [];
rect_20_5.mag_vec10 = [];
rect_20_5.mag_vec15 = [];
rect_20_5.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_20_5.table_total = table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_20_5.mag_vec10 = [rect_20_5.mag_vec10, table_total(i,2)];
        rect_20_5.mse_vec10 = [rect_20_5.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_20_5.mag_vec15 = [rect_20_5.mag_vec15, table_total(i,2)];
        rect_20_5.mse_vec15 = [rect_20_5.mse_vec15, table_total(i,5)];
    else
        rect_20_5.mag_vec20 = [rect_20_5.mag_vec20, table_total(i,2)];
        rect_20_5.mse_vec20 = [rect_20_5.mse_vec20, table_total(i,5)];
    end
end

plot(rect_20_5.mag_vec10,rect_20_5.mse_vec10,'LineWidth',2)
plot(rect_20_5.mag_vec15,rect_20_5.mse_vec15,'LineWidth',2)
plot(rect_20_5.mag_vec20,rect_20_5.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 20*5 M-19','FontName','times','FontSize',20)
hold off;


figure(317)
hold on;
grid on;
box on;
load("rect_20,5_air.mat")
rect_20_5_air.mse_vec10 = [];
rect_20_5_air.mse_vec15 = [];
rect_20_5_air.mse_vec20 = [];
rect_20_5_air.mag_vec10 = [];
rect_20_5_air.mag_vec15 = [];
rect_20_5_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_20_5_air.table_total = table_total;
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_20_5_air.mag_vec10 = [rect_20_5_air.mag_vec10, table_total(i,2)];
        rect_20_5_air.mse_vec10 = [rect_20_5_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_20_5_air.mag_vec15 = [rect_20_5_air.mag_vec15, table_total(i,2)];
        rect_20_5_air.mse_vec15 = [rect_20_5_air.mse_vec15, table_total(i,5)];
    else
        rect_20_5_air.mag_vec20 = [rect_20_5_air.mag_vec20, table_total(i,2)];
        rect_20_5_air.mse_vec20 = [rect_20_5_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect_20_5_air.mag_vec10,rect_20_5_air.mse_vec10,'LineWidth',2)
plot(rect_20_5_air.mag_vec15,rect_20_5_air.mse_vec15,'LineWidth',2)
plot(rect_20_5_air.mag_vec20,rect_20_5_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 20*5 air','FontName','times','FontSize',20)
hold off;

%% 20,5
figure(318)
hold on;
grid on;
box on;
load("rect_20,13.mat")
rect_20_13.mse_vec10 = [];
rect_20_13.mse_vec15 = [];
rect_20_13.mse_vec20 = [];
rect_20_13.mag_vec10 = [];
rect_20_13.mag_vec15 = [];
rect_20_13.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_20_13.table_total = table_total
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_20_13.mag_vec10 = [rect_20_13.mag_vec10, table_total(i,2)];
        rect_20_13.mse_vec10 = [rect_20_13.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_20_13.mag_vec15 = [rect_20_13.mag_vec15, table_total(i,2)];
        rect_20_13.mse_vec15 = [rect_20_13.mse_vec15, table_total(i,5)];
    else
        rect_20_13.mag_vec20 = [rect_20_13.mag_vec20, table_total(i,2)];
        rect_20_13.mse_vec20 = [rect_20_13.mse_vec20, table_total(i,5)];
    end
end

plot(rect_20_13.mag_vec10,rect_20_13.mse_vec10,'LineWidth',2)
plot(rect_20_13.mag_vec15,rect_20_13.mse_vec15,'LineWidth',2)
plot(rect_20_13.mag_vec20,rect_20_13.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 20*13 M-19','FontName','times','FontSize',20)
hold off;


figure(319)
hold on;
grid on;
box on;
load("rect_20,13_air.mat")
rect_20_13_air.mse_vec10 = [];
rect_20_13_air.mse_vec15 = [];
rect_20_13_air.mse_vec20 = [];
rect_20_13_air.mag_vec10 = [];
rect_20_13_air.mag_vec15 = [];
rect_20_13_air.mag_vec20 = [];
table_total = sortrows(table_total,2)
table_total = double(table2array(table_total));
rect_20_13_air.table_total = table_total;
for i = 1:1:length(table_total(:,1))
    if(table_total(i,3)==10)
        rect_20_13_air.mag_vec10 = [rect_20_13_air.mag_vec10, table_total(i,2)];
        rect_20_13_air.mse_vec10 = [rect_20_13_air.mse_vec10, table_total(i,5)];
    elseif(table_total(i,3)==15)
        rect_20_13_air.mag_vec15 = [rect_20_13_air.mag_vec15, table_total(i,2)];
        rect_20_13_air.mse_vec15 = [rect_20_13_air.mse_vec15, table_total(i,5)];
    else
        rect_20_13_air.mag_vec20 = [rect_20_13_air.mag_vec20, table_total(i,2)];
        rect_20_13_air.mse_vec20 = [rect_20_13_air.mse_vec20, table_total(i,5)];
    end
end

plot(rect_20_13_air.mag_vec10,rect_20_13_air.mse_vec10,'LineWidth',2)
plot(rect_20_13_air.mag_vec15,rect_20_13_air.mse_vec15,'LineWidth',2)
plot(rect_20_13_air.mag_vec20,rect_20_13_air.mse_vec20,'LineWidth',2)
legend('sensor space = 10','sensor space = 15','sensor space = 20','Fontname','times')
title('Rectangle 20*13 air','FontName','times','FontSize',20)
hold off;
%% 25,20,15,10 & 3 M-19

figure(320)

hold on;
grid on;
box on;
plot(rect10_3.mag_vec10,rect10_3.mse_vec10,'LineWidth',2)
plot(rect_15_3.mag_vec10,rect_15_3.mse_vec10,'LineWidth',2)
plot(rect_20_3.mag_vec10,rect_20_3.mse_vec10,'LineWidth',2)
plot(rect25_3.mag_vec10,rect25_3.mse_vec10,'LineWidth',2)
legend('10*3','15*3','20*3','25*3','Fontname','times')
title('sensor space = 10, M-19','FontName','times','FontSize',20)
hold off;

figure(321)

hold on;
grid on;
box on;
plot(rect10_3.mag_vec15,rect10_3.mse_vec15,'LineWidth',2)
plot(rect_15_3.mag_vec15,rect_15_3.mse_vec15,'LineWidth',2)
plot(rect_20_3.mag_vec15,rect_20_3.mse_vec15,'LineWidth',2)
plot(rect25_3.mag_vec15,rect25_3.mse_vec15,'LineWidth',2)
legend('10*3','15*3','20*3','25*3','Fontname','times')
title('sensor space = 15, M-19','FontName','times','FontSize',20)
hold off;

figure(322)

hold on;
grid on;
box on;
plot(rect10_3.mag_vec20,rect10_3.mse_vec20,'LineWidth',2)
plot(rect_15_3.mag_vec20,rect_15_3.mse_vec20,'LineWidth',2)
plot(rect_20_3.mag_vec20,rect_20_3.mse_vec20,'LineWidth',2)
plot(rect25_3.mag_vec20,rect25_3.mse_vec20,'LineWidth',2)
legend('10*3','15*3','20*3','25*3','Fontname','times')
title('sensor space = 20, M-19','FontName','times','FontSize',20)
hold off;

%% 25,20,15,10 & 3 Air

figure(323)

hold on;
grid on;
box on;
plot(rect10_3_air.mag_vec10,rect10_3_air.mse_vec10,'LineWidth',2)
plot(rect_15_3_air.mag_vec10,rect_15_3_air.mse_vec10,'LineWidth',2)
plot(rect_20_3_air.mag_vec10,rect_20_3_air.mse_vec10,'LineWidth',2)
plot(rect25_3_air.mag_vec10,rect25_3.mse_vec10,'LineWidth',2)
legend('10*3','15*3','20*3','25*3','Fontname','times')
title('sensor space = 10, Air','FontName','times','FontSize',20)
hold off;

figure(324)

hold on;
grid on;
box on;
plot(rect10_3_air.mag_vec15,rect10_3_air.mse_vec15,'LineWidth',2)
plot(rect_15_3_air.mag_vec15,rect_15_3_air.mse_vec15,'LineWidth',2)
plot(rect_20_3_air.mag_vec15,rect_20_3_air.mse_vec15,'LineWidth',2)
plot(rect25_3_air.mag_vec15,rect25_3.mse_vec15,'LineWidth',2)
legend('10*3','15*3','20*3','25*3','Fontname','times')
title('sensor space = 15, Air','FontName','times','FontSize',20)
hold off;


figure(325)

hold on;
grid on;
box on;
plot(rect10_3_air.mag_vec20,rect10_3_air.mse_vec20,'LineWidth',2)
plot(rect_15_3_air.mag_vec20,rect_15_3_air.mse_vec20,'LineWidth',2)
plot(rect_20_3_air.mag_vec20,rect_20_3_air.mse_vec20,'LineWidth',2)
plot(rect25_3_air.mag_vec20,rect25_3.mse_vec20,'LineWidth',2)
legend('10*3','15*3','20*3','25*3','Fontname','times')
title('sensor space = 20, Air','FontName','times','FontSize',20)
hold off;

%%

figure(398)
hold on;
load("circular.mat")
mag_vec10_3 = [];
mse_vec10_3 = [];
mag_vec15_3 = [];
mse_vec15_3 = [];
mag_vec20_3 = [];
mse_vec20_3 = [];
mag_vec10_5 = [];
mse_vec10_5 = [];
mag_vec15_5 = [];
mse_vec15_5 = [];
mag_vec20_5= [];
mse_vec20_5 = [];
mag_vec10_7 = [];
mse_vec10_7 = [];
mag_vec15_7 = [];
mse_vec15_7 = [];
mag_vec20_7 = [];
mse_vec20_7 = [];
table_total = sortrows(table_total,4)
table_total = double(table2array(table_total));
table_total3 = [];
table_total5 = [];
table_total7 = [];

for i = 1:1:length(table_total(:,1))
    if(table_total(i,4)==3)
        table_total3 = [table_total3 ; table_total(i,:)]
    elseif(table_total(i,4)==5)
        table_total5 = [table_total5 ; table_total(i,:)]
    else
        table_total7 = [table_total7 ; table_total(i,:)]
    end
end

for i = 1:1:length(table_total3(:,1))
    if(table_total3(i,3)==10)
        mag_vec10_3 = [mag_vec10_3, table_total3(i,2)];
        mse_vec10_3 = [mse_vec10_3, table_total3(i,5)];
    elseif(table_total3(i,3)==15)
        mag_vec15_3 = [mag_vec15_3, table_total3(i,2)];
        mse_vec15_3 = [mse_vec15_3, table_total3(i,5)];
    else
        mag_vec20_3 = [mag_vec20_3, table_total3(i,2)];
        mse_vec20_3 = [mse_vec20_3, table_total3(i,5)];
    end
end

for i = 1:1:length(table_total5(:,1))
    if(table_total5(i,3)==10)
        mag_vec10_5 = [mag_vec10_5, table_total5(i,2)];
        mse_vec10_5 = [mse_vec10_5, table_total5(i,5)];
    elseif(table_total5(i,3)==15)
        mag_vec15_5 = [mag_vec15_5, table_total5(i,2)];
        mse_vec15_5 = [mse_vec15_5, table_total5(i,5)];
    else
        mag_vec20_5 = [mag_vec20_5, table_total5(i,2)];
        mse_vec20_5 = [mse_vec20_5, table_total5(i,5)];
    end
end

for i = 1:1:length(table_total7(:,1))
    if(table_total7(i,3)==10)
        mag_vec10_7 = [mag_vec10_7, table_total7(i,2)];
        mse_vec10_7 = [mse_vec10_7, table_total7(i,5)];
    elseif(table_total7(i,3)==15)
        mag_vec15_7 = [mag_vec15_7, table_total7(i,2)];
        mse_vec15_7 = [mse_vec15_7, table_total7(i,5)];
    else
        mag_vec20_7 = [mag_vec20_7, table_total7(i,2)];
        mse_vec20_7 = [mse_vec20_7, table_total7(i,5)];
    end
end

plot(mag_vec10_3,mse_vec10_3,'LineWidth',2)
plot(mag_vec15_3,mse_vec15_3,'LineWidth',2)
plot(mag_vec20_3,mse_vec20_3,'LineWidth',2)
plot(mag_vec10_5,mse_vec10_5,'LineWidth',2)
plot(mag_vec15_5,mse_vec15_5,'LineWidth',2)
plot(mag_vec20_5,mse_vec20_5,'LineWidth',2)
plot(mag_vec10_7,mse_vec10_7,'LineWidth',2)
plot(mag_vec15_7,mse_vec15_7,'LineWidth',2)
plot(mag_vec20_7,mse_vec20_7,'LineWidth',2)
legend('sensor space = 10, m thick = 3','sensor space = 15, m thick = 3','sensor space = 20, m thick = 3', ...
    'sensor space = 10, m thick = 5','sensor space = 15, m thick = 5','sensor space = 20, m thick = 5', ...
    'sensor space = 10, m thick = 7','sensor space = 15, m thick = 7','sensor space = 20, m thick = 7','Fontname','times','FontSize',10)
title('SPM M-19','FontName','times','FontSize',20)
hold off;

%%

figure(399)
hold on;
load("circular_air.mat")
mag_vec10_3 = [];
mse_vec10_3 = [];
mag_vec15_3 = [];
mse_vec15_3 = [];
mag_vec20_3 = [];
mse_vec20_3 = [];
mag_vec10_5 = [];
mse_vec10_5 = [];
mag_vec15_5 = [];
mse_vec15_5 = [];
mag_vec20_5= [];
mse_vec20_5 = [];
mag_vec10_7 = [];
mse_vec10_7 = [];
mag_vec15_7 = [];
mse_vec15_7 = [];
mag_vec20_7 = [];
mse_vec20_7 = [];
table_total = sortrows(table_total,4)
table_total = double(table2array(table_total));
table_total3 = [];
table_total5 = [];
table_total7 = [];

for i = 1:1:length(table_total(:,1))
    if(table_total(i,4)==3)
        table_total3 = [table_total3 ; table_total(i,:)]
    elseif(table_total(i,4)==5)
        table_total5 = [table_total5 ; table_total(i,:)]
    else
        table_total7 = [table_total7 ; table_total(i,:)]
    end
end

for i = 1:1:length(table_total3(:,1))
    if(table_total3(i,3)==10)
        mag_vec10_3 = [mag_vec10_3, table_total3(i,2)];
        mse_vec10_3 = [mse_vec10_3, table_total3(i,5)];
    elseif(table_total3(i,3)==15)
        mag_vec15_3 = [mag_vec15_3, table_total3(i,2)];
        mse_vec15_3 = [mse_vec15_3, table_total3(i,5)];
    else
        mag_vec20_3 = [mag_vec20_3, table_total3(i,2)];
        mse_vec20_3 = [mse_vec20_3, table_total3(i,5)];
    end
end

for i = 1:1:length(table_total5(:,1))
    if(table_total5(i,3)==10)
        mag_vec10_5 = [mag_vec10_5, table_total5(i,2)];
        mse_vec10_5 = [mse_vec10_5, table_total5(i,5)];
    elseif(table_total5(i,3)==15)
        mag_vec15_5 = [mag_vec15_5, table_total5(i,2)];
        mse_vec15_5 = [mse_vec15_5, table_total5(i,5)];
    else
        mag_vec20_5 = [mag_vec20_5, table_total5(i,2)];
        mse_vec20_5 = [mse_vec20_5, table_total5(i,5)];
    end
end

for i = 1:1:length(table_total7(:,1))
    if(table_total7(i,3)==10)
        mag_vec10_7 = [mag_vec10_7, table_total7(i,2)];
        mse_vec10_7 = [mse_vec10_7, table_total7(i,5)];
    elseif(table_total7(i,3)==15)
        mag_vec15_7 = [mag_vec15_7, table_total7(i,2)];
        mse_vec15_7 = [mse_vec15_7, table_total7(i,5)];
    else
        mag_vec20_7 = [mag_vec20_7, table_total7(i,2)];
        mse_vec20_7 = [mse_vec20_7, table_total7(i,5)];
    end
end

plot(mag_vec10_3,mse_vec10_3,'LineWidth',2)
plot(mag_vec15_3,mse_vec15_3,'LineWidth',2)
plot(mag_vec20_3,mse_vec20_3,'LineWidth',2)
plot(mag_vec10_5,mse_vec10_5,'LineWidth',2)
plot(mag_vec15_5,mse_vec15_5,'LineWidth',2)
plot(mag_vec20_5,mse_vec20_5,'LineWidth',2)
plot(mag_vec10_7,mse_vec10_7,'LineWidth',2)
plot(mag_vec15_7,mse_vec15_7,'LineWidth',2)
plot(mag_vec20_7,mse_vec20_7,'LineWidth',2)
legend('sensor space = 10, m thick = 3','sensor space = 15, m thick = 3','sensor space = 20, m thick = 3', ...
    'sensor space = 10, m thick = 5','sensor space = 15, m thick = 5','sensor space = 20, m thick = 5', ...
    'sensor space = 10, m thick = 7','sensor space = 15, m thick = 7','sensor space = 20, m thick = 7','Fontname','times','FontSize',10)
title('SPM air','FontName','times','FontSize',20)
hold off;





