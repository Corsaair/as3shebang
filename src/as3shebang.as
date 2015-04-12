
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
*/

package
{
    public var as3shebang:String = "0.0";

    public var scriptname:String = "";
}

import shell.Program;
import shell.Runtime;
import shell.FileSystem;
import C.stdlib.*;

var as3sbv:String = "0.9";
as3shebang = as3sbv;

if( Program.argv.length == 0 )
{
	trace( "[as3shebang " + as3sbv + "] no script arguments found" );
	exit( EXIT_FAILURE );
}

scriptname = Program.argv.shift();

var script:String = FileSystem.read( scriptname );
var source:String = "";

if( script.indexOf( "#!" ) == 0 )
{
	source = script.substring( script.indexOf( "\n" ) + 1 );
}
else
{
	trace( "[as3shebang " + as3sbv + "] no shebang found" );
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
