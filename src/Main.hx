package;

import cpp.Lib;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.utils.ByteArray;
import sys.io.FileOutput;
import sys.FileSystem;
import openfl.display.PNGEncoderOptions;

/**
 * ...
 * @author Ivica Batinić
 */
class Main 
{
	private var _ba:ByteArray;
	private var _bd:BitmapData;
	
	private var _path:String = "E:/Programiranje/Haxe_Projects/simple_cmd/New Project/resources/textures";
	
	static function main() 
	{
		new Main();
	}
	
	public inline function new():Void
    {
		Lib.println(Sys.executablePath());
		Lib.println(Lib.getBinDirectory());
		
		Sys.getChar(true);
		
		//saveAtlas();
		
		loagImages();
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