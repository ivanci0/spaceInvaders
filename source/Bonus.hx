package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author Ivan Baigorria
 */
class Bonus extends FlxSprite
{
	private var posicionada:Bool;
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.catblack__png, true, 16, 16);
		Mover();
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		
		if (x < 0) 
		{
			Posicionar();
			trace("in position");
		}
	}
	public function Posicionar():Void{
		x = 1000;
		y = 1000;
		velocity.y = 0;
		posicionada = true;
	}
	public function Mover():Void {
		x = FlxG.height+5;
		y = 10;
		velocity.x = -50;
		posicionada = false;
	}
	public function getPosicionada():Bool{
		return posicionada;
	}
}