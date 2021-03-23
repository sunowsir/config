cmake_minimum_required(VERSION 3.10) 

# set the project name 
project(dwm) 

# include_directories(src)

set(CMAKE_CXX_STANDARD 99)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../bin)
set(CMAKE_C_FLAGS " -L/usr/lib/X11 -lX11 -lXinerama -lfontconfig -lXft -lXrender -pedantic -Wall -Wno-deprecated-declarations -O2 -I/usr/include/X11 -I/usr/include/freetype2 -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L -D VERSION=${VERSION} -DXINERAMA")

add_executable(dwm
    ./drw.c
    ./dwm.c
    ./util.c
)

target_link_libraries(dwm) 
