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
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.catblack__png, true, 16, 16);
		animation.add("mover", [0, 1], 3, true);
		animation.add("morir", [2, 3, 4], 10, false);
	}
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		sePasa();
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
	override public function revive():Void{
		super.revive();
		Mover();
	}
	public function Mover():Void {
		y = 4;
		x = FlxG.width+width;
		velocity.x = -50;
		animation.play("mover");
	}
	public function sePasa():Void{
		if (x + width < 0){
			kill();
		}
	}
}