package cmd.command;

import cmd.command.impl.ICommand;

class SayHelloCommand implements ICommand
{
	public var command(default, never):String = "hello";
	public var description(default, never):String = "Just Saying Hello with the current date";

  public function new(){}

	public function execute(cmd:String, args:Array<String>) : String
	{
	  return "Hello the date is : " + Date.now().toString();
	}

}
