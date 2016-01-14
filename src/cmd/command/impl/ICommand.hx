package cmd.command.impl;

interface ICommand
{
  function execute(cmd:String, args:Array<String>):String;
}
