package cmd.command;

import cmd.command.impl.ICommand;
import cpp.Lib;
import sys.io.FileOutput;
import sys.FileSystem;

class PackCommand implements ICommand
{
  public var command(default, never):String = "pack";

  public var description(default, never):String = "Pack images from folder";

  private var _path:String;

  public function new(){}

	public function execute(cmd:String, args:Array<String>) : String
	{
	  return "Hello! This is a pack command.";
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
