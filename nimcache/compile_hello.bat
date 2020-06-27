gcc -c -w   -I/home/ponyatov/.choosenim/toolchains/nim-1.2.4/lib -I/home/ponyatov/nimbook/nimgw/src -o stdlib_io.nim.c.o stdlib_io.nim.c
gcc -c -w   -I/home/ponyatov/.choosenim/toolchains/nim-1.2.4/lib -I/home/ponyatov/nimbook/nimgw/src -o stdlib_system.nim.c.o stdlib_system.nim.c
gcc -c -w   -I/home/ponyatov/.choosenim/toolchains/nim-1.2.4/lib -I/home/ponyatov/nimbook/nimgw/src -o @mhello.nim.c.o @mhello.nim.c
i686-w64-mingw32-gcc.exe   -o hello  stdlib_io.nim.c.o stdlib_system.nim.c.o @mhello.nim.c.o    
