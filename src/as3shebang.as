
/* as3shebang:
   command-line utility to run AS3 scripts as executable shell scripts

   install:
   copy the as3shebang executable into /usr/bin
   
   usage:
   1. create a script file
   $ touch myscript.as

   2. make it executable
   $ chmod +x myscript.as

   3. as first line of your script define the shebang line
   $ pico myscript.as
   --------
   #!/usr/bin/as3shebang -- 
   trace( "hello world" );
   --------

   4. run
   $ ./myscript.as

   note:
   - you have to use exactly '#!/usr/bin/as3shebang -- '
     the path followed by "--" is mandatory otherwise it will not works
     that means you can directly pass user arguments
     but also that you can not configure the redshell options
     the path can change, eg. "/usr/bin/as3shebang"
     it could be "/usr/local/bin/as3shebang" etc.
   - the argv[0] which should contains the script name is removed at runtime
   - you can find the script name in the global variable "scriptname"
   - you can find the as3sheabng version in the global variable "as3shebang"
*/

import shell.Program;
import shell.Runtime;
import shell.ShellType;
import shell.FileSystem;
import C.stdlib.*;

/*
trace( "A:" );
trace( "filename = " + Program.filename );
trace( "    argv = " + Program.argv );
trace( "    type = " + Program.type );
trace( "" );
*/

if( Program.argv.length == 0 )
{
	trace( "[as3shebang 1.0] no script arguments found" );
	exit( EXIT_FAILURE );
}


var scriptname:String = Program.argv.shift();
Program.AVM2::_filename = scriptname;
Program.AVM2::_type     = ShellType.SCRIPT;

if( (scriptname == undefined) || (scriptname == null) || (scriptname == "")
    || !FileSystem.exists( scriptname ) )
{
  trace( "[as3shebang 1.0] script \"" + scriptname + "\" not found" );
  exit( EXIT_FAILURE );
}

var script:String = FileSystem.read( scriptname );
var shebangline:String = "";
var source:String = "";

/*
trace( "B:" );
trace( "filename = " + Program.filename );
trace( "    argv = " + Program.argv );
trace( "    type = " + Program.type );
trace( "" );
*/

if( script.indexOf( "#!" ) == 0 )
{
	source = script.substring( script.indexOf( "\n" ) + 1 );
}
else
{
	trace( "[as3shebang 1.0] no shebang found" );
  exit( EXIT_FAILURE );
}

try
{
    Runtime.eval( source ); 
}
catch( e:Error )
{
    trace( e.getStackTrace() );
    exit( EXIT_FAILURE );
}

exit( EXIT_SUCCESS );
