package texturepacker;

import texturepacker.IAtlasPackage;
import texturepacker.ITexturePacker;
import texturepacker.sheet.ISheet;
import texturepacker.sheet.Sheet;
import openfl.display.IBitmapDrawable;
import openfl.geom.Point;
import openfl.Vector;

class TexturePacker implements ITexturePacker
{
	public static var debug:Bool = false;
	public static var TARGET_TEXTURE_SIZE:Point = new Point(2048, 2048);
	public static var AUTO_INCREASE_TEXTURE_SIZE:Bool = false;

	public static var framePadding:Int = 0;
	public static var objectPadding:Int = 2;

	private var atlasPackage:IAtlasPackage;
	private var sources = new Vector<IBitmapDrawable>();
	private var sheets = new Vector<ISheet>();

	public function new(){}

	public function clear():Void
	{
		sources = new Vector<IBitmapDrawable>();
	}

	public function add(source:IBitmapDrawable):Void
	{
		sources.push(source);
	}

	public function pack():IAtlasPackage
	{
		var sheet:ISheet = new Sheet();
		for (i in 0...sources.length)
		{
			sheet.add(sources[i]);
		}
		return sheet.pack();
	}
}
