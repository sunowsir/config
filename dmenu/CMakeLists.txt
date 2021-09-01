cmake_minimum_required(VERSION 3.10) 

# set the project name 
project(dmenu) 

set(C_STANDARD 99)
set(VERSION "\\\"5.0\\\"")
set(CMAKE_INSTALL_PREFIX "/usr")
set(CMAKE_LIBRARY_PATH "/usr/lib/X11")
SET(CMAKE_C_FLAGS 
    "-pedantic \
    -Wall \
    -O2 \
    -D_DEFAULT_SOURCE \
    -D_BSD_SOURCE \
    -D_XOPEN_SOURCE=700 \
    -D_POSIX_C_SOURCE=200809L \
    -DVERSION=${VERSION} \
    -DXINERAMA" 
CACHE STRING "" FORCE)

include_directories( 
    /usr/include/X11 
    /usr/include/freetype2 
)

add_executable(dmenu
    ./dmenu.c
    ./drw.c
    ./util.c
)

add_executable(stest 
    ./stest.c
)

target_link_libraries(dmenu
    m
    X11 
    Xft 
    Xinerama 
    fontconfig 
) 

target_link_libraries(stest
    m
    X11 
    Xft 
    Xinerama 
    fontconfig 
) 

install(TARGETS dmenu stest
    RUNTIME DESTINATION bin
)

install(FILES
    dmenu_run DESTINATION bin
    PERMISSIONS 
        OWNER_READ 
        OWNER_WRITE 
        OWNER_EXECUTE 
        GROUP_READ 
        GROUP_EXECUTE 
        WORLD_READ
        WORLD_EXECUTE
)

install(FILES
    dmenu_path DESTINATION bin
    PERMISSIONS 
        OWNER_READ 
        OWNER_WRITE 
        OWNER_EXECUTE 
        GROUP_READ 
        GROUP_EXECUTE 
        WORLD_READ
        WORLD_EXECUTE
)

install(FILES
    stest.1 DESTINATION share/man/man1
)

install(FILES 
    dmenu.1 DESTINATION share/man/man1
)

