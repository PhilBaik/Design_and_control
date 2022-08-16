clear all
close all
clc

x=0:0.01:0.16
aimed_x=0.08
gain=1000
%objective function cost
cost=gain*(x-aimed_x).^2
figure(4)
plot(x,cost)
hold on
gain=3000
cost=gain*(x-aimed_x).^2
plot(x,cost)
gain=5000
cost=gain*(x-aimed_x).^2
plot(x,cost)
legend('gain=1000','gain=3000','gain=5000')
xlabel('output')
ylabel('cost')