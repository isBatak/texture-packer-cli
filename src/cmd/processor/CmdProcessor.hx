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
  /** connecting command to a specific function */
  public static var commands : List<{ name:String, doc:String, command:ICommand }>;
  private var currentTime:Float;

	public function new()
	{
    commands = new List();

    addCommand('hello', SayHelloCommand.helpString, new SayHelloCommand());
	}

	function addCommand( name, doc, command ):Void
  {
    commands.add({ name : name, doc : doc, command : command });
  }

  /**
  * process a line of user input
  **/
  public function process(cmd : String, args : Array<String>):String
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
      if( c.name == cmd )
      {
        currentTime = Date.now().getTime();
        output = c.command.execute(cmd, args);
        LogHelper.println(' Time passed '+((Date.now().getTime()-currentTime)/1000)+' sec for command "$cmd"');
        return output;
      }
    }
    return 'Command ' + cmd + ' Not Found, try to type help for more info';
  }

  public static function printHelp() :String
  {
    var ret : String = 'Awesome Shell  \n';

    for (c in commands)
    {
      ret += '\n--------------------------\n\n' + c.doc ;
    }
    ret += '\n--------------------------\n';

    return ret;
  }
}
