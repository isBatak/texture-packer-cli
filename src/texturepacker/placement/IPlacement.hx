package texturepacker.placement;

import openfl.display.IBitmapDrawable;
import openfl.geom.Rectangle;

interface IPlacement 
{
	public var x(get, null):Float;
	public var y(get, null):Float;
	public var width(get, null):Float;
	public var height(get, null):Float;
	
	function place(source:IBitmapDrawable):Rectangle;
}