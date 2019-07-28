clc
clear all
x = [0.5 1 1.5 2];
y = [-3 1 7 12];
n = length(x);

a2 = [n sum(y); sum(x) sum(x.*y)];
a1 = [sum(y) sum(x); sum(x.*y) sum(x.^2)];
a = [n sum(x); sum(x) sum(x.^2)];

a1 = det(a1)/det(a);
a2 = det(a2)/det(a);

ybar = sum(y)*(1/n);    % the average of the distribution
So = sum((y-ybar).^2);  % total error between the actual average and the distribution
S = sum((y-a1-a2.*x).^2);   %total error between the linear regression and the distribution

r2 = (So-S)/So;

xplot = 0.5:0.25:2;
yplot = a1+a2*xplot;    %linear regression equation

plot(x,y,'x',xplot,yplot,'linewidth',2);
hold on

string1 = sprintf('Regression: y = %.3f+%.3f*x',a1,a2);

text(1.5,0,string1,'fontsize',15);
string2 = sprintf('R2: %.4f',r2);
text(1.5,-2,string2,'fontsize',15);
hold off