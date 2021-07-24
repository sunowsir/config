cmake_minimum_required(VERSION 3.10) 

# set the project name 
project(slock) 

set(C_STANDARD 99)
set(VERSION "\\\"1.4\\\"")
set(CMAKE_INSTALL_PREFIX "/usr")
set(CMAKE_LIBRARY_PATH "/usr/lib/X11")
SET(CMAKE_C_FLAGS 
    "-pedantic \
    -Wall \
    -Ofast \
    -O2 \
    -D_DEFAULT_SOURCE \
    -DHAVE_SHADOW_H \
    -DVERSION=${VERSION} \
    -D_POSIX_C_SOURCE=200809L \
    -DXINERAMA \
    "
CACHE STRING "" FORCE)

include_directories( 
    /usr/include
    /usr/include/X11 
    /usr/include/freetype2 
)

add_executable(slock
    ./slock.c
    ./explicit_bzero.c
)

target_link_libraries(slock
    c
    X11 
    Xft 
    Xext
    crypt
    Xrandr
    Imlib2
    Xinerama
) 

install(TARGETS slock
    RUNTIME DESTINATION bin
    PERMISSIONS 
        OWNER_READ 
        OWNER_WRITE 
        OWNER_EXECUTE 
        GROUP_READ 
        GROUP_EXECUTE 
        WORLD_READ
        WORLD_EXECUTE
        SETUID
        SETGID
)

install(FILES 
    slock.1 DESTINATION share/man/man1
)

