cmake_minimum_required(VERSION 3.1)
project(CurveFitting)
add_compile_options(-std=c++11) # CMake 2.8.12 or newer

find_package(PythonLibs 2.7)

include_directories(${PROJECT_NAME}_INCLUDE
    include
    "${PROJECT_SOURCE_DIR}/3rdparty/matplotlib-cpp/")

add_library(${PROJECT_NAME}_SRC
    "${PROJECT_SOURCE_DIR}/src/CurveFitting/LeastSquareRegression.cpp"
    "${PROJECT_SOURCE_DIR}/3rdparty/matplotlib-cpp/matplotlibcpp.h")

add_executable(example scripts/example.cpp)
target_include_directories(example PRIVATE ${PYTHON_INCLUDE_DIRS})
target_link_libraries(example PUBLIC ${PROJECT_NAME}_SRC ${PYTHON_LIBRARIES})
