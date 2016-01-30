package texturePacker.sheet;

import texturePacker.IAtlasPackage;
import openfl.display.IBitmapDrawable;

interface ISheet 
{
	function add(source:IBitmapDrawable):Void;
	function pack():IAtlasPackage;
}