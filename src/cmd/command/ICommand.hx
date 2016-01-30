package cmd.command;

interface ICommand
{
  var command(default, never):String;
  var description(default, never):String;

  function execute(cmd:String, args:Array<String>):String;
}
