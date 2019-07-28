clc
clear all

xdata = [0.2; 0.4; 0.6; 0.8; 1];
ydata = [1.25; 1.1; 1.3; 1.55; 1.2];
y=0;
x=(0.2:0.01:1);
product = 1;

for i = 1:5
    product = 1;
    for j = 1:5
        if i == j
        else
            product = product.*(x - xdata(j))/(xdata(i)-xdata(j));  %product becomes an array 
        end
    end
    y = y+(product*ydata(i));
end


plot(xdata,ydata,'o',x,y,'linewidth',2);      %plot discrete data points xdata,ydata and connect
%the dots by interpolated data xplot,yplot
xlabel('x','fontsize',15);
ylabel('y','fontsize',15);
legend('Data Points','Polynomial Fit Curve','location','northwest');    %create leged in the Top Left (NW)
%northwest,southwest,northeast,southeast