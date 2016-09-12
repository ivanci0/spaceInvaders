package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite
{
	private var thebadguyX:Int;
  	private var thebadguyY:Int;
  	private var thebadguyModifier:Bool;
 	private var equalizer:Int;
	private var elTimer:FlxTimer = new FlxTimer();
	private var reloj:Int = 2;
	public function new(?X:Float=0, ?Y:Float=0){
		super(X, Y);
	//	elTimer.start(1, Move, 0);
		loadGraphic(AssetPaths.singlecat__png, true, 16, 16);
		animation.add("mov", [0], 10, false);
		animation.add("mov2", [1], 10, false);
		animation.add("morir", [2, 3, 4, 5], 10, false);
  		thebadguyY = 8;
 		equalizer = 4;
	}
	
	override public function update(elapsed:Float):Void{
		super.update(elapsed);
	}
	override public function kill():Void{
		alive = false;
		FlxTween.tween(this, {}, .33, {onStart: Muriendo, onComplete: finishKill });
	}
	public function Muriendo(_):Void{
		animation.play("morir");
	}
	public function finishKill(_):Void{
		exists = false;
	}
	/*public function Move(timer:FlxTimer):Void{
		if (alive){
			if (reloj%2==0){
				animation.play("mov");
				reloj++;
			}
			else{
				animation.play("mov2");
				reloj--;
			}
			
			if (Reg.movementModifier == true){
				x += equalizer;
				y = Reg.superejeY;
			}
			if (Reg.movementModifier == false){
				x -= equalizer;
				y = Reg.superejeY;
			}
			if (x >= 155){
				Reg.movementModifier = false;
				Reg.superejeY += thebadguyY;
			}
			if (x == equalizer){
				Reg.movementModifier = true;
				Reg.superejeY += thebadguyY;
			}
		}
  	}*/
	
}