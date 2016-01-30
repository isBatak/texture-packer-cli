package;

import cpp.Lib;
import sys.io.FileOutput;
import sys.FileSystem;
import cmd.processor.CmdProcessor;
import cmd.helper.LogHelper;
import cmd.command.PackCommand;

/**
 * ...
 * @author Ivica Batinić
 */
class Main
{
	private var processor:CmdProcessor;

	static function main()
	{
        #if debug
        	//new debugger.HaxeRemote(true, "localhost");
        #end

		var interpreter = new Main();
		interpreter.run();
	}

	public inline function new():Void
    {
		processor = new CmdProcessor();

		processor.addCommand(new PackCommand());
    }

	public function run():Void
	{
        var command = getCommandFromSysArgs();
        try
        {
            var ret = processor.process(command, Sys.args());
            if( ret != null )
                LogHelper.println(ret+"\n");
            }
        catch (ex:CmdError)
        {
            LogHelper.error("Unknown Command");
        }
	}

	public function getCommandFromSysArgs():String
	{
        for(arg in Sys.args())
        {
            if(arg.charAt(0) == "-")
            {
                /// here you handle command config like -arg
            }
            else
            {
                return arg;
            }
        }

        return "help";
	}
}
