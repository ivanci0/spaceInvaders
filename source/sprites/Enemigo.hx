package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(12, 12, 0xFFFF000F);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
	}
	
}