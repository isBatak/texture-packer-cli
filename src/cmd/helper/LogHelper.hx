package cmd.helper;

class LogHelper
{
	public function new(){}

	public static function error(message:String):Void
	{
	    Sys.print("[ERROR]"+message);
	}

	public static function println(message:String):Void
	{
	    Sys.println("[INFO]"+message);
	}
}
