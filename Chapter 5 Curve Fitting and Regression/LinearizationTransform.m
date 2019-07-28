clc
clear all

%import data from y=a*exp(bx)
xdata = xlsread('LinearizationData.xlsx','A2:A52');
ydata = xlsread('LinearizationData.xlsx','B2:B52');
n = length(xdata);

Y = log(ydata);
%find constants using cramers rule
A = [n sum(xdata); sum(xdata) sum(xdata.^2)];
A1 = [sum(Y) sum(xdata); sum(xdata.*Y) sum(xdata.^2)];
A1 = det(A1)/det(A);

A2 = [n sum(Y); sum(xdata) sum(xdata.*Y)];
A2 = det(A2)/det(A);

a = exp(A1);
b = A2;

%plot descernable curve for you regression function
x_disc = (-0.5:0.01:0.5);
y_disc = a * exp(b.*x_disc);

%graph and show the regression curve with the original data points
plot(xdata,ydata,'x',x_disc,y_disc,'linewidth',2);
legend('datapoints','fit curve','location','northwest');
string1 = sprintf('Regression Result is: y=(%.4f)*exp((%.4f)x)',a,b);
text(-0.5,5,string1,'fontsize',15);
hold on

%solve for r2
ybar = sum(ydata)*(1/n);
So = sum((ydata-ybar).^2);
S = sum((ydata-a*exp(b.*xdata)).^2);

r2 = (So-S)/So;
string2 = sprintf('R2: %.4f',r2);
text(-0.5,4,string2,'fontsize',15);
hold off
