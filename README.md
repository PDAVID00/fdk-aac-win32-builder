# libfdk-aac for Windows binary builder

libfdk-aac (0.1.6 and 2.0.2) and fdkaac tool (1.0.2) for Windows auto binary builder scripts.

[fdk-aac](https://github.com/mstorsjo/fdk-aac) is "A standalone library of the Fraunhofer FDK AAC code from Android."

[fdkaac](https://github.com/nu774/fdkaac) is "command line encoder frontend for libfdk-aac".

It'll build both:

* `libfdk-aac-1.dll`
* `libfdk-acc-2.dll`
* `fdkaac.exe` (**Linked libfdk-aac-2.dll**)

# How to use

1. Install [MSYS2](http://www.msys2.org/)
2. Open MSYS2 shell terminal.
  * Choose `MSYS2 MinGW-32bit` terminal if you wanna 32bit (i686) binary.
  * Choose `MSYS2 MinGW-64bit` terminal if you wanna 64bit (x86_64) binary.
  * DON'T USE `MSYS2` (unannoteted) terminal.
  
  ![Terminals](Images/terminals.png)
  
3. Update components by pacman. (See MSYS2 top page.)
4. Install development tools.
  * Execute `pacman -S mingw-w64-i686-gcc autoconf automake-wrapper make libtool` if you wanna 32bit binary.
  * Execute `pacman -S mingw-w64-x86_64-gcc autoconf automake-wrapper make libtool` if you wanna 64bit binary.
5. Execute `./setup.sh`, it'll download fdk-aac archive from [official opencore-amr project](https://sourceforge.net/projects/opencore-amr/) mirror, and extract reference files for testing purpose.
6. You can choose GCC's optimization option. See `CFLAGS` symbols in the head of `build.sh` file.
7. Execute `./build.sh`.

Finally, stored binaries into artifacts directory.
  * `artifacts/i686-w64-mingw32/` (32bit)
  * `artifacts/x86_64-w64-mingw32/` (64bit)

If you have to get results for PCM bits equality, you can execute `./test.sh` after building was successful. It'll use `cmp` command, so will show nothing output if these PCM files are verified. For example:

```sh
$ ./test.sh
[100%] 01:35.852/01:35.852 (87x), ETA 00:00.000
4227066/4227066 samples processed in 00:01.106
[100%] 01:35.852/01:35.852 (71x), ETA 00:00.000
4227066/4227066 samples processed in 00:01.352
[100%] 01:35.852/01:35.852 (68x), ETA 00:00.000
4227066/4227066 samples processed in 00:01.403
[100%] 01:35.852/01:35.852 (113x), ETA 00:00.000
4227066/4227066 samples processed in 00:00.848
[100%] 01:35.852/01:35.852 (69x), ETA 00:00.000
4227066/4227066 samples processed in 00:01.384
[100%] 01:35.852/01:35.852 (82x), ETA 00:00.000
4227066/4227066 samples processed in 00:01.176
[100%] 01:35.852/01:35.852 (101x), ETA 00:00.000
4227066/4227066 samples processed in 00:00.950
[100%] 01:35.852/01:35.852 (80x), ETA 00:00.000
4227066/4227066 samples processed in 00:01.203

$
```

# License

MIT, inside all contents except built binaries. See description for fdk-aac.
