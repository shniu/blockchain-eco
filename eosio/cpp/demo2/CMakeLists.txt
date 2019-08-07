

cmake_minimum_required(VERSION 2.8)

project( Demo2 )

add_subdirectory(hello)

add_executable(demo2 main.cpp)

target_link_libraries(demo2 hello)

