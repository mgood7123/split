export TERM=xterm-256color

# user
# /c/msys64/msys2_shell.cmd -defterm -here -no-start -msys2 -shell bash -c "pacman -S --noconfirm --needed cmake ninja gcc ; ./make.sh"

# we must build with gcc as msys2 libs require __data and __bss segments which clang does not provide
#
cmake -G "Unix Makefiles" $1 -DCMAKE_INSTALL_PREFIX=build/root_fs -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_COLOR_DIAGNOSTICS=ON -DCMAKE_COLOR_MAKEFILE=ON -S . -B build &&
cmake --build build &&
cmake --install build
