cmake_minimum_required(VERSION 3.4)

add_definitions(-std=c++0x)


include("cmake/HunterGate.cmake")

HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.251.tar.gz"
    SHA1 "5659b15dc0884d4b03dbd95710e6a1fa0fc3258d"
)

project(S)

hunter_add_package(Boost)

find_package(Boost CONFIG REQUIRED)

include_directories(solver_lib)
include_directories(formatter_ex_lib)
include_directories(print)

add_subdirectory(print)
add_subdirectory(solver_lib)
add_subdirectory(formatter_ex_lib)
add_executable(solver equation.cpp)

target_link_libraries(solver PUBLIC Boost::boost solver_lib formatter_ex)
