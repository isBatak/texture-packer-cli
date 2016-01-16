package;

import cpp.Lib;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.utils.ByteArray;
import sys.io.FileOutput;
import sys.FileSystem;
import openfl.display.PNGEncoderOptions;
import cmd.processor.CmdProcessor;
import cmd.helper.LogHelper;
import cmd.command.PackCommand;

/**
 * ...
 * @author Ivica Batinić
 */
class Main
{
	private var _ba:ByteArray;
	private var _bd:BitmapData;

	private var _path:String = "../resources/textures";

	private var processor:CmdProcessor;

	static function main()
	{
        #if debug
        	new debugger.HaxeRemote(true, "localhost");
        #end

		var interpreter = new Main();
		interpreter.run();
	}

	public inline function new():Void
    {
		processor = new CmdProcessor();

		processor.addCommand(new PackCommand());
		// Lib.println(Sys.executablePath());
		// Lib.println(Lib.getBinDirectory());

		//Sys.getChar(true);

		//saveAtlas();

		// Lib.println(Sys.args());
		//
		// loagImages();
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

	@:noCompletion
	private function saveAtlas():Void
	{
		_bd = new BitmapData(1000, 1000);

		_ba = _bd.encode(new Rectangle(), new PNGEncoderOptions());

		var fo:FileOutput = sys.io.File.write("test.png", true);

		try {
			fo.writeString(_ba.toString());
			fo.close();
		}
		catch(e:Dynamic) {
			Lib.println(e);
		}

	}

	@:noCompletion
	private function loagImages():Void
	{
		if (FileSystem.isDirectory(_path)) {
			var files:Array<String> = FileSystem.readDirectory(_path);
			for (file in files) {
				Lib.println(file);
			}
		}
		else {
			Lib.println("Nije folder");
		}
	}
}
