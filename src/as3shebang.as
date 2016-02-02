
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
   $ nano myscript.as
   --------
   #!/usr/bin/as3shebang
   trace( "hello world" );
   --------

   4. run
   $ ./myscript.as
*/

import shell.Program;
import shell.Runtime;
import shell.ShellType;
import shell.FileSystem;
import C.stdlib.*;

//DEBUG
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

//DEBUG
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
