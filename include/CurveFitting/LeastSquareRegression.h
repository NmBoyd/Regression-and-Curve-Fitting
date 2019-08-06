#pragma once

#include <iostream>
#include <vector>

#include <eigen3/Eigen/Dense>

using namespace Eigen;
class LSRegression
{

    private:
        std::vector<Vector3d> data;

    protected:

    public:
        LSRegression();
        ~LSRegression();

        std::vector<double> CalculateConstants();
};