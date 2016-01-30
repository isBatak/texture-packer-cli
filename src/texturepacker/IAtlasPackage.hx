package texturepacker;

import openfl.display.BitmapData;

interface IAtlasPackage 
{
    var bitmapData(get, null):BitmapData;
    var xml(get, null):Xml;
    var next(get, null):IAtlasPackage;
}