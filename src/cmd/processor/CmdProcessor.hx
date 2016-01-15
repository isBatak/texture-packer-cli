package cmd.processor;

import cmd.helper.LogHelper;
import cmd.command.SayHelloCommand;
import cmd.command.impl.ICommand;

using Lambda;
using StringTools;

enum CmdError
{
  IncompleteStatement;
  InvalidStatement(msg :String);
}

class CmdProcessor
{
  private var commands:List<ICommand>;
  private var currentTime:Float;

	public function new()
	{
    commands = new List<ICommand>();

    addCommand(new SayHelloCommand());
	}

	public function addCommand(command:ICommand):Void
  {
    commands.add(command);
  }

  /**
  * process a line of user input
  **/
  public function process(cmd:String, args : Array<String>):String
  {
    var output:String;

    if( cmd.endsWith('\\') )
    {
      throw "IncompleteStatement";
    }

    /** If the command is help **/
    if( cmd == 'help' )
    {
      return printHelp();
    }

    /** Other commands **/
    for( c in commands )
    {
      if( c.command == cmd )
      {
        currentTime = Date.now().getTime();
        output = c.execute(cmd, args);
        LogHelper.println(' Time passed '+((Date.now().getTime()-currentTime)/1000)+' sec for command "$cmd"');
        return output;
      }
    }
    return 'Command ' + cmd + ' Not Found, try to type help for more info';
  }

  private function printHelp() :String
  {
    var ret : String = 'Awesome Shell  \n';

    for (c in commands)
    {
      ret += '\n--------------------------\n\n' + c.description ;
    }
    ret += '\n--------------------------\n';

    return ret;
  }
}
