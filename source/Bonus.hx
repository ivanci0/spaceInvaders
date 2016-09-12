package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.tweens.FlxTween;

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
		animation.add("mover", [0, 1], 3, true);
		animation.add("morir", [2, 3, 4], 10, false);
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		
		if (x + width < 0){
			kill();
		}
	}
	override public function kill():Void{
		alive = false;
		FlxTween.tween(this, {}, .33, {onStart: Muriendo, onComplete: finishKill});
	}
	public function Muriendo(_):Void{
		animation.play("morir");
	}
	public function finishKill(_):Void{
		exists = false;
	}
	override public function revive():Void 
	{
		super.revive();
		Mover();
	}
	/*public function Posicionar():Void{
		x = 1000;
		y = 1000;
		velocity.y = 0;
		posicionada = true;
	}*/
	public function Mover():Void{
		x = FlxG.height+5;
		y = 10;
		velocity.x = -50;
		posicionada = false;
		animation.play("mover");
	}
	/*public function getPosicionada():Bool{
		return posicionada;
	}*/
}