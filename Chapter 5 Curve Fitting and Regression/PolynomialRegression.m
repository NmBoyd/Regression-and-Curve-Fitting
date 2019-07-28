clc
clear all
%------------------------------------------------------

%plot y = x^2 from [-1, 1]
x = (-1:0.01:1);
y = x.^2;
N= length(x);
co_matrix = [N sum(x) sum(x.^2);...
    sum(x) sum(x.^2) sum(x.^3);...
    sum(x.^2) sum(x.^3) sum(x.^4)];
y_mat = [sum(y); sum(y.*x); sum(y.*x.^2)];
a1 = co_matrix \ y_mat;
hold on

%------------------------------------------------------------
%make sure the data file is in the working directory
%do poly regression for m = 2. y= a1+a2x+a3x^2
%calculate a1,a2,a3 and r^2 and plot data points as discrete markers
%and plot regression curve as line
xdata = xlsread('PolyRegressData.xlsx','A2:A41');
ydata = xlsread('PolyRegressData.xlsx','B2:B41');

n = length(xdata);
m = 2;

%calculate the constants
coeff_matrix = [n sum(xdata) sum(xdata.^2);...
    sum(xdata) sum(xdata.^2) sum(xdata.^3);...
    sum(xdata.^2) sum(xdata.^3) sum(xdata.^4)];

y_matrix = [sum(ydata); sum(ydata.*xdata); sum(ydata.*xdata.^2)];

a = (coeff_matrix)\(y_matrix);

%calculate the regression curve with test data
x_disc = (-10:0.01:10);
y_disc = a(1)+a(2).*x_disc + a(3).*x_disc.^2;

%graph the y = x^2
subplot(2,1,1);
plot(x,y,'linewidth',2);
legend('plot of x^2','location','northeast');

%graph the polynomial regression of the m =2 eq:
subplot(2,1,2);
plot(xdata,ydata,'x',x_disc,y_disc,'linewidth',2);
legend('datapoints','polynomial fit curve','location','northwest');
string1 = sprintf('Regression Result is: y=(%.4f)+(%.4f)x+(%.4f)x^2',a(1),a(2),a(3));
text(-0.5,5,string1,'fontsize',15);

%calculate r2
ybar = (sum(ydata)*1/n);
S = sum((ydata - a(1) - a(2).*xdata-a(3).*xdata.^2).^2);
So = sum((ydata-ybar).^2);
r2 = ((So - S)/So);

string2 = sprintf('R2 of the Regression is: (%.4f)',r2);
text(-5,10,string2,'fontsize',15);