package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Personaje extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(5, 5);
		
	}
	
	override public function update(elapsed:Float):Void
 	{
 		super.update(elapsed);
 		
 		if (FlxG.keys.pressed.RIGHT)
 		{
 		if (x <= 155)
 			x += 2;
 		}
 			
 		if (FlxG.keys.pressed.LEFT)
 		{
 			if(x >= 0)
 			x -= 2;
 		}
 	}
}