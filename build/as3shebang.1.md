% AS3SHEBANG(1) as3shebang-1.0 | As3shebang Documentation
% Zwetan Kjukov (zwetan (at) gmail (dot) com)
% 2nd February 2016

NAME
====

as3shebang – The ActionScript 3.0 Interpreter


SYNOPSIS
========

**as3shebang** [file]


DESCRIPTION
===========

**as3shebang** is an executable program based on the RedTamarin runtime.

It allows you to run uncompiled ActionScript 3.0 source code
as an executable shell script.

The executable is totally independent of any other installed runtimes,
and so can be installed with Redtamarin runtimes in parallel or without them.

OPTIONS
-------

There are no command-line options to the as3shebang executable.

IMPORTANT
---------

When running as a shell script the Redtamarin runtime change some
basic default behaviours.

**shebang line**  
your script HAVE TO define a first line  
`#!/usr/bin/as3shebang`

**Program.filename**  
will resolve to the shell script path  
not to the as3shebang executable path  
eg. "/usr/bin/as3shebang"

**Program.type**  
will be updated to ShellType.SCRIPT  
eg. the string "script"

**Some limitations**  
because the script is evaluated at runtime  
and not compiled, we do not support all AS3 features


EXAMPLES
========

Create a simple test script  
`$ touch test`

Edit it  
`$ nano test`
```
#!/usr/bin/as3shebang

trace( "hello world" );
```

Make the script executable  
`$ chmod +x test`

Run the shell script  
`$ ./test`

TIPS
====

How do you know if your program is running as a shell script?
```as3
#!/usr/bin/as3shebang
import shell.*;

if( Program.type == ShellType.SCRIPT )
{
	trace( "I'm a shell script" );
}
```


ERRORS
======

**as3shebang** is compiled with the redshell debug debugger,
if your shell script contain errors you will obtain a stacktrace.

Example:
```as3
#!/usr/bin/as3shebang

trace( "UNKNOWN = " + UNKNOWN );
```

Will output
```
ReferenceError: Error #1065: Variable UNKNOWN is not defined.
	at global$init()[:2]
	at shell::Runtime$/eval()
	at global$init()
```


BUGS
====

See GitHub Issues: https://github.com/Corsaair/as3shebang/issues


SEE ALSO
========

As3shebang Wiki: https://github.com/Corsaair/as3shebang/wiki  
Shebang (Unix):  https://en.wikipedia.org/wiki/Shebang_(Unix)
