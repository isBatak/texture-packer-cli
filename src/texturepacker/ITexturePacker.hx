package texturePacker;

import openfl.display.IBitmapDrawable;

interface ITexturePacker 
{
	function clear():Void;
	function add(source:IBitmapDrawable):Void;
	function pack():IAtlasPackage;
}