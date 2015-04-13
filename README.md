as3shebang
==========

Run ActionScript 3.0 shell scripts.

This is an executable program based on the RedTamarin runtime,
designed to help you run ActionScript 3.0 shell scripts.

It allows you to run uncompiled ActionScript 3.0 source code or scripts
as an executable program.

As any shell scripts make the script executable
and use the following as first line:
```
#!/usr/bin/as3shebang --
```

Install
-------

Download the package for your operating system

**Ubuntu** / **Debian**

`$ sudo dpkg -i as3shebang_0.9-1_amd64.deb`

**Mac OS X**

Run `as3shebang_0.9-1.pkg`


**Manual**

If you build the executable yourself you can do a manual install

`sudo cp as3shebang /usr/bin`


Example
-------

Create a script
`$ touch test`

Make it executable
`$ chmod +x test`

Edit the script
`nano test`

Starts the script with the shebang line
and use the ActionScript 3.0 language
```as3
#!/usr/bin/as3shebang -- 

import shell.Program;
import shell.FileSystem;

trace( "hello world" );

for( var i:uint = 0; i < Program.argv.length; i++ )
{
	trace( "argv[" + i + "] = " + Program.argv[i] );
}

trace( "as3shebang = " + as3shebang );
trace( "scriptname = " + scriptname );
trace( "Program.filename = " + Program.filename );
trace( "startupDirectory = " + Program.startupDirectory );
```

Run the script
`$ ./test`


