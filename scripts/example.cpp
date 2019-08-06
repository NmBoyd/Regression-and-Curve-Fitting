#include <stdio.h>
#include <iostream>
#include <eigen3/Eigen/Dense>
#include "matplotlibcpp.h"
#include "CurveFitting/LeastSquareRegression.h"

int main(int argc, char** argv)
{
    std::cout << "Hello World" << std::endl;
    std::vector<double> valx, valy;
    valx.push_back(0);
    valy.push_back(0);
    valx.push_back(1);
    valy.push_back(2);
    valx.push_back(2);
    valy.push_back(2.5);
    
    // Set the size of output image = 1200x780 pixels
    matplotlibcpp::figure_size(1200, 780);

    matplotlibcpp::plot(valx, valy);
    matplotlibcpp::show();
    std::cout << "Finished" << std::endl;
}
