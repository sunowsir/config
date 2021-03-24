cmake_minimum_required(VERSION 3.10) 

# set the project name 
project(dwm) 

set(C_STANDARD 99)
set(VERSION "\\\"6.2\\\"")
set(CMAKE_INSTALL_PREFIX "/usr")
set(CMAKE_LIBRARY_PATH "/usr/lib/X11")
SET(CMAKE_C_FLAGS 
    "-pedantic \
    -Wall \
    -Wno-deprecated-declarations \
    -O2 \
    -D_DEFAULT_SOURCE \
    -D_BSD_SOURCE \
    -D_POSIX_C_SOURCE=200809L \
    -DVERSION=${VERSION} \
    -DXINERAMA" 
CACHE STRING "" FORCE)

include_directories( 
    /usr/include/X11 
    /usr/include/freetype2 
)

add_executable(dwm
    ./drw.c
    ./dwm.c
    ./util.c
)

target_link_libraries(dwm
    X11 
    Xft 
    Xrender
    Xinerama 
    fontconfig 
) 

install(TARGETS dwm
    RUNTIME DESTINATION bin
)

install(FILES
    dwm.png DESTINATION share/pixmaps
)

install(FILES
    dwm.desktop DESTINATION share/xsessions
)

install(FILES 
    dwm.1 DESTINATION share/man/man1
)

