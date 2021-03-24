cmake_minimum_required(VERSION 3.10) 

# set the project name 
project(st) 

set(C_STANDARD 99)
set(VERSION "\\\"0.8.3\\\"")
set(CMAKE_INSTALL_PREFIX "/usr")
set(CMAKE_LIBRARY_PATH "/usr/lib/X11")
SET(CMAKE_C_FLAGS 
    "-O1 \
    -O2 \
    -Wall \
    -D_XOPEN_SOURCE=600 \
    -DVERSION=${VERSION} \
    -fomit-frame-pointer"
CACHE STRING "" FORCE)

include_directories( 
    /usr/include/X11 
    /usr/include/libpng16
    /usr/include/glib-2.0 
    /usr/include/harfbuzz 
    /usr/include/freetype2 
    /usr/lib/glib-2.0/include
)

add_executable(st
    ./st.c
    ./x.c
    ./hb.c
)

target_link_libraries(st
    m
    rt
    X11 
    Xft 
    util
    Xrender
    freetype
    harfbuzz
    fontconfig
) 

install(TARGETS st
    RUNTIME DESTINATION bin
)

install(FILES
    st-copyout DESTINATION bin
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
    st.desktop DESTINATION share/applications
)

install(FILES 
    st.1 DESTINATION share/man/man1
)

