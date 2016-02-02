as3shebang – The ActionScript 3.0 Interpreter
=============================================

**as3shebang** is an executable program based on the RedTamarin runtime.

It allows you to run uncompiled ActionScript 3.0 source code
as an executable shell script.

The executable is totally independent of any other installed runtimes,
and so can be installed with Redtamarin runtimes in parallel or without them.


Install
-------

Download the package for your operating system

  - **Windows**  
    `as3shebang_1.0.0_win32.deb` for 32-bit systems  
    `as3shebang_1.0.0_win64.deb` for 64-bit systems
  - **Mac OS X**  
    `as3shebang_1.0.0_darwin-i386.deb` for 32-bit systems  
    `as3shebang_1.0.0_darwin-amd64.deb` for 64-bit systems
  - **Linux**  
    `as3shebang_1.0.0_i386.deb` for 32-bit systems  
    `as3shebang_1.0.0_amd64.deb` for 64-bit systems


### Windows Install

You will need a POSIX environment setup  
and may have to install `redtamarin-setup.bat` first  
see [Redtamarin Windows Environment Setup][RWES]

install  
`$ wpkg -i as3shebang_1.0.0_win64.deb`


### Mac OS X Install

You need the command-line tool `dpkg` installed  
either use [MacPorts][MACPORTS] `$ port install dpkg`
or [Brew][BREW] `$ brew install dpkg`

install  
`$ sudo dpkg -i as3shebang_1.0.0_darwin-amd64.deb`

If you receive some errors because of gnutar not found,
you can force the install with  
`$ sudo dpkg --force-all -i as3shebang_1.0.0_darwin-amd64.deb`


### Linux Install

`$ sudo dpkg -i as3shebang_1.0.0_amd64.deb`



Example
-------

Create a script  
`$ touch test`

Make it executable  
`$ chmod +x test`

Edit the script  
`$ nano test`

Starts the script with the shebang line
```as3
#!/usr/bin/as3shebang

// Use AS3 to write some shell scripts :)
import shell.Program;
import shell.Runtime;

trace( "hello world" );

trace( "    Program.type = " + Program.type );
trace( "Program.filename = " + Program.filename );
trace( "startupDirectory = " + Program.startupDirectory );
trace( "    Program args = " + Program.argv );
trace( "" );
trace( "Redtamarin v" + Runtime.version + " " + (Runtime.is64bit() ? "64-bit": "32-bit" ) );
```

Run the script  
`$ ./test`  
`$ ./test a b c`


[RWES]: https://github.com/Corsaair/redtamarin/wiki/RedtamarinWindowsEnvironmentSetup
[MACPORTS]: https://www.macports.org/
[BREW]: http://brew.sh/
