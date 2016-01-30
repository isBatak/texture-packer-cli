package cmd.command;

import cmd.command.ICommand;
import cpp.Lib;
import sys.io.FileOutput;
import sys.FileSystem;
import cmd.helper.LogHelper;

import openfl.geom.Rectangle;
import openfl.utils.ByteArray;
import openfl.display.BitmapData;
import openfl.display.PNGEncoderOptions;

class PackCommand implements ICommand
{
  public var command(default, never):String = "pack";

  public var description(default, never):String = "Pack images from folder";

  private var _path:String;
  private var _ba:ByteArray;
  private var _bd:BitmapData;

  public function new(){}

	public function execute(cmd:String, args:Array<String>) : String
	{
        LogHelper.println(args.toString());

        loagImages(args[1]);

	   return "Hello! This is a pack command.";
	}

    @:noCompletion
	private function loagImages(path:String):Void
	{
		if (FileSystem.isDirectory(path)) {
			var files:Array<String> = FileSystem.readDirectory(path);
			for (file in files) {
				LogHelper.println(file);
			}
		}
		else {
			LogHelper.println("Nije folder");
		}
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

}
