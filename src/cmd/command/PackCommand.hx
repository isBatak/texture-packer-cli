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
import openfl.display.Loader;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.net.URLRequest;

import texturePacker.TexturePacker;
import texturePacker.IAtlasPackage;

class PackCommand implements ICommand
{
    public var command(default, never):String = "pack";

    public var description(default, never):String = "Pack images from folder";

    private var _path:String;
    private var _ba:ByteArray;
    private var _bd:BitmapData;
    private var _filesToPack:Int;
    private var _loadedFilesCount:Int;
    private var _packer:TexturePacker;
    private var _atlasPackage:IAtlasPackage;

    public function new(){}

	public function execute(cmd:String, args:Array<String>) : String
	{
        LogHelper.println(args.toString());
        
        _packer = new TexturePacker();

        loagImages(args[1]);

        return "Hello! This is a pack command.";
	}

    @:noCompletion
	private function loagImages(path:String):Void
	{
		if (FileSystem.isDirectory(path)) {
			var files:Array<String> = FileSystem.readDirectory(path);
            _filesToPack = files.length;
			for (file in files) {
				LogHelper.println(FileSystem.absolutePath(file));
                
                var loader = new Loader();
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_onComplete);
                loader.load(new URLRequest(file));
			}
		}
		else {
			LogHelper.println("Nije folder");
		}
	}
    
    private function loader_onComplete(event:Event):Void {
        _loadedFilesCount++;
        
        var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapdata;
        _packer.add(bitmapData);
        
        if(_loadedFilesCount == _filesToPack){
            _atlasPackage = _packer.pack();
            saveAtlas();
        }
    }
    
    @:noCompletion
	private function saveAtlas():Void
	{
		_bd = _atlasPackage.bitmapData;

		_ba = _bd.encode(new Rectangle(), new PNGEncoderOptions());

		var fo:FileOutput = sys.io.File.write("output.png", true);

		try {
			fo.writeString(_ba.toString());
			fo.close();
		}
		catch(e:Dynamic) {
			Lib.println(e);
		}

	}

}
