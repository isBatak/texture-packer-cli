package cmd.command;

import cmd.command.impl.ICommand;
import cpp.Lib;
import sys.io.FileOutput;
import sys.FileSystem;
import cmd.helper.LogHelper;

class PackCommand implements ICommand
{
  public var command(default, never):String = "pack";

  public var description(default, never):String = "Pack images from folder";

  private var _path:String;

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

}
