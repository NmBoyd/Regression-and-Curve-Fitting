clc
clear all

xdata = [0.2; 0.4; 0.6; 0.8; 1];  %create an array of vertical x data
ydata =[1.25; 1.11; 1.3; 1.55; 1.2];  %create vertical array of y data
one=ones(5,1);  %create a 5x1 array, all elements are 1

X = [one xdata xdata.^2 xdata.^3 xdata.^4];  %create a 4th degree polynomial matrix of xdata(=1+xn+xn^2+xn^3+xn^4)
a = X\ydata;    %use matrix left divide to solve system of equations. Create new array "a" based on the data provided

xplot=0.2:0.01:1.0; %create size of xdata for the plot

yplot=a(1)+a(2)*xplot+a(3)*xplot.^2+a(4)*xplot.^3+a(5)*xplot.^4;    %generate the y data for the plot from the a and xplot points

plot(xdata,ydata,'o',xplot,yplot,'linewidth',2);      %plot discrete data points xdata,ydata and connect
%the dots by interpolated data xplot,yplot
xlabel('x','fontsize',15);
ylabel('y','fontsize',15);
legend('Data Points','Polynomial Fit Curve','location','northwest');    %create leged in the Top Left (NW)
%northwest,southwest,northeast,southeast
